# Saboteur II: Avenging Angel - Z80 Disassembly

Complete annotated disassembly of **Saboteur II: Avenging Angel** (1987)
by Clive Townsend, published by Durell Software.
ZX Spectrum 128K version.

## Memory Map

```
Address    Size    Description
--------   -----   -----------
0000-3FFF          ROM (not included)
4000-5AFF   6912   Loading screen (SCREEN$)
5B00-620B          System variables / BASIC
620C-62B7    172   Entry point & initialization
62B8-6C0B   2388   High score tables
6C0C-6F0B    768   Anti-piracy message
6F0C-730B   1024   Mission definitions & briefing text
730C-760B    768   HUD strings & game state logic
760C-770B    256   New game / level initialization
770C-800B   2304   Room rendering & command interpreter
800C-850B   1280   Sprite/tile bitmaps (block 1)
850C-870B    512   Sprite bitmap data
870C-890B    512   Sprite bitmaps (block 2)
890C-940B   2816   Main game loop & entity processing
940C-960B    512   Tile definitions & lookup tables
960C-980B    512   Entity spawn configuration tables
980C-9E00   1525   Player movement, room transitions & input
9E01-A10B    779   Core print/draw routine
A10C-AA0B   2304   Lookup tables & misc data
AA0C-AE0B   1024   Entity behavior scripts & sprite renderer
AE0C-B10B    768   Object interaction & item pickup
B10C-B40B    768   Level configuration
B40C-BA0B   1536   Interaction system: lifts, fences, stashes
BA0C-CF0B   5376   Room map data (700+ screens)
CF0C-D20B    768   Room definition data & tile patterns
D20C-D60B   1024   Room data & handler address tables
D60C-E20B   3072   Character sprites & animation
E20C-E70B   1280   Background/misc graphics
E70C-EB0B   1024   Animation sequences & tables
EB0C-EE0B    768   Mission select UI
EE0C-F10B    768   Menu & input handling
F10C-F30B    512   Score formatting & high scores
F30C-F40B    256   Endgame text
F40C-FFFF   3060   Font character set & sound data

128K Bank 1 (paged at C000-FFFF):
F618-FFFF   2536   Sound/music engine (from block5_data.bin)
```

## Loading Sequence

1. BASIC loader runs (`CLEAR 25099` protects game memory)
2. Loading screen displayed at 0x4000 (6,912 bytes)
3. Pre-loader loaded at 0x9C22 (2,566 bytes)
4. `USR 39970` executes pre-loader: copies sound engine to 128K bank 1
5. Main code loaded at 0x620C (40,436 bytes, fills exactly to 0xFFFF)
6. `USR 25100` starts the game

## 128K Banking

The game uses 128K bank switching via port 0x7FFD:

- **Bank 0** (default, `OUT 0x7FFD, 0x10`): Main game code at 0xC000-0xFFFF
- **Bank 1** (`OUT 0x7FFD, 0x11`): Sound/music engine at 0xF618-0xFFFF

The pre-loader writes `0x11` to port 0x7FFD to page in bank 1,
LDIRs 2,536 bytes from 0x9C40 to 0xF618, then restores bank 0 with `0x10`.
During gameplay, the same bank switch pattern is used to call the sound engine.

## File Index

See [disassembly/_file_index.md](disassembly/_file_index.md) for the
complete file listing with address ranges and sizes.

### Quick Reference

| Category | Files | Key files |
|----------|-------|-----------|
| Pre-loader & Banking | [preloader.asm](disassembly/preloader.asm), [bank1_code.asm](disassembly/bank1_code.asm) | Bank 1 sound engine copy |
| Entry | [entry.asm](disassembly/entry.asm) | USR 25100, IM2 setup |
| Game Engine | [code_mainloop.asm](disassembly/code_mainloop.asm), [code_roomrender.asm](disassembly/code_roomrender.asm) | Main loop, room renderer |
| Rendering | [code_printcore.asm](disassembly/code_printcore.asm), [data_spritebitmap.asm](disassembly/data_spritebitmap.asm) | Print routine (80+ calls) |
| Gameplay | [code_mechanics.asm](disassembly/code_mechanics.asm), [code_interaction.asm](disassembly/code_interaction.asm), [code_objects.asm](disassembly/code_objects.asm) | Entities, items, lifts |
| UI | [code_uimission.asm](disassembly/code_uimission.asm), [code_input.asm](disassembly/code_input.asm), [code_score.asm](disassembly/code_score.asm) | Menus, controls, scoring |
| Map Data | [data_roommap.asm](disassembly/data_roommap.asm) (5376 B), [data_levelconfig.asm](disassembly/data_levelconfig.asm) | 700+ screens |
| Graphics | [data_sprites.asm](disassembly/data_sprites.asm), [data_font.asm](disassembly/data_font.asm), [data_graphics1-3.asm](disassembly/) | Sprites, font, tiles |
| Text | [data_highscores.asm](disassembly/data_highscores.asm), [data_missions.asm](disassembly/data_missions.asm), [data_antipiracy.asm](disassembly/data_antipiracy.asm) | Strings, messages |

## Key Functions & Jump Targets

| Address | References | File | Description |
|---------|-----------|------|-------------|
| `9E01h` | 62 calls | code_printcore.asm | Core print/draw routine |
| `8B13h` | 18 JP refs | code_mainloop.asm | Main game loop entry |
| `B988h` | 18 JP refs | code_interaction.asm | Status/interaction dispatcher |
| `9DCAh` | 12 refs | code_mechanics.asm | Keyboard/joystick input reader |
| `7774h` | 12 JP entries | code_roomrender.asm | Game state jump table |
| `7C96h` | 11 JP entries | code_roomrender.asm | Secondary state jump table |
| `F25Eh` | 8 calls | code_score.asm | Score update/format routine |
| `997Ah` | 8 refs | code_mechanics.asm | Entity processing function |
| `F618h` | Bank 1 entry | bank1_code.asm | Sound engine init (128K bank 1) |
| `620Ch` | USR 25100 | entry.asm | Game entry point |

## System Addresses Used

| Address | Description |
|---------|-------------|
| `5C09h` | System variable: last key pressed |
| `5C0Ah` | System variable: key repeat |
| `5800h` | ZX Spectrum attribute area start |
| `4000h` | ZX Spectrum screen bitmap start |
| `7FFDh` | 128K bank switching port |
| `00FEh` | ULA port (border color, speaker, ear) |
| `8100h` | IM2 interrupt vector table |

## Game Structure Overview

Saboteur II is a side-scrolling action game featuring Nina, who must
navigate a massive building complex of 700+ screens to complete
one of 9 missions. Each mission requires finding specific items
and reaching the escape point within a time limit.

### Missions

The 9 missions correspond to martial arts belt rankings:
RIN, TOH, SHA, KAI, JIN, RETSU, ZAI, ZEN (+ one more).
Each mission has a secret code (SATORI, DIM MAK, etc.) that
can be entered to skip directly to it.

### Main Game Loop (`code_mainloop.asm`)

1. Process player input
2. Update entity positions and animations
3. Check collisions
4. Update game state (timer, objectives)
5. Render current room
6. Handle screen transitions

### Room Renderer & State Machine (`code_roomrender.asm`)

The game flow is controlled by two jump tables:
- `7774h`: 12-entry table for major game states
- `7C96h`: 11-entry table for sub-states

## Reassembly

The combined assembly files can be reassembled with `pasmo`:

```bash
# Verify block5 (preloader + sound engine)
pasmo --bin disassembly/_block5_combined.asm block5_data.bin.reassembled
cmp block5_data.bin block5_data.bin.reassembled

# Verify block7 (main game)
pasmo --bin disassembly/_block7_combined.asm block7_main.bin.reassembled
cmp block7_main.bin block7_main.bin.reassembled
```

## Tools Used

- **z80dasm 1.1.6** - Z80 disassembler (initial disassembly with labels)
- **pasmo** - Z80 assembler (reassembly verification)
- **Python 3** - Binary analysis, string detection, file splitting
- **tzxcat/tzxls** - TZX tape image tools (in `.venv`; used for initial binary extraction)

## Technical Notes

### Scripts

- **`verify.py`** - Reassembles the combined `.asm` files with pasmo and
  compares the output against the original binaries to verify byte-identical
  reassembly. Does not modify any `.asm` files.

### How the Disassembly Was Generated

The initial disassembly was generated using z80dasm with block definition files
that mark known data regions as `bytedata`, preventing z80dasm from incorrectly
interpreting graphics/strings/map data as Z80 instructions. Named symbol files
(`-S` flag) provided meaningful labels. The output was then split by address
range into individual `.asm` files and hand-commented.

### z80dasm Block Definition Format

z80dasm uses block definition files (`-b` flag) to distinguish code from data:

```
blockname: start 0xADDR end 0xADDR type code|bytedata|worddata|pointers
```

The `end` address is exclusive (first byte NOT in the block). Example:

```
b0: start 0x620C end 0x62B8 type code
b1: start 0x62B8 end 0x6C0C type bytedata
```

### z80dasm Flags

- `-a` - Print address in comment at end of each line
- `-l` - Auto-generate labels for jump/call targets
- `-u` - Emit undocumented Z80 instructions directly (game uses IX/IY half-registers, SLL, etc.)
- `-g 0xADDR` - Set ORG address (start address of the binary in memory)
- `-b file` - Block definition file for code/data regions

### Known Warnings

- **"Block 'b27' overlaps completely with 'DEFAULT'"** - Benign; occurs because
  the last data section (`data_font.asm`) extends to 0x10000, which is also the
  end of the file. z80dasm's DEFAULT block covers the same range.
- **"Code might not be 8080 compatible"** - Expected; game uses Z80-specific
  instructions (IX/IY indexed, block operations, etc.)
- **"Self modifying code detected"** - Legitimate game technique; the game
  patches instruction operands at runtime (e.g., changing jump targets or
  immediate values during gameplay).

### Code/Data Boundary Identification

The code/data boundaries were identified by:

1. Scanning for long ASCII string runs (high score tables, messages)
2. Looking for zero-padding regions between sections
3. Identifying graphics data by patterns of non-instruction bytes
4. Checking z80dasm's raw output (with `-t` flag) where it produced
   nonsensical instruction sequences in data regions
5. Cross-referencing jump/call targets to identify code entry points

Some regions are "mixed" (code with inline data tables). In these cases the
entire region is disassembled as code, and z80dasm's label detection handles
the inline data as best it can.

### Undocumented Instructions

The game uses several undocumented Z80 instructions:
- **IX/IY half-register operations** (`ld ixh,a`, `add a,ixl`, etc.)
- These are real Z80 instructions but not documented by Zilog
- z80dasm's `-u` flag is required to emit them directly; without it,
  they appear as `defb` sequences with the mnemonic in a comment

### The Sound Engine (Bank 1)

The sound engine lives in 128K bank 1 at runtime addresses 0xF618-0xFFFF,
but it is loaded as part of `block5_data.bin` at source addresses 0x9C40-0xA627.
The pre-loader copies it via `LDIR` with interrupts disabled. To get the
runtime address of any instruction in `bank1_code.asm`, add 0x59D8 to the
source address shown in the file.

The sound engine drives the AY-3-8912 sound chip via ports 0xFFFD (register
select) and 0xBFFD (data write). It is called from main game code by:
1. Writing 0x11 to port 0x7FFD (page in bank 1)
2. `CALL 0xF618` (or other entry points)
3. Writing 0x10 to port 0x7FFD (restore bank 0)

### Screen Address Calculation

The ZX Spectrum screen is not linearly mapped. The print/draw routine at
`sub_9E01h` uses the standard Spectrum screen address calculation:
- Bits 15-13: 010 (screen base at 0x4000)
- Bits 12-11: Third of screen (0-2)
- Bits 10-8: Character row within third (0-7)
- Bits 7-5: Pixel row within character (0-7)
- Bits 4-0: Column (0-31)

The routine uses `RR D` / `RL D` sequences to advance to the next character
position, wrapping between pixel rows and character cells.

### Font Table

The game stores a custom font at the address pointed to by `(09E0Bh)`. During
initialization, it also generates a bit-reversed copy of the font at 0xFD33
(used for mirrored text or right-to-left rendering). The `LD A,R` instruction
at 0x6298 reads the Z80 refresh register as a pseudo-random number to select
which high score table to display.

### Source Binary Extraction

The binary files were extracted from the TZX tape image using tzxcat:

```bash
# Activate the Python venv with tzx tools
source .venv/bin/activate

# List blocks in the TZX file
tzxls "Saboteur II - Avenging Angel (1987)(Durell Software)[128K].tzx"

# Extract individual data blocks (skip 1-byte flag prefix)
tzxcat -b 5 -o block5_data.bin "Saboteur II...tzx"  # Pre-loader
tzxcat -b 7 -o block7_main.bin "Saboteur II...tzx"  # Main game
```
