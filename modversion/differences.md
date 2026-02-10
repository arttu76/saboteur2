# Saboteur II: 48K Mod by TheAlfest — Differences Analysis

Comparison of the original 128K Saboteur II (Durell, 1987) with the
48K mod by TheAlfest (v1.1.1, 2024).

## Overview

| Property | Original | Mod |
|---|---|---|
| Platform | ZX Spectrum 128K | ZX Spectrum 48K |
| TAP file | N/A (TZX) | 28,710 bytes |
| Code (in RAM) | 40,436 bytes (0x620C–0xFFFF) | 40,432 bytes (0x620C–0xFFFB) |
| Distribution | Uncompressed | ZX0 compressed (64.8% ratio) |
| Sound | AY-3-8912 (bank 1 engine) | Beeper effects only |
| Entry point | 0x620C (direct) | 0x620C → decompress → JP 0x8574 |

The decompressed mod is almost the same size as the original (4 bytes
shorter) but 59% of the content is new or modified. The entire binary
has been reorganized — no section remains at its original address.

## Loading Mechanism

### Original (128K)
Multi-stage TZX loader with custom timing, headerless blocks, and
bank-switching preloader.

### Mod (48K)
Standard BASIC loader in TAP format:
```
10 CLEAR 1: BORDER 1: POKE 24499,...
20 POKE 23739, CODE "o"
30 LOAD "screen" CODE          ; 2,305 bytes → 0x8000
40 RANDOMIZE USR 32768         ; decompress/display loading screen
50 LOAD "main" CODE            ; 26,186 bytes → 0x620C
60 POKE 23739, 244
70 RANDOMIZE USR 25100         ; decompress + start game
```
The loading screen is ZX0-compressed (2,305 → 6,912 bytes, 33%).
The main block has a 163-byte bootstrap that relocates + decompresses
the payload using the ZX0 algorithm by Einar Saukas.

## Hardware Changes

### 128K Banking Removed
The original uses port 0x7FFD (128K bank switching) at 6 locations to
page in bank 1 for the sound engine. All 6 references are eliminated
in the mod — the code is pure 48K.

### Interrupt Handler Rewritten
| | Original (0x8282) | Mod (0xFD34) |
|---|---|---|
| I register | 0x81 (vector table at 0x8100) | 0x3B (vector at 0x3B3B) |
| ISR function | Save regs → bank-switch to bank 1 → call sound engine tick → bank-switch back → restore regs | EX AF/EXX → game speed counter → keyboard scan → beeper sound generation |
| Sound | Calls AY sound engine in bank 1 | Generates beeper tones directly |
| Extra features | None | Speed timing, key detection |

### Beeper Sound
The original has 5 OUT (0xFE) instructions (border color only).
The mod has 13 — the additional 8 are beeper sound effect generation,
replacing the AY music and SFX that were in the 128K sound engine.

## Menu Changes

### Original Menu
```
K  KEYBOARD
P  PROTEK
J  KEMPSTON
R  REDEFINE KEYS
M  ALTER MISSION
T  TUNE OFF          ← removed
S  START GAME
```

### Mod Menu
```
K  KEYBOARD
P  PROTEK
J  KEMPSTON
R  REDEFINE KEYS
M  ALTER MISSION
G  GAME SPEED: 5     ← new
S  START GAME
```

The "T TUNE OFF" option (AY music toggle) is replaced with
"G GAME SPEED: 5" — an adjustable game speed setting.

## New In-Game Controls

- **CS+P** — Pause game (not in original)
- **CS+S** — Cycle game speed (not in original)

These are handled in the rewritten interrupt handler.

## New Info Screen

The mod includes an information/credits screen with the following text:

```
Saboteur II 48k thealfest mod v1

This mod has bugfixes, adjustable
speed, improved game balance,
additional graphics, sounds & more

Original game by Clive Townsend
ZX0 compression by Einar Saukas
Thanks to Hood for testing

        <- Please visit
           Clive's website

   CS+P : pause
   CS+S : speed

         2024 @thealfest
         Made in Ukraine
```

## Title Screen Credits

| Original | Mod |
|---|---|
| `1987 S...` (Clive Townsend only) | `1987  CLIVE TOWNSEND` + `2024    THEALFEST` |

## Game Content Changes

### Room Layouts — 98% Changed
Only 2% of original room definition data (32-byte chunks) is
preserved. This is essentially a completely new set of level designs.

### Entity Spawns — 94% Changed
Enemy guard placement, item locations, and entity spawn tables have
been almost entirely reworked. The mod describes this as "improved
game balance."

### Sprite Graphics — 26% Changed
74% of the sprite bitmap data is preserved from the original. New
sprites have been added ("additional graphics" per the mod
description).

### Font — 95% Preserved
37 of 39 font characters are identical. 2 characters were modified
(likely for new UI elements or symbols).

### New Room Labels
The mod adds room name strings not in the original:
- **CLEAN**
- **ROOM**
- **NO ENTRY**
- **VIRIDIS**

## Removed Content

### Strings Removed
| String | Purpose |
|---|---|
| `STASH SEARCHED!` | In-game event message |
| `TIME IS SHORT` | Timer warning |
| `BIKE ARRIVED` | Vehicle event text |
| `TOTAL` | Endgame score label |
| `HELD` / `TIMER` | HUD labels (reorganized) |
| Anti-piracy text | Full Durell anti-piracy message with reward offer |

### Anti-Piracy Protection
The original's anti-piracy screen (address, reward offer, and
prosecution warning) is removed entirely.

### Sound Engine
The entire bank 1 sound engine (2,566 bytes) is gone. The 128K AY
music compositions are not present.

## Code Organization

The mod completely reorganizes the memory layout. No section of code
or data remains at its original address. A comparison by opcode
signature (ignoring address operands) found 112 matching code regions,
confirming that most game logic is preserved but relocated.

### Largest Preserved Code Blocks
| Mod Address | Original Address | Size | Content |
|---|---|---|---|
| 0x865D | 0x62B7 | ~1538 opcodes | High score tables + display |
| 0xEA88 | 0xD7A8 | ~1152 opcodes | Sprite bitmap data |
| 0xABD3 | 0xDF54 | ~1129 opcodes | Sprite bitmap data |
| 0x81FB | 0xD0A4 | ~889 opcodes | Room rendering |
| 0xF0E8 | 0xF623 | ~842 opcodes | Sound/engine wrapper |
| 0xE0E0 | 0x6CB1 | ~731 opcodes | Anti-piracy/data area |

### Memory Map (Decompressed, 0x620C–0xFFFB)

The mod's decompressed binary occupies the same address space as
the original (0x620C–0xFFFB) but with a completely reorganized
layout. Data is packed at the front, game code in the middle,
sprite/graphics data in the upper region, and system code at the top.

```
Address Range    Size   Type   Origin            Content
─────────────────────────────────────────────────────────────────────
0x620C           3      CODE   —                 JP 0x8574 (entry point)
0x620F–0x63A2    403    TEXT   ← data_missions   Mission text (9 x 44 bytes) + pointer table
                                                 "PRESS ANY KEY TO CONTINUE"
                                                 RIN, KYO, TOH, SHA, KAI, JIN, RETSU, ZAI, ZEN
0x63A3–0x63B5    19     DATA   ← data_missions   Mission pointer table (9 x 2-byte addresses)
0x63B6–0x64BA    261    TEXT   ← data_missions    Briefing templates: "MISSION   BRIEFING",
                               ← data_hud         "KILL ENEMY GUARDS", "ESCAPE FROM BUILDING",
                                                  "COLLECT XX PIECES OF PAPER", HUD strings
0x64BB–0x64FC    66     TEXT   ← data_endgame    "CONGRATULATIONS", "YOU ARE NOW A TRUE",
                                                 "NINJA SABOTEUR", "ENTER YOUR NAME",
                                                 "HIGH SCORES"
0x64FD–0x660B    271    TEXT   ← data_highscores  Default high score table #1
                                                  (001000 CLIVE, 000140 NINA JANE, ...)
0x660C–0x664B    64     DATA   ← data_highscores  Score table metadata (SCORE+NAME template)
0x664C–0x668B    64     DATA   NEW               Modified: HUD tile lookup data
0x668C–0x66EB    96     DATA   ← code_score      HUD rendering data
0x66EC–0x6804    281    TEXT   mixed              "HELD", "TIMER", "NEAR PAY $0000000",
                                                  "LEVEL", "LIFT", "EXCELLENT VALUE",
                                                  "YOU HAVE ESCAPED", "MISSION TERMINATED",
                                                  "MISSION FAILURE", "MISSION CODE"
0x6805–0x68B6    178    TEXT   ← code_uimission   Mission code names: SATORI, DIM MAK,
                                                  MI LU KATA, GENIN, SAIMENJITSU, KUJI KIRI,
                                                  KIME, JONIN, "TYPE REQUIRED MISSION CODE",
                                                  "OR PRESS ENTER", "FOR FIRST MISSION"
0x68B7–0x68D1    27     TEXT   ← code_init        "#UP   DOWN LEFT RIGHTFIRE "
0x68D2–0x6934    99     TEXT   ← code_init        Menu options: "K  KEYBOARD", "P  PROTEK",
                               NEW                "J  KEMPSTON", "R  REDEFINE KEYS",
                                                  "M  ALTER MISSION", "G  GAME SPEED: 5" (NEW),
                                                  "S  START GAME"
0x6935–0x695B    39     TEXT   NEW                Title credits:
                                                  "1987  CLIVE TOWNSEND", "2024    THEALFEST"
0x695C–0x6A08    173    TEXT   NEW                Endgame text (split from original):
                                                  "YOU HAVE REACHED", "THE ULTIMATE LEVEL",
                                                  "YOU HAVE MASTERED", "THE ART OF NINJITSU",
                                                  "YOU HAVE COMPLETED", "YOUR ASSIGNED MISSION",
                                                  "THE CODE FOR", "STAGE X IS"
                                                  Room names: "CLEAN", "ROOM", "NO ENTRY", "VIRIDIS"
0x6A09–0x6BEB    483    DATA   NEW                Room address lookup tables (pointer arrays)
0x6BEC–0x820B    5664   DATA   NEW (98%)          Room definitions — almost entirely new
                               ← data_roomdefs    level designs (only ~2% byte-identical)
0x820C–0x8256    75     DATA   ← data_entityspawn Entity/sprite data tables (partial)
0x8257–0x858B    821    DATA   ← data_spritebitmap Sprite lookup tables + rendering data
                               ← code_roomrender
0x858C–0x8573    —      —      —                  (overlap — see 0x8574)
0x8574–0x864C    217    CODE   NEW                Entry point: DI, set SP, border color,
                                                  set system vars, call ROM routines,
                                                  display loading screen, set attributes,
                                                  initialize game
0x864D–0x865C    16     DATA   NEW                Entry point data
0x865D–0x8D5D    1793   TEXT   ← data_highscores  Default high score tables #2–#6
                                                  (5 ALIVE, KATO, DOUGAL, EMPEROR, DYNAMO,
                                                   WHIZ, GAFF DOSSER, TOZZY, SPIDER, ...)
                                                  + DURELL placeholder entries
0x8D5E–0x8D9D    64     TEXT   NEW                "Saboteur II 48k thealfest mod v1"
0x8D9E–0x8E8B    238    TEXT   NEW                Info screen text: "This mod has bugfixes,
                                                  adjustable speed, improved game balance,
                                                  additional graphics, sounds & more
                                                  Original game by Clive Townsend
                                                  ZX0 compression by Einar Saukas
                                                  Thanks to Hood for testing"
0x8E8C–0x900B    384    TEXT   NEW                Info screen layout: "Please visit Clive's
                               + DATA              website", "CS+P : pause", "CS+S : speed",
                                                  "2024 @thealfest", "Made in Ukraine",
                                                  "PRESS ANY KEY TO CONTINUE"
                                                  + attribute/layout data for info screen
0x900C–0x90EB    224    CODE   NEW                Info screen display + input handling code
0x90EC–0x92DB    496    CODE   NEW                New game code (initialization, UI logic)
0x92DC–0x92F4    25     TEXT   ← code_interaction "OLONEL BRIGGSY  EXPLORER"
0x92F5–0x950B    535    CODE   NEW                New game code (modified game logic)
0x950C–0x964B    320    CODE   NEW                ZX0-style data decompression routines
0x964C–0x96EB    160    DATA   ← code_roomrender  Attribute/color mapping tables
0x96EC–0x990B    544    CODE   NEW                Modified game engine code (entity handling,
                                                  collision, movement)
0x990C–0x9A0B    256    DATA   ← data_spritebitmap Character set / ASCII mapping tables
                                                  ( !"#$%&'..., dcmlkjih)
0x9A0C–0x9DCB    960    DATA   ← data_spritebitmap Tile definition tables, entity type tables,
                               ← code_mechanics    sprite frame indices
0x9DCC–0x9E4B    128    DATA   ← code_mechanics   Tile collision/type data (KLMNOPQRS, TUVWXYZ)
0x9E4C–0x9F4B    256    DATA   ← code_score       Tile pattern tables, score digit rendering
0x9F4C–0xA04B    256    TEXT   ← code_score        Score/HUD character map + tile definitions
                               ← data_hud          (?LLLLL MMMMM NNNNN, mnoopqrstuvw)
0xA04C–0xA1CB    384    DATA   NEW (mostly)       Modified tile/room rendering lookup tables
                               ← data_entityspawn  + some preserved entity data
0xA1CC–0xA54B    896    DATA   ← data_entityspawn Entity spawn tables, handler jump tables
                               ← code_mainloop     (partially preserved, partially reworked)
0xA54C–0xAA8B    1344   DATA   NEW (94%)          Entity spawn/behavior data —
                                                   almost entirely reworked placement
0xAA8C–0xB14B    1728   DATA   ← data_spritebitmap Sprite bitmap data (preserved)
                                                   Character sprites, animation frames
0xB14C–0xB38B    576    DATA   mixed              Sprite data (some preserved, some new)
0xB38C–0xB4CB    320    DATA   NEW                New sprite data (additional graphics)
0xB4CC–0xB78B    704    CODE   ← code_input       Keyboard/joystick input handling
                               ← code_mechanics    + game mechanics (relocated)
0xB78C–0xB80B    128    CODE   ← code_mechanics   Game mechanics (relocated)
0xB80C–0xBF0B    1792   CODE   NEW (mostly)       Extensively modified game logic:
                                                   object management, entity behavior,
                                                   interaction code — the bulk of the
                                                   "bugfixes" and "improved balance"
0xBF0C–0xC20B    768    CODE   mixed              Score/render code + modifications
0xC20C–0xE00B    7680   CODE   NEW (mostly)       Main game engine: room rendering,
                                                   game loop, mechanics, input processing —
                                                   heavily rewritten with new features
                                                   (speed control, pause, beeper sound calls)
0xE00C–0xE07B    112    CODE   NEW                Beeper sound effect routines
                                                  (OUT (0xFE) driven tone generation)
0xE07C–0xE0DF    100    CODE   NEW                Additional game code
0xE0E0–0xE8E7    2056   ZERO   (buffer)           Runtime scratch buffer
                                                  (zeroed on startup, used during gameplay)
0xE8E8–0xEF0B    1572   DATA   ← data_spritebitmap Sprite bitmap data (large block, preserved)
                                                   Guards, ninja, items, vehicles, scenery
0xEF0C–0xEF8B    128    DATA   ← data_endgame     Font rendering helper data
0xEF8C–0xF80B    2176   DATA   ← Font bitmaps     8x9 font character bitmaps +
                               ← data_handlers     handler/rendering code and data tables
                               ← Sound/misc        (relocated from 0xF4CC+ area)
0xF80C–0xF8FB    240    DATA   NEW                Lookup tables for new features
                                                  (speed levels, beeper frequencies)
0xF8FC–0xFB0F    532    ZERO   (buffer)           Runtime buffer (timer state, sound state)
0xFB10–0xFB39    42     CODE   NEW                IM2 initialization:
                                                  set I=0x3B, place JP at 0xFFF4,
                                                  IM 2, call ISR init
0xFB3A–0xFCCB    402    CODE   NEW                Game speed engine, frame timing,
                                                  keyboard scan (CS+P pause, CS+S speed),
                                                  beeper tone scheduling
0xFCCC–0xFD33    104    CODE   NEW                Beeper sound driver: tone generation,
                                                  frequency control, duration timing
0xFD34–0xFD8E    91     CODE   NEW                Interrupt Service Routine (ISR):
                                                  - EX AF,AF' / EXX register banking
                                                  - DJNZ speed counter (frame skip)
                                                  - IN A,(0xFE) keyboard scan
                                                  - Beeper sound tick
                                                  - Game speed modulation
0xFD8F–0xFE1C    142    CODE   NEW                ISR support: speed adjustment,
                                                  sound channel mixing, key debounce
0xFE1D–0xFEEB    207    DATA   NEW                Beeper sound data tables:
                                                  note frequencies, effect patterns,
                                                  duration values
0xFEEC–0xFFF3    264    DATA   NEW                Additional data tables
0xFFF4–0xFFFB    8      CODE   NEW                IM2 JP target: JP 0xFD34 (ISR entry)
                                                  + padding to 0xFFFB
```

## Mission Data

All 9 missions (RIN, KYO, TOH, SHA, KAI, JIN, RETSU, ZAI, ZEN) are
preserved with identical text and configuration bytes. The mission
pointer table structure is maintained. Only the addresses have changed
due to relocation.

## Technical Notes

- The mod uses the "jp trick" for IM2: places a JP instruction at
  0xFFF4 pointing to the ISR at 0xFD34, with I=0x3B so the vector
  table reads from 0x3B3B which contains 0xF4/0xFF forming the
  address 0xFFF4.
- Self-modifying code is present in both versions (flagged by z80dasm).
- The ZX0 decompressor in the bootstrap is 128 bytes, relocated to
  0x618A before execution to avoid overwriting itself during
  decompression.
- The 4-byte size difference (40,436 → 40,432) means the mod's
  decompressed code ends at 0xFFFB instead of 0xFFFF.

## Files in modversion/

| File | Description |
|---|---|
| `saboteur2_48k_mod_by_thealfest_v1.1.1.tap` | Distribution TAP file |
| `mod_loader.bin` | Extracted BASIC loader (144 bytes) |
| `mod_screen.bin` | Extracted loading screen, ZX0-compressed (2,305 bytes) |
| `mod_main.bin` | Extracted main block with bootstrap + ZX0 payload (26,186 bytes) |
| `mod_decompressed.bin` | Decompressed game code (40,432 bytes @ 0x620C) |
| `mod_full.asm` | z80dasm disassembly of decompressed code |
| `differences.md` | This file |
