#!/usr/bin/env python3
"""
transfer_comments.py — Transfer comments from original Saboteur II disassembly to mod version

Uses opcode fingerprint matching to find relocated functions in the mod binary
and transfers inline comments from the richly-annotated original disassembly.

Algorithm:
1. Parse original .asm files → collect {address: inline_comment} and {address: header_block}
2. Extract instruction addresses from both original and mod .asm files
3. Build opcode fingerprint sequences from raw binaries (opcode identity, not operands)
4. Find matching runs of ≥8 instructions between original and mod
5. Build mod_addr → orig_addr mapping
6. Transfer inline comments and section headers to mod .asm files

Usage:
    cd modversion && python3 transfer_comments.py [--dry-run]
"""

import re
import os
import sys
from collections import defaultdict

BASE = 0x620C

# Paths (relative to modversion/)
ORIG_DIR = os.path.join('..', 'disassembly')
MOD_DIR = 'disassembly'
ORIG_BIN = os.path.join('..', 'block7_main.bin')
MOD_BIN = 'mod_decompressed.bin'

# All original code .asm files (comment sources)
ORIG_CODE_FILES = [
    'code_printcore.asm',
    'code_init.asm',
    'code_score.asm',
    'code_mainloop.asm',
    'code_input.asm',
    'code_mechanics.asm',
    'code_roomrender.asm',
    'code_interaction.asm',
    'code_behavior.asm',
    'code_objects.asm',
    'code_uimission.asm',
]

# Mod code .asm files to annotate
MOD_CODE_FILES = [
    'code_entry.asm',
    'code_infoscreen.asm',
    'code_newgame.asm',
    'code_input.asm',
    'code_engine.asm',
    'code_isr.asm',
]

# Regex patterns
ADDR_RE = re.compile(r'\t;([0-9a-f]{4,5})')
INLINE_COMMENT_RE = re.compile(r'\t;[0-9a-f]{4,5}\s+(;.+)$')

MIN_RUN = 6   # Minimum matching instructions for a valid match
KGRAM = 4     # K-gram size for initial seed matching


def load_binary(path):
    with open(path, 'rb') as f:
        return f.read()


def parse_comments(filepath):
    """Parse .asm file → {address: inline_comment_text}."""
    comments = {}
    with open(filepath) as f:
        for line in f:
            m = ADDR_RE.search(line)
            if not m:
                continue
            addr = int(m.group(1), 16)
            cm = INLINE_COMMENT_RE.search(line)
            if cm:
                comments[addr] = cm.group(1)
    return comments


def parse_headers(filepath):
    """Parse .asm file → {first_instr_addr: [header_comment_lines]}.

    A "header" is a comment block with ===== separator lines that
    precedes an instruction. Label lines between header and instruction
    are allowed (they don't break the association).
    """
    headers = {}
    pending = []
    in_header = False

    with open(filepath) as f:
        for line in f:
            stripped = line.rstrip('\n')
            clean = stripped.lstrip()

            if clean.startswith(';'):
                pending.append(stripped)
                if '=====' in clean:
                    in_header = True
            elif ADDR_RE.search(line):
                # Instruction line — associate any pending header
                if pending and in_header:
                    addr = int(ADDR_RE.search(line).group(1), 16)
                    headers[addr] = pending[:]
                pending = []
                in_header = False
            elif stripped.strip() == '' or (':' in stripped and not clean.startswith(';')):
                # Blank line or label — keep accumulating
                if pending:
                    pending.append(stripped)
            else:
                pending = []
                in_header = False

    return headers


def parse_instruction_addrs(filepath):
    """Extract ordered list of instruction addresses from .asm file."""
    addrs = []
    with open(filepath) as f:
        for line in f:
            m = ADDR_RE.search(line)
            if m:
                addrs.append(int(m.group(1), 16))
    return addrs


def get_fingerprint(binary, offset, length):
    """Opcode fingerprint: bytes that identify the instruction, ignoring operands.

    - Unprefixed: first byte only
    - CB/ED prefix: first 2 bytes
    - DD/FD prefix: first 2 bytes (or bytes 0,1,3 for DD CB / FD CB)
    """
    if offset < 0 or offset + length > len(binary):
        return None
    b0 = binary[offset]
    if b0 in (0xDD, 0xFD) and length >= 2:
        b1 = binary[offset + 1]
        if b1 == 0xCB and length >= 4:
            return (b0, 0xCB, binary[offset + 3])
        return (b0, b1)
    elif b0 in (0xCB, 0xED) and length >= 2:
        return (b0, binary[offset + 1])
    return (b0,)


def build_fingerprint_sequence(addrs, binary):
    """Build [(addr, fingerprint), ...] from instruction addresses and binary data."""
    seq = []
    for i, addr in enumerate(addrs):
        next_addr = addrs[i + 1] if i + 1 < len(addrs) else addr + 1
        length = next_addr - addr
        if length < 1:
            continue
        if length > 4:
            length = min(length, 4)
        offset = addr - BASE
        fp = get_fingerprint(binary, offset, length)
        if fp is not None:
            seq.append((addr, fp))
    return seq


def find_matching_runs(orig_seq, mod_seq):
    """Find matching opcode fingerprint runs between original and mod.

    Uses k-gram seed + extend approach with greedy longest-first selection.
    Returns sorted list of (orig_start_idx, mod_start_idx, run_length).
    """
    K = KGRAM

    # Build k-gram index of original
    orig_index = defaultdict(list)
    for i in range(len(orig_seq) - K + 1):
        key = tuple(orig_seq[j][1] for j in range(i, i + K))
        orig_index[key].append(i)

    # Find all candidate matches
    candidates = []
    seen = set()  # (oi_start, mi_start) to avoid duplicates

    for mi in range(len(mod_seq) - K + 1):
        key = tuple(mod_seq[j][1] for j in range(mi, mi + K))
        if key not in orig_index:
            continue

        for oi in orig_index[key]:
            # Extend forward from seed
            fwd = K
            while (mi + fwd < len(mod_seq) and
                   oi + fwd < len(orig_seq) and
                   mod_seq[mi + fwd][1] == orig_seq[oi + fwd][1]):
                fwd += 1

            # Extend backward from seed
            back = 0
            while (mi - back - 1 >= 0 and
                   oi - back - 1 >= 0 and
                   mod_seq[mi - back - 1][1] == orig_seq[oi - back - 1][1]):
                back += 1

            total = back + fwd
            oi_start = oi - back
            mi_start = mi - back

            if total >= MIN_RUN and (oi_start, mi_start) not in seen:
                candidates.append((oi_start, mi_start, total))
                seen.add((oi_start, mi_start))

    # Greedy longest-first non-overlapping selection
    candidates.sort(key=lambda x: -x[2])
    mod_used = set()
    orig_used = set()
    matches = []

    for oi, mi, length in candidates:
        mod_range = set(range(mi, mi + length))
        orig_range = set(range(oi, oi + length))

        if mod_range & mod_used or orig_range & orig_used:
            continue

        matches.append((oi, mi, length))
        mod_used |= mod_range
        orig_used |= orig_range

    return sorted(matches, key=lambda x: x[1])


def transfer_to_file(filepath, addr_mapping, all_comments, all_headers, run_start_addrs):
    """Transfer comments to a mod .asm file. Returns (comments_added, headers_added)."""
    with open(filepath) as f:
        lines = f.readlines()

    new_lines = []
    comments_added = 0
    headers_added = 0

    for line in lines:
        m = ADDR_RE.search(line)
        if m:
            addr = int(m.group(1), 16)
            orig_addr = addr_mapping.get(addr)

            # Insert section header before first instruction of a matched run
            if (orig_addr and orig_addr in all_headers
                    and addr in run_start_addrs):
                for hline in all_headers[orig_addr]:
                    # Only transfer comment and blank lines, skip labels
                    clean = hline.lstrip()
                    if clean.startswith(';') or clean == '':
                        new_lines.append(hline + '\n')
                headers_added += 1

            # Transfer inline comment
            if orig_addr and orig_addr in all_comments:
                if not INLINE_COMMENT_RE.search(line):
                    stripped = line.rstrip('\n')
                    comment = all_comments[orig_addr]
                    new_lines.append(f"{stripped}  {comment}\n")
                    comments_added += 1
                    continue

        new_lines.append(line)

    return new_lines, comments_added, headers_added


def main():
    dry_run = '--dry-run' in sys.argv

    orig_bin = load_binary(ORIG_BIN)
    mod_bin = load_binary(MOD_BIN)

    # === Phase 1: Collect original comments ===
    print("Phase 1: Parsing original comments...")
    all_comments = {}
    all_headers = {}
    for fname in ORIG_CODE_FILES:
        path = os.path.join(ORIG_DIR, fname)
        if not os.path.exists(path):
            print(f"  WARNING: {path} not found, skipping")
            continue
        comments = parse_comments(path)
        headers = parse_headers(path)
        all_comments.update(comments)
        all_headers.update(headers)
        print(f"  {fname}: {len(comments)} inline comments, {len(headers)} section headers")

    print(f"  TOTAL: {len(all_comments)} inline comments, {len(all_headers)} section headers\n")

    # === Phase 2: Build fingerprint sequences ===
    print("Phase 2: Building instruction sequences...")

    orig_addrs = []
    for fname in ORIG_CODE_FILES:
        path = os.path.join(ORIG_DIR, fname)
        if os.path.exists(path):
            orig_addrs.extend(parse_instruction_addrs(path))
    orig_addrs.sort()
    orig_seq = build_fingerprint_sequence(orig_addrs, orig_bin)
    print(f"  Original: {len(orig_seq)} instructions")

    mod_seqs = {}
    for fname in MOD_CODE_FILES:
        path = os.path.join(MOD_DIR, fname)
        if not os.path.exists(path):
            continue
        addrs = parse_instruction_addrs(path)
        seq = build_fingerprint_sequence(addrs, mod_bin)
        mod_seqs[fname] = seq
        print(f"  Mod {fname}: {len(seq)} instructions")

    # === Phase 3: Find matching runs ===
    print(f"\nPhase 3: Finding matching runs (min_run={MIN_RUN})...")

    addr_mapping = {}
    run_start_addrs = set()
    total_matched = 0
    total_runs = 0

    for fname, mod_seq in mod_seqs.items():
        matches = find_matching_runs(orig_seq, mod_seq)
        file_matched = 0

        for oi_start, mi_start, length in matches:
            run_start_addrs.add(mod_seq[mi_start][0])
            for k in range(length):
                orig_addr = orig_seq[oi_start + k][0]
                mod_addr = mod_seq[mi_start + k][0]
                addr_mapping[mod_addr] = orig_addr
            file_matched += length

        total_matched += file_matched
        total_runs += len(matches)

        if matches:
            print(f"\n  {fname}: {len(matches)} runs, {file_matched} instructions matched")
            for oi_start, mi_start, length in sorted(matches, key=lambda x: -x[2])[:10]:
                os_addr = orig_seq[oi_start][0]
                oe_addr = orig_seq[oi_start + length - 1][0]
                ms_addr = mod_seq[mi_start][0]
                me_addr = mod_seq[mi_start + length - 1][0]
                print(f"    mod ${ms_addr:04X}-${me_addr:04X} ← orig ${os_addr:04X}-${oe_addr:04X} ({length} instrs)")
        else:
            print(f"\n  {fname}: no matches")

    transferable = sum(1 for ma in addr_mapping if addr_mapping[ma] in all_comments)
    print(f"\n  TOTAL: {total_runs} runs, {total_matched} instructions matched")
    print(f"  Transferable: {transferable} inline comments\n")

    if total_matched == 0:
        print("No matches found. Nothing to transfer.")
        return

    # === Phase 4: Transfer comments ===
    action = "Would transfer" if dry_run else "Transferring"
    print(f"Phase 4: {action} comments to mod files...")

    total_comments = 0
    total_headers = 0

    for fname in MOD_CODE_FILES:
        path = os.path.join(MOD_DIR, fname)
        if not os.path.exists(path):
            continue
        new_lines, c_added, h_added = transfer_to_file(
            path, addr_mapping, all_comments, all_headers, run_start_addrs
        )
        if c_added or h_added:
            if not dry_run:
                with open(path, 'w') as f:
                    f.writelines(new_lines)
            print(f"  {fname}: {c_added} comments, {h_added} headers {'(dry-run)' if dry_run else 'written'}")
        total_comments += c_added
        total_headers += h_added

    print(f"\n  TOTAL: {total_comments} inline comments, {total_headers} section headers transferred")
    print(f"\n{'DRY RUN complete.' if dry_run else 'Done!'}")


if __name__ == '__main__':
    main()
