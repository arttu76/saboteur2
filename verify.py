#!/usr/bin/env python3
"""
Saboteur II Disassembly Verification
=====================================
Validates that the existing disassembly .asm files reassemble to byte-identical
copies of the original binaries.

This script does NOT regenerate any .asm files. It only:
  1. Assembles _block5_combined.asm and _block7_combined.asm with pasmo
  2. Compares the output against the original binaries

Usage: python3 verify.py
"""

import os
import subprocess

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
BLOCK5 = os.path.join(BASE_DIR, "block5_data.bin")
BLOCK7 = os.path.join(BASE_DIR, "block7_main.bin")
OUT_DIR = os.path.join(BASE_DIR, "disassembly")

BLOCK5_ORG = 0x9C22
BLOCK7_ORG = 0x620C


def verify_reassembly(asm_path, orig_bin_path, org):
    """Reassemble with pasmo and compare against original binary."""
    if not os.path.exists(asm_path):
        print(f"    ERROR: {asm_path} not found")
        return False

    orig_name = os.path.basename(orig_bin_path)
    reassembled_path = os.path.join(BASE_DIR, orig_name + ".reassembled")

    result = subprocess.run(
        ["pasmo", "--bin", asm_path, reassembled_path],
        capture_output=True, text=True
    )

    if result.returncode != 0:
        print(f"    PASMO ERROR: {result.stderr.strip()[:200]}")
        return False

    with open(orig_bin_path, "rb") as f:
        orig = f.read()
    with open(reassembled_path, "rb") as f:
        reassembled = f.read()

    if orig == reassembled:
        print(f"    MATCH: {len(orig)} bytes identical")
        return True
    else:
        min_len = min(len(orig), len(reassembled))
        for i in range(min_len):
            if orig[i] != reassembled[i]:
                addr = org + i
                print(f"    MISMATCH at offset {i} (addr {addr:04X}h): "
                      f"orig={orig[i]:02X}h, got={reassembled[i]:02X}h")
                break
        if len(orig) != len(reassembled):
            print(f"    SIZE MISMATCH: orig={len(orig)}, got={len(reassembled)}")
        return False


def main():
    b5_combined = os.path.join(OUT_DIR, "_block5_combined.asm")
    b7_combined = os.path.join(OUT_DIR, "_block7_combined.asm")

    print("Saboteur II Disassembly Verification")
    print("=" * 50)

    print("\nAssembling and comparing against original binaries...")
    print("  block5:")
    b5_ok = verify_reassembly(b5_combined, BLOCK5, BLOCK5_ORG)
    print("  block7:")
    b7_ok = verify_reassembly(b7_combined, BLOCK7, BLOCK7_ORG)

    # Summary
    print("\n" + "=" * 50)
    print(f"Verification: block5={'PASS' if b5_ok else 'FAIL'}, block7={'PASS' if b7_ok else 'FAIL'}")

    if not (b5_ok and b7_ok):
        return 1
    return 0


if __name__ == "__main__":
    exit(main())
