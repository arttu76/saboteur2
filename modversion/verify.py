#!/usr/bin/env python3
"""
Saboteur II Mod Disassembly Verification
=========================================
Validates that the mod disassembly .asm files reassemble to a byte-identical
copy of the decompressed mod binary.

This script does NOT regenerate any .asm files. It only:
  1. Assembles disassembly/_mod_combined.asm with pasmo
  2. Compares the output against mod_decompressed.bin

Usage: cd modversion && python3 verify.py
"""

import os
import subprocess
import sys

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
ORIG_BIN = os.path.join(BASE_DIR, "mod_decompressed.bin")
ASM_DIR = os.path.join(BASE_DIR, "disassembly")
COMBINED_ASM = os.path.join(ASM_DIR, "_mod_combined.asm")
REASSEMBLED = os.path.join(BASE_DIR, "mod_decompressed.bin.reassembled")

ORG = 0x620C


def main():
    print("Saboteur II Mod Disassembly Verification")
    print("=" * 50)

    if not os.path.exists(COMBINED_ASM):
        print(f"ERROR: {COMBINED_ASM} not found")
        return 1

    if not os.path.exists(ORIG_BIN):
        print(f"ERROR: {ORIG_BIN} not found")
        return 1

    # Assemble
    print(f"\nAssembling {os.path.basename(COMBINED_ASM)}...")
    result = subprocess.run(
        ["pasmo", "--bin", COMBINED_ASM, REASSEMBLED],
        capture_output=True, text=True,
        cwd=ASM_DIR,  # Run from disassembly/ so INCLUDE paths resolve
    )

    if result.returncode != 0:
        print(f"  PASMO ERROR: {result.stderr.strip()[:300]}")
        return 1

    # Compare
    print("Comparing against mod_decompressed.bin...")
    with open(ORIG_BIN, "rb") as f:
        orig = f.read()
    with open(REASSEMBLED, "rb") as f:
        reassembled = f.read()

    if orig == reassembled:
        print(f"  MATCH: {len(orig)} bytes identical")
        print(f"\n{'=' * 50}")
        print("Verification: PASS")
        return 0
    else:
        min_len = min(len(orig), len(reassembled))
        diffs = 0
        first_diff = None
        for i in range(min_len):
            if orig[i] != reassembled[i]:
                diffs += 1
                if first_diff is None:
                    first_diff = i
        if first_diff is not None:
            addr = ORG + first_diff
            print(f"  MISMATCH at offset {first_diff} (addr ${addr:04X}): "
                  f"orig=${orig[first_diff]:02X}, got=${reassembled[first_diff]:02X}")
            print(f"  Total differing bytes: {diffs}")
        if len(orig) != len(reassembled):
            print(f"  SIZE MISMATCH: orig={len(orig)}, got={len(reassembled)}")
        print(f"\n{'=' * 50}")
        print("Verification: FAIL")
        return 1


if __name__ == "__main__":
    sys.exit(main())
