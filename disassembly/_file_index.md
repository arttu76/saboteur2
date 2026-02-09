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

### Pre-loader & 128K Banking

| File | Address | Size | Description |
|------|---------|------|-------------|
| [preloader.asm](preloader.asm) | 9C22h-9C3Fh | 30 | Pre-loader: Bank Switch & LDIR Setup |
| [bank1_code.asm](bank1_code.asm) | 9C40h-A627h | 2536 | Bank 1 Sound/Music Engine |

### Entry & Initialization

| File | Address | Size | Description |
|------|---------|------|-------------|
| [entry.asm](entry.asm) | 620Ch-62B7h | 172 | Entry Point (USR 25100) |

### Text & String Data

| File | Address | Size | Description |
|------|---------|------|-------------|
| [data_highscores.asm](data_highscores.asm) | 62B8h-6C0Bh | 2388 | High Score Tables |
| [data_antipiracy.asm](data_antipiracy.asm) | 6C0Ch-6F0Bh | 768 | Anti-Piracy Message & Durell Address |
| [data_missions.asm](data_missions.asm) | 6F0Ch-730Bh | 1024 | Mission Definitions & Briefing Text |
| [data_hud.asm](data_hud.asm) | 730Ch-760Bh | 768 | HUD Strings & Game State Logic |
| [data_endgame.asm](data_endgame.asm) | F30Ch-F40Bh | 256 | Endgame & Completion Text |

### Game Code

| File | Address | Size | Description |
|------|---------|------|-------------|
| [code_init.asm](code_init.asm) | 760Ch-770Bh | 256 | New Game / Level Initialization |
| [code_roomrender.asm](code_roomrender.asm) | 770Ch-800Bh | 2304 | Room Rendering & Command Interpreter |
| [code_mainloop.asm](code_mainloop.asm) | 890Ch-940Bh | 2816 | Main Game Loop & Entity Processing |
| [code_mechanics.asm](code_mechanics.asm) | 980Ch-9E00h | 1525 | Player Movement, Room Transitions & Input |
| [code_printcore.asm](code_printcore.asm) | 9E01h-A10Bh | 779 | Core Print/Draw Routine |
| [code_behavior.asm](code_behavior.asm) | AA0Ch-AE0Bh | 1024 | Entity Behavior Scripts & Sprite Renderer |
| [code_objects.asm](code_objects.asm) | AE0Ch-B10Bh | 768 | Object Interaction & Item Pickup |
| [code_interaction.asm](code_interaction.asm) | B40Ch-BA0Bh | 1536 | Interaction System: Lifts, Fences, Stashes & Status Messages |
| [code_uimission.asm](code_uimission.asm) | EB0Ch-EE0Bh | 768 | Mission Select UI & Briefing |
| [code_input.asm](code_input.asm) | EE0Ch-F10Bh | 768 | Menu & Input Handling |
| [code_score.asm](code_score.asm) | F10Ch-F30Bh | 512 | Score System, High Scores & Mission Complete |

### Graphics & Sprite Data

| File | Address | Size | Description |
|------|---------|------|-------------|
| [data_graphics1.asm](data_graphics1.asm) | 800Ch-850Bh | 1280 | Sprite/Tile Bitmap Data (Block 1) |
| [data_spritebitmap.asm](data_spritebitmap.asm) | 850Ch-870Bh | 512 | Sprite Bitmap Data (Block 2) |
| [data_graphics2.asm](data_graphics2.asm) | 870Ch-890Bh | 512 | Additional Sprite Bitmaps |
| [data_tiles.asm](data_tiles.asm) | 940Ch-960Bh | 512 | Tile Definitions & Lookup Tables |
| [data_sprites.asm](data_sprites.asm) | D60Ch-E20Bh | 3072 | Character Sprites & Animation Frames |
| [data_graphics3.asm](data_graphics3.asm) | E20Ch-E70Bh | 1280 | Background & Miscellaneous Graphics |
| [data_animation.asm](data_animation.asm) | E70Ch-EB0Bh | 1024 | Animation Sequences & Frame Tables |
| [data_font.asm](data_font.asm) | F40Ch-FFFFh | 3060 | Font Character Set & Sound Data |

### Map, Level & Entity Data

| File | Address | Size | Description |
|------|---------|------|-------------|
| [data_entityspawn.asm](data_entityspawn.asm) | 960Ch-980Bh | 512 | Entity Spawn Configuration Tables |
| [data_tables.asm](data_tables.asm) | A10Ch-AA0Bh | 2304 | Lookup Tables & Miscellaneous Data |
| [data_levelconfig.asm](data_levelconfig.asm) | B10Ch-B40Bh | 768 | Level Configuration & Entity Placement |
| [data_roommap.asm](data_roommap.asm) | BA0Ch-CF0Bh | 5376 | Room Map Data (700+ Screens) |
| [data_roomdefs.asm](data_roomdefs.asm) | CF0Ch-D20Bh | 768 | Room Definition Data & Tile Patterns |
| [data_handlers.asm](data_handlers.asm) | D20Ch-D60Bh | 1024 | Room Data & Handler Address Tables |

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
# From project root:
pasmo --bin disassembly/_block5_combined.asm block5_data.bin.reassembled
cmp block5_data.bin block5_data.bin.reassembled

pasmo --bin disassembly/_block7_combined.asm block7_main.bin.reassembled
cmp block7_main.bin block7_main.bin.reassembled
```

## Tools Used

- **z80dasm 1.1.6** - Z80 disassembler (initial disassembly with labels)
- **pasmo** - Z80 assembler (reassembly verification)
- **Python 3** - Binary analysis, string detection, file splitting
