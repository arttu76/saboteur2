#!/usr/bin/env python3
"""
Saboteur II Mod — Split Disassembly into Annotated Files
=========================================================
Re-disassembles mod_decompressed.bin with proper code/data block
definitions, splits into 18 .asm files with file headers, ASCII
annotations for text data, and comment transfer from the original
disassembly for preserved code sections.

Usage: python3 split_mod.py
"""

import os
import re
import subprocess
import sys
import tempfile

# === PATHS ===

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(BASE_DIR)
MOD_BIN = os.path.join(BASE_DIR, "mod_decompressed.bin")
ORIG_BIN = os.path.join(PROJECT_DIR, "block7_main.bin")
ORIG_ASM_DIR = os.path.join(PROJECT_DIR, "disassembly")
OUT_DIR = os.path.join(BASE_DIR, "disassembly")

ORG = 0x620C
ORIG_ORG = 0x620C

# === Z80DASM BLOCK DEFINITIONS ===
# (name, start, end_exclusive, "code"|"bytedata")

BLOCKS = [
    ("entry",     0x620C, 0x620F, "code"),
    ("text",      0x620F, 0x6A09, "bytedata"),
    ("rooms",     0x6A09, 0x820C, "bytedata"),
    ("tab1",      0x820C, 0x8574, "bytedata"),
    ("init_code", 0x8574, 0x864D, "code"),
    ("init_data", 0x864D, 0x865D, "bytedata"),
    ("hiscores",  0x865D, 0x8D5E, "bytedata"),
    ("info_text", 0x8D5E, 0x900C, "bytedata"),
    ("info_code", 0x900C, 0x90EC, "code"),
    ("new_code",  0x90EC, 0x964C, "code"),
    ("tab2",      0x964C, 0xA04C, "bytedata"),
    ("entities",  0xA04C, 0xAA8C, "bytedata"),
    ("sprites",   0xAA8C, 0xB4CC, "bytedata"),
    ("input",     0xB4CC, 0xB80C, "code"),
    ("engine",    0xB80C, 0xE0E0, "code"),
    ("buf1",      0xE0E0, 0xE8E8, "bytedata"),
    ("gfx",       0xE8E8, 0xF80C, "bytedata"),
    ("newtab",    0xF80C, 0xFB10, "bytedata"),
    ("isr_code",  0xFB10, 0xFE1D, "code"),
    ("snd_data",  0xFE1D, 0xFFF4, "bytedata"),
    ("im2_jp",    0xFFF4, 0xFFFC, "bytedata"),  # padding, overwritten at runtime by ISR init
]

# === OUTPUT FILE SECTIONS ===
# (filename, start, end_exclusive)

SECTIONS = [
    ("entry_jump.asm",      0x620C, 0x620F),
    ("data_text.asm",       0x620F, 0x6A09),
    ("data_rooms.asm",      0x6A09, 0x820C),
    ("data_tables1.asm",    0x820C, 0x8574),
    ("code_entry.asm",      0x8574, 0x865D),
    ("data_highscores.asm", 0x865D, 0x8D5E),
    ("data_infoscreen.asm", 0x8D5E, 0x900C),
    ("code_infoscreen.asm", 0x900C, 0x90EC),
    ("code_newgame.asm",    0x90EC, 0x964C),
    ("data_tables2.asm",    0x964C, 0xA04C),
    ("data_entities.asm",   0xA04C, 0xAA8C),
    ("data_sprites.asm",    0xAA8C, 0xB4CC),
    ("code_input.asm",      0xB4CC, 0xB80C),
    ("code_engine.asm",     0xB80C, 0xE0E0),
    ("data_buffer.asm",     0xE0E0, 0xE8E8),
    ("data_gfx.asm",        0xE8E8, 0xF80C),
    ("data_newtables.asm",  0xF80C, 0xFB10),
    ("code_isr.asm",        0xFB10, 0xFFFC),
]

# === SECTION METADATA ===
# filename -> (title, [description lines])

SECTION_INFO = {
    "entry_jump.asm": (
        "Entry Point Jump",
        ["Single JP instruction redirecting to the main initialization at $8574.",
         "In the original 128K version, $620C contained the full initialization",
         "sequence. The mod moves init to $8574 to make room for packed data."]
    ),
    "data_text.asm": (
        "Mission Text, HUD Strings, Menu Options & Game Messages",
        ["All game text consolidated at the start of the binary.",
         "Contains mission briefing text, HUD strings, endgame messages,",
         "menu options, mission code names, and title credits.",
         "Origin: data_missions, data_hud, data_endgame, data_highscores,",
         "        code_init, code_uimission, code_score + NEW content"]
    ),
    "data_rooms.asm": (
        "Room Definitions & Lookup Tables",
        ["Room layout data defining the game world. 98% new content.",
         "Contains room address lookup tables (pointer arrays) and",
         "32-byte room definition blocks. Almost entirely new level",
         "designs compared to the original."]
    ),
    "data_tables1.asm": (
        "Entity/Sprite Data Tables",
        ["Sprite lookup tables, entity type data, and rendering parameters.",
         "Origin: data_entityspawn, data_spritebitmap, code_roomrender (partial)"]
    ),
    "code_entry.asm": (
        "Entry Point & Initialization (NEW)",
        ["New entry point for the mod. Sets up the system, displays loading",
         "screen, initializes attributes, and jumps to game initialization.",
         "Replaces the original's initialization at $620C."]
    ),
    "data_highscores.asm": (
        "High Score Tables #2-#6",
        ["Default high score tables for difficulty levels 2 through 6.",
         "Each table: 16 entries of 16 bytes (6-digit score + 10-char name).",
         "Names include: 5 ALIVE, KATO, DOUGAL, EMPEROR, DYNAMO, WHIZ, etc.",
         "Origin: data_highscores.asm (preserved)"]
    ),
    "data_infoscreen.asm": (
        "Info Screen Text & Layout (NEW)",
        ["Text and attribute data for the mod's info/credits screen.",
         "Includes version string, credits, feature description, and",
         "key binding help (CS+P: pause, CS+S: speed)."]
    ),
    "code_infoscreen.asm": (
        "Info Screen Display & Input (NEW)",
        ["Code to display the info/credits screen and handle input.",
         "Called during startup before the main menu."]
    ),
    "code_newgame.asm": (
        "New Game Logic & ZX0 Decompressor (NEW)",
        ["New game initialization code and ZX0-style data decompression",
         "routines. Handles modified game setup and UI logic."]
    ),
    "data_tables2.asm": (
        "Rendering Tables, Character Set & Tile Data",
        ["Attribute/color mapping tables, ASCII character set bitmaps,",
         "tile definition tables, and score digit rendering data.",
         "Origin: code_roomrender, data_spritebitmap, code_mechanics,",
         "        code_score, data_hud (mostly preserved)"]
    ),
    "data_entities.asm": (
        "Entity Spawn & Behavior Data",
        ["Entity placement tables, handler jump tables, and behavior data.",
         "Partially preserved from the original, partially reworked with",
         "new entity placement for the redesigned levels.",
         "Origin: data_entityspawn, code_mainloop + NEW"]
    ),
    "data_sprites.asm": (
        "Sprite Bitmap Data",
        ["Character sprites, animation frames, and item graphics.",
         "74% preserved from the original, 26% modified/new.",
         "Includes guard sprites, ninja sprites, vehicles, items, scenery.",
         "Origin: data_spritebitmap + NEW"]
    ),
    "code_input.asm": (
        "Input Handling & Game Mechanics (Preserved)",
        ["Keyboard/joystick input handling and core game mechanics.",
         "Largely preserved from the original code_input.asm and",
         "code_mechanics.asm, relocated from $EE0C/$980C area.",
         "Contains: key redefinition, menu input, mission code entry,",
         "movement computation, entity mechanics."]
    ),
    "code_engine.asm": (
        "Main Game Engine (Mostly NEW)",
        ["The bulk of the game engine: object management, entity behavior,",
         "interaction code, score/render routines, room rendering, main",
         "game loop, and beeper sound effects.",
         "Extensively rewritten with bug fixes, improved game balance,",
         "speed control (CS+S), pause (CS+P), and beeper sound calls."]
    ),
    "data_buffer.asm": (
        "Runtime Scratch Buffer",
        ["2056 bytes of zeroed memory used as runtime scratch space.",
         "Zeroed on startup, used during gameplay for temporary data."]
    ),
    "data_gfx.asm": (
        "Sprite Bitmaps, Font & Handler Data",
        ["Large block of preserved graphics and data:",
         "- Sprite bitmap data (guards, ninja, items, vehicles, scenery)",
         "- 8x9 font character bitmaps",
         "- Font rendering helper data",
         "- Handler/rendering code stored as data tables",
         "Origin: data_spritebitmap, data_endgame, font bitmaps,",
         "        data_handlers (mostly preserved)"]
    ),
    "data_newtables.asm": (
        "New Lookup Tables & Runtime Buffer",
        ["Lookup tables for new features (speed levels, beeper frequencies)",
         "followed by a 532-byte runtime buffer for timer/sound state."]
    ),
    "code_isr.asm": (
        "ISR, Speed Engine, Beeper Driver & Sound Data (NEW)",
        ["Complete new interrupt-driven system replacing the original's",
         "AY-3-8912 sound engine:",
         "- IM2 initialization (I=$3B, JP at $FFF4)",
         "- Game speed engine with frame timing",
         "- Keyboard scan (CS+P pause, CS+S speed cycle)",
         "- Beeper tone generator (OUT ($FE) driven)",
         "- ISR at $FD34: EX AF/EXX register banking, DJNZ speed counter",
         "- Sound data tables: note frequencies, effect patterns, durations",
         "- IM2 target JP $FD34 at $FFF4"]
    ),
}

# Comment transfer disabled: the mod rewrote nearly all code, so opcode
# matching produces false positives. Only data sections are truly preserved
# (sprites, fonts, tables) and those get ASCII annotations instead.
COMMENT_TRANSFERS = []


# =====================================================================
# PHASE 1: Re-disassemble with block definitions
# =====================================================================

def redisassemble():
    """Run z80dasm with block definitions, return output lines."""
    # Write block definition file
    block_fd, block_path = tempfile.mkstemp(suffix=".blocks")
    with os.fdopen(block_fd, 'w') as f:
        for name, start, end, btype in BLOCKS:
            f.write(f"{name}: start 0x{start:04X} end 0x{end:04X} type {btype}\n")

    # Run z80dasm
    out_fd, out_path = tempfile.mkstemp(suffix=".asm")
    os.close(out_fd)

    cmd = [
        "z80dasm", "-a", "-l", "-u",
        "-g", f"0x{ORG:04X}",
        "-b", block_path,
        "-o", out_path,
        MOD_BIN
    ]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"  z80dasm error: {result.stderr}")
        sys.exit(1)

    with open(out_path) as f:
        lines = f.readlines()

    os.unlink(block_path)
    os.unlink(out_path)

    return lines


# =====================================================================
# PHASE 2: Parse disassembly output
# =====================================================================

ADDR_RE = re.compile(r'\t;([0-9a-f]{4,5})')
LABEL_RE = re.compile(r'^(l[0-9a-f]{4,5}h):')
BLOCK_COMMENT_RE = re.compile(r"^; BLOCK '(\w+)'")

# Build address lookup for block start/end labels
BLOCK_LABEL_ADDRS = {}
for _name, _start, _end, _ in BLOCKS:
    BLOCK_LABEL_ADDRS[f"{_name}_start"] = _start
    BLOCK_LABEL_ADDRS[f"{_name}_end"] = _end

def get_line_addr(line):
    """Extract hex address from a line's ;XXXX annotation, label, or block label."""
    m = ADDR_RE.search(line)
    if m:
        return int(m.group(1), 16)
    stripped = line.strip()
    m = LABEL_RE.match(stripped)
    if m:
        return int(m.group(1)[1:-1], 16)  # strip 'l' and 'h'
    # Block start/end labels
    m = re.match(r'^(\w+):', stripped)
    if m and m.group(1) in BLOCK_LABEL_ADDRS:
        return BLOCK_LABEL_ADDRS[m.group(1)]
    return None


def parse_lines(raw_lines):
    """Parse z80dasm output, stripping headers and block comment lines.
    Keeps block start/end labels (they're referenced by code).
    Returns list of (address_or_none, cleaned_line) tuples."""
    parsed = []
    skip_header = True

    for line in raw_lines:
        line = line.rstrip('\n')

        # Skip z80dasm header lines
        if skip_header:
            if line.startswith('; z80dasm') or line.startswith('; command'):
                continue
            if line.strip() == '':
                continue
            if line.strip().startswith('org'):
                continue
            skip_header = False

        # Skip block marker comment lines (but keep block labels)
        if BLOCK_COMMENT_RE.match(line):
            continue

        addr = get_line_addr(line)
        parsed.append((addr, line))

    return parsed


# =====================================================================
# PHASE 3: Split into sections
# =====================================================================

def split_into_sections(parsed_lines):
    """Split parsed lines into section buckets by address range.
    Returns dict: filename -> list of lines."""

    section_data = {fname: [] for fname, _, _ in SECTIONS}

    # Build sorted section list for lookup
    sec_list = [(start, end, fname) for fname, start, end in SECTIONS]

    def find_section(addr):
        for start, end, fname in sec_list:
            if start <= addr < end:
                return fname
        return None

    current_section = None
    pending = []  # lines with no address, waiting assignment

    for addr, line in parsed_lines:
        if addr is not None:
            section = find_section(addr)
            if section is not None:
                current_section = section
                # Flush pending lines to this section
                for p in pending:
                    section_data[current_section].append(p)
                pending = []
                section_data[current_section].append(line)
            elif current_section:
                section_data[current_section].append(line)
        else:
            if current_section:
                # Check if this could be a label for the next section
                # For now, assign to current section
                pending.append(line)
            else:
                pending.append(line)

    # Flush any remaining pending
    if current_section and pending:
        for p in pending:
            section_data[current_section].append(p)

    return section_data


# =====================================================================
# PHASE 4a: ASCII annotation for data sections
# =====================================================================

DEFB_RE = re.compile(r'^(\tdefb 0([0-9a-f]{2})h\s*)(;[0-9a-f]{4,5}.*)$')

def annotate_data(lines):
    """Add ASCII character annotations and block text comments to defb lines."""
    output = []
    text_chars = []
    text_lines = []
    zero_count = 0
    zero_lines = []

    def flush_text():
        nonlocal text_chars, text_lines
        if len(text_chars) >= 4:
            text = ''.join(text_chars)
            if len(text) <= 60:
                output.append(f'; "{text}"')
            else:
                output.append(f'; "{text[:57]}"...')
        output.extend(text_lines)
        text_chars = []
        text_lines = []

    def flush_zeros():
        nonlocal zero_count, zero_lines
        if zero_count >= 8:
            output.append(f'; --- {zero_count} zero bytes ---')
        output.extend(zero_lines)
        zero_count = 0
        zero_lines = []

    for line in lines:
        m = DEFB_RE.match(line)
        if m:
            byte_val = int(m.group(2), 16)

            if byte_val == 0:
                flush_text()
                zero_count += 1
                zero_lines.append(line)
                continue

            flush_zeros()

            if 0x20 <= byte_val <= 0x7E:
                char = chr(byte_val)
                if byte_val == 0x60:
                    display = "'`' (Spectrum: GBP)"
                else:
                    display = f"'{char}'"
                annotated = m.group(1) + m.group(3) + f"  {display}"
                text_chars.append(char)
                text_lines.append(annotated)
                continue
            else:
                flush_text()
                output.append(line)
                continue

        # Non-defb line
        # Labels don't break text runs
        if line.strip() and LABEL_RE.match(line.strip()):
            if text_chars:
                text_lines.append(line)
                continue
            elif zero_count:
                zero_lines.append(line)
                continue

        flush_text()
        flush_zeros()
        output.append(line)

    flush_text()
    flush_zeros()
    return output


# =====================================================================
# PHASE 4b: Comment transfer from original disassembly
# =====================================================================

def load_original_comments(filepath):
    """Parse an original .asm file and extract:
    - inline_comments: dict addr -> comment string
    - section_comments: list of (before_addr, [comment_lines])
    """
    inline_comments = {}
    section_comments = []

    with open(filepath) as f:
        raw_lines = f.readlines()

    pending_section = []
    in_file_header = True

    for line in raw_lines:
        stripped = line.rstrip('\n')

        # File header ends at first non-comment, non-blank line
        if in_file_header:
            if stripped.startswith(';') or stripped.strip() == '':
                continue
            in_file_header = False

        # Section/block comment lines
        if stripped.lstrip().startswith(';') and not ADDR_RE.search(stripped):
            pending_section.append(stripped)
            continue

        # Blank lines within section comments
        if stripped.strip() == '':
            if pending_section:
                pending_section.append('')
            continue

        # Instruction/defb line with address
        addr_match = re.search(r';([0-9a-f]{4,5})', stripped)
        if addr_match:
            addr = int(addr_match.group(1), 16)

            # Check for inline comment (second ; after address)
            comment_match = re.search(r';[0-9a-f]{4,5}\s+(;.*)', stripped)
            if comment_match:
                inline_comments[addr] = comment_match.group(1)

            # Save pending section comment
            if pending_section:
                substantial = [l for l in pending_section if l.strip()]
                if len(substantial) >= 2:
                    section_comments.append((addr, list(pending_section)))
                pending_section = []
        elif stripped.strip().endswith(':'):
            # Label line - don't clear pending section
            pass
        else:
            pending_section = []

    return inline_comments, section_comments


def build_instruction_list(asm_lines, binary, base_addr, start_addr, end_addr):
    """Extract instruction addresses and opcode bytes for a code section.
    Returns list of (addr, opcode_byte)."""
    instrs = []
    for line in asm_lines:
        if line.strip().startswith(';') or not line.strip():
            continue
        m = ADDR_RE.search(line)
        if m:
            addr = int(m.group(1), 16)
            if start_addr <= addr < end_addr:
                offset = addr - base_addr
                if 0 <= offset < len(binary):
                    instrs.append((addr, binary[offset]))
    return instrs


def transfer_comments(section_lines, mod_start, mod_end,
                      orig_file, orig_code_start, mod_binary, orig_binary):
    """Transfer inline comments from original file to mod section lines.
    Returns modified lines."""
    orig_path = os.path.join(ORIG_ASM_DIR, orig_file)
    if not os.path.exists(orig_path):
        print(f"    Warning: {orig_path} not found, skipping comment transfer")
        return section_lines

    # Load original comments
    inline_comments, section_comments = load_original_comments(orig_path)

    # Read original .asm for instruction parsing
    with open(orig_path) as f:
        orig_asm_lines = f.readlines()

    # Find original code end address from file header
    orig_end = 0x10000
    for line in orig_asm_lines[:40]:
        m = re.search(r'Address range: \$([0-9A-Fa-f]+)-\$([0-9A-Fa-f]+)', line)
        if m:
            orig_end = int(m.group(2), 16) + 1
            break

    # Build instruction lists
    mod_instrs = build_instruction_list(
        section_lines, mod_binary, ORG, mod_start, mod_end)
    orig_instrs = build_instruction_list(
        orig_asm_lines, orig_binary, ORIG_ORG, orig_code_start, orig_end)

    if not mod_instrs or not orig_instrs:
        return section_lines

    # Parallel walk matching
    comment_map = {}  # mod_addr -> comment
    section_map = {}  # mod_addr -> section comment lines
    oi = 0

    for mi_addr, mi_op in mod_instrs:
        if oi >= len(orig_instrs):
            break

        oi_addr, oi_op = orig_instrs[oi]

        if mi_op == oi_op:
            # Match
            if oi_addr in inline_comments:
                comment_map[mi_addr] = inline_comments[oi_addr]
            # Check for section comments
            for sc_addr, sc_lines in section_comments:
                if sc_addr == oi_addr:
                    section_map[mi_addr] = sc_lines
            oi += 1
        else:
            # Look ahead in original (up to 30 instructions)
            matched = False
            for look in range(1, 30):
                if oi + look >= len(orig_instrs):
                    break
                if mi_op == orig_instrs[oi + look][1]:
                    oi = oi + look
                    if orig_instrs[oi][0] in inline_comments:
                        comment_map[mi_addr] = inline_comments[orig_instrs[oi][0]]
                    for sc_addr, sc_lines in section_comments:
                        if sc_addr == orig_instrs[oi][0]:
                            section_map[mi_addr] = sc_lines
                    oi += 1
                    matched = True
                    break
            # If not matched, mod has extra instruction - skip

    # Apply comments to lines
    output = []
    for line in section_lines:
        m = ADDR_RE.search(line)
        if m:
            addr = int(m.group(1), 16)
            # Insert section comment before this line
            if addr in section_map:
                for sc_line in section_map[addr]:
                    output.append(sc_line)
            # Add inline comment
            if addr in comment_map:
                output.append(line + "  " + comment_map[addr])
                continue
        output.append(line)

    matched_count = len(comment_map)
    total_instrs = len(mod_instrs)
    print(f"    {orig_file}: {matched_count}/{total_instrs} instructions matched")

    return output


# =====================================================================
# PHASE 5: Generate file headers
# =====================================================================

def make_header(filename, start, end):
    """Generate file header for a section."""
    info = SECTION_INFO.get(filename)
    if not info:
        return ""
    title, desc_lines = info
    size = end - start

    lines = []
    lines.append("; ======================================================================")
    lines.append(f"; {filename}")
    lines.append("; ======================================================================")
    lines.append(";")
    lines.append(f"; {title}")
    lines.append(";")
    lines.append(f"; Address range: ${start:04X}-${end - 1:04X} ({size} bytes)")
    lines.append("; Source binary: mod_decompressed.bin (loaded at $620C)")
    lines.append(";")
    for dl in desc_lines:
        lines.append(f"; {dl}")
    lines.append(";")
    lines.append("; ======================================================================")
    lines.append("")
    return '\n'.join(lines) + '\n'


# =====================================================================
# PHASE 6: Write output files
# =====================================================================

def is_data_section(filename):
    """Check if a section contains data (should get ASCII annotations)."""
    return filename.startswith("data_")


def write_section_files(section_data, mod_binary, orig_binary):
    """Write individual .asm files with headers and annotations."""
    os.makedirs(OUT_DIR, exist_ok=True)

    for filename, start, end in SECTIONS:
        lines = section_data.get(filename, [])
        if not lines:
            print(f"    Warning: no lines for {filename}")
            continue

        # Annotate data sections
        if is_data_section(filename):
            lines = annotate_data(lines)

        # Transfer comments for preserved code sections
        for mod_s, mod_e, orig_file, orig_start in COMMENT_TRANSFERS:
            if start <= mod_s < end:
                lines = transfer_comments(
                    lines, mod_s, mod_e, orig_file, orig_start,
                    mod_binary, orig_binary)

        # Write file
        header = make_header(filename, start, end)
        filepath = os.path.join(OUT_DIR, filename)
        with open(filepath, 'w') as f:
            f.write(header)
            for line in lines:
                f.write(line.rstrip() + '\n')

        line_count = len(lines) + header.count('\n')
        print(f"    {filename}: {line_count} lines")


# =====================================================================
# PHASE 7: Write combined file
# =====================================================================

def write_combined():
    """Write _mod_combined.asm with org directive and INCLUDE directives."""
    filepath = os.path.join(OUT_DIR, "_mod_combined.asm")
    with open(filepath, 'w') as f:
        f.write("; Saboteur II: 48K Mod by TheAlfest — Combined Assembly\n")
        f.write("; Generated by split_mod.py for reassembly verification\n")
        f.write(";\n")
        f.write("; Reassemble with:\n")
        f.write(";   pasmo --bin _mod_combined.asm mod_reassembled.bin\n")
        f.write("\n")
        f.write(f"\torg\t0{ORG:04x}h\n")
        f.write("\n")
        for filename, _, _ in SECTIONS:
            f.write(f'\tINCLUDE "{filename}"\n')
        f.write("\n")


# =====================================================================
# PHASE 8: Verify reassembly
# =====================================================================

def verify():
    """Reassemble combined file with pasmo and compare to original binary."""
    combined = os.path.join(OUT_DIR, "_mod_combined.asm")
    reassembled = os.path.join(BASE_DIR, "mod_decompressed.reassembled")

    result = subprocess.run(
        ["pasmo", "--bin", combined, reassembled],
        capture_output=True, text=True,
        cwd=OUT_DIR  # so INCLUDE paths resolve
    )

    if result.returncode != 0:
        print(f"    PASMO ERROR: {result.stderr.strip()[:300]}")
        return False

    with open(MOD_BIN, 'rb') as f:
        original = f.read()
    with open(reassembled, 'rb') as f:
        rebuilt = f.read()

    if original == rebuilt:
        print(f"    MATCH: {len(original)} bytes identical")
        return True
    else:
        min_len = min(len(original), len(rebuilt))
        for i in range(min_len):
            if original[i] != rebuilt[i]:
                addr = ORG + i
                print(f"    MISMATCH at offset {i} (${addr:04X}): "
                      f"orig={original[i]:02X}h got={rebuilt[i]:02X}h")
                break
        if len(original) != len(rebuilt):
            print(f"    SIZE MISMATCH: orig={len(original)}, got={len(rebuilt)}")
        return False


# =====================================================================
# MAIN
# =====================================================================

def main():
    print("Saboteur II Mod — Split Disassembly")
    print("=" * 50)

    # Load binaries
    print("\nLoading binaries...")
    with open(MOD_BIN, 'rb') as f:
        mod_binary = f.read()
    with open(ORIG_BIN, 'rb') as f:
        orig_binary = f.read()
    print(f"  Mod: {len(mod_binary)} bytes, Original: {len(orig_binary)} bytes")

    # Phase 1: Re-disassemble
    print("\n1. Re-disassembling with block definitions...")
    raw_lines = redisassemble()
    print(f"  {len(raw_lines)} lines generated")

    # Phase 2: Parse
    print("\n2. Parsing disassembly output...")
    parsed = parse_lines(raw_lines)
    print(f"  {len(parsed)} lines after cleanup")

    # Phase 3: Split
    print("\n3. Splitting into sections...")
    section_data = split_into_sections(parsed)
    for fname, _, _ in SECTIONS:
        count = len(section_data[fname])
        if count == 0:
            print(f"  WARNING: {fname} has 0 lines!")

    # Phase 4-6: Annotate + write
    print("\n4. Writing annotated files...")
    write_section_files(section_data, mod_binary, orig_binary)

    # Phase 7: Combined file
    print("\n5. Writing combined file...")
    write_combined()

    # Phase 8: Verify
    print("\n6. Verifying reassembly...")
    ok = verify()

    print("\n" + "=" * 50)
    print(f"Result: {'PASS' if ok else 'FAIL'}")

    if ok:
        total_files = len(SECTIONS) + 1  # +1 for combined
        print(f"\n{total_files} files written to {OUT_DIR}/")

    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
