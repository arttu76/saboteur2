# Saboteur II - Avenging Angel (128K) — TZX Memory Layout

## Source file

`Saboteur II - Avenging Angel (1987)(Durell Software)[128K].tzx`

## BASIC loader (decoded)

```basic
   1 BORDER 1: PAPER 1: INK 1: POKE VAL "23624",9: CLEAR VAL "25099":
     POKE VAL "23659",0: LOAD ""SCREEN$ :
     OVER 1: PRINT AT 0,0: INK 8: PAPER 8: LOAD ""CODE
   2 RANDOMIZE USR 39970:
     OVER 1: PRINT AT 0,0: INK 8: PAPER 8: LOAD ""CODE
   4 RANDOMIZE USR 25100
   5 SAVE "SAB2 128K" LINE 1: LOAD *"m";1;"2"
```

## Loading sequence

| Step | TZX blocks | Action                    | Address (dec) | Address (hex) | Size (bytes) | Address range (hex)  |
|------|------------|---------------------------|---------------|---------------|--------------|----------------------|
| 1    | 2 + 3      | `LOAD "" SCREEN$`         | 16384         | 0x4000        | 6912         | 0x4000 – 0x5AFF     |
| 2    | 4 + 5      | `LOAD "" CODE`            | 39970         | 0x9C22        | 2566         | 0x9C22 – 0xA627     |
| 3    | —          | `RANDOMIZE USR 39970`     | —             | —             | —            | executes block above |
| 4    | 6 + 7      | `LOAD "" CODE`            | 25100         | 0x620C        | 40436        | 0x620C – 0xFFFF     |
| 5    | —          | `RANDOMIZE USR 25100`     | —             | —             | —            | game entry point     |

## TZX block index

| Block | Type   | Description                          |
|-------|--------|--------------------------------------|
| 0     | Header | Program: "SAB2 128K" (286 bytes)     |
| 1     | Data   | BASIC loader (286 bytes)             |
| 2     | Header | Bytes, start: 40000, length: 6912    |
| 3     | Data   | Loading screen (6912 bytes)          |
| 4     | Header | Bytes, start: 39970, length: 2566    |
| 5     | Data   | Pre-loader routine (2566 bytes)      |
| 6     | Header | Bytes, start: 25100, length: 40436   |
| 7     | Data   | Main game code + data (40436 bytes)  |

## Notes

- **CLEAR 25099** sets RAMTOP just below the main game block, protecting addresses 25100+ from BASIC.
- **Block 5 (2566 bytes at 39970)** is executed *before* the main block is loaded. On a 128K Spectrum this routine likely performs bank switching or decompression into other 128K RAM banks. It sits within the range that the main block will later overwrite (25100–65535), so it is disposable after execution.
- **Block 7 (40436 bytes at 25100)** fills memory from 25100 to 65535 exactly (25100 + 40436 = 65536). This covers the upper ~40K of the 64K address space.
- **Block 3 (6912 bytes)** is a standard `SCREEN$` — 256x192 bitmap (6144 bytes) + attributes (768 bytes) at 0x4000.
- **Line 5** (`SAVE` / `LOAD *"m"`) appears to be a development artifact or microdrive-related; it would only execute if `USR 25100` returns, which the game presumably never does.
- The header for the screen block says start address 40000 (not 16384), but `LOAD "" SCREEN$` always loads to 16384 regardless of the header address.
- Converting to SNA (48K snapshot) is not straightforward for this game since the pre-loader routine at step 3 likely sets up 128K bank contents that aren't visible from the TZX alone. A 128K SNA (or Z80/SZX snapshot) would require emulating that routine to capture the full bank state.

## Extracted binary files

The raw data blocks have been extracted to:

| File               | TZX block | Contents             |
|--------------------|-----------|----------------------|
| `block1_basic.bin` | 1         | BASIC loader         |
| `block3_screen.bin`| 3         | Loading screen       |
| `block5_data.bin`  | 5         | Pre-loader routine   |
| `block7_main.bin`  | 7         | Main game code+data  |
