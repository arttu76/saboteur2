# Saboteur II — 48K Mod Memory Map

Binary: `mod_decompressed.bin` (40432 bytes, loaded at $620C)

## ZX Spectrum System Areas

| Address       | Size  | Description                                      |
|---------------|-------|--------------------------------------------------|
| $0000–$3FFF   | 16384 | ROM (48K BASIC)                                  |
| $4000–$57FF   |  6144 | Screen pixel bitmap (256×192, 3 banks of 8 rows) |
| $5800–$5AFF   |   768 | Screen colour attributes (32×24 cells)           |
| $5B00–$5BFF   |   256 | Printer buffer (used as data storage by mod)     |
| $5C00–$5CB5   |   182 | BASIC system variables                           |

### System variables used by the mod

| Address | Name    | Usage                                  |
|---------|---------|----------------------------------------|
| $5C09   | REPDEL  | Key repeat initial delay (set to 1)    |
| $5C0A   | REPPER  | Key repeat period (set to 1)           |

## Runtime-Built Tables (created during init at $8574)

| Address       | Size | Description                                    |
|---------------|------|------------------------------------------------|
| $5C70–$5DFF   |  400 | Font character set (copied from $906A)         |
| $5E00–$5EFF   |  256 | Entity lookup table low bytes (n×9 + $AA78)    |
| $5F00–$5FFF   |  256 | Entity lookup table high bytes                 |
| $6000–$60FF   |  256 | Tile lookup table low bytes (n×8 + base)       |
| $6100–$61FF   |  256 | Tile lookup table high bytes                   |
| $F900–$F9FF   |  256 | Bit-reversal table (reverse bit order of byte) |
| $FA00–$FAFF   |  256 | Mask table (spread-and-invert pattern)         |

## Game Binary Layout ($620C–$FFFB)

Total: 40432 bytes. Files listed in memory order.

### Data: Text & Levels ($620C–$820B)

| Address       | Size | File                | Description                              |
|---------------|------|---------------------|------------------------------------------|
| $620C–$620E   |    3 | `entry_jump.asm`    | JP $8574 — redirect to mod init          |
| $620F–$6A08   | 2042 | `data_text.asm`     | Mission text, HUD strings, menu, credits |
| $6A09–$820B   | 6147 | `data_rooms.asm`    | Room definitions & pointer tables (NEW)  |

### Data: Sprite/Entity Tables ($820C–$8573)

| Address       | Size | File                | Description                              |
|---------------|------|---------------------|------------------------------------------|
| $820C–$8573   |  872 | `data_tables1.asm`  | Entity type data, sprite parameters      |

### Code: Initialization ($8574–$865C)

| Address       | Size | File                | Description                              |
|---------------|------|---------------------|------------------------------------------|
| $8574–$858B   |   24 | `code_entry.asm`    | System init (DI, stack, border, kbd)     |
| $858C–$8595   |   10 |                     | Display info screen via ROM PR_STRING    |
| $8598–$85AF   |   24 |                     | Set attributes, wait for keypress        |
| $85B1–$85C1   |   17 |                     | Set initial player position              |
| $85C4–$8606   |   67 |                     | Build lookup tables ($F900, $FA00, etc.) |
| $8608–$8640   |   57 |                     | Random sprite variation, copy font/gfx   |
| $8642–$8645   |    4 |                     | Call game init → JP new game setup       |
| $8648–$865C   |   21 |                     | FILL_MEMORY + BIT_REVERSE_BLOCK helpers  |

### Data: High Scores & Info Screen ($865D–$900B)

| Address       | Size | File                  | Description                            |
|---------------|------|-----------------------|----------------------------------------|
| $865D–$8D5D   | 1793 | `data_highscores.asm` | High score tables #2–#6 (preserved)    |
| $8D5E–$900B   |  686 | `data_infoscreen.asm` | Info/credits screen text & layout (NEW)|

### Code: Info Screen & New Game ($900C–$964B)

| Address       | Size | File                   | Description                           |
|---------------|------|------------------------|---------------------------------------|
| $900C–$9069   |   94 | `code_infoscreen.asm`  | Display data (tile indices, not code)  |
| $906A–$90EB   |  130 |                        | Info screen display + config setup     |
| $90EC–$916B   |  128 | `code_newgame.asm`     | Game display initialization            |
| $916C–$91F3   |  136 |                        | Sprite tile renderer                   |
| $91F4–$92F3   |  256 |                        | DATA: init values + embedded text      |
| $92F4–$92F9   |    6 |                        | NEW GAME ENTRY: init → main loop       |
| $92FA–$94CF   |  470 |                        | DATA: entity/room/config tables        |
| $94D0–$954D   |  126 |                        | ZX0 decompressor (by Einar Saukas)     |
| $954E–$964B   |  254 |                        | DATA: address lookup tables            |

### Data: Rendering & Entities ($964C–$B4CB)

| Address       | Size | File                 | Description                            |
|---------------|------|----------------------|----------------------------------------|
| $964C–$A04B   | 2560 | `data_tables2.asm`   | Attr tables, charset, tile defs, score |
| $A04C–$AA8B   | 2624 | `data_entities.asm`  | Entity spawn tables, handler jumps     |
| $AA8C–$B4CB   | 2624 | `data_sprites.asm`   | Sprite bitmap data (74% preserved)     |

### Code: Input & Main Engine ($B4CC–$E0DF)

| Address       | Size | File               | Description                              |
|---------------|------|--------------------|------------------------------------------|
| $B4CC–$B7F6   |  811 | `code_input.asm`   | Entity data tables (mostly DATA)         |
| $B7F7–$B80B   |   21 |                    | Entity behavior pointer table            |
| $B80C–$B86B   |   96 | `code_engine.asm`  | Tile definition table                    |
| $B86C–$BB4C   |  737 |                    | Room rendering, attribute fill           |
| $BB4D–$BD08   |  444 |                    | Object drawing dispatch & rendering      |
| $BD09–$BFE4   |  732 |                    | Score display, room setup, game state    |
| $BFE5–$C145   |  353 |                    | New game / HUD setup                     |
| $C146–$C33C   |  503 |                    | Room command interpreter                 |
| $C33D–$D306   | 4042 |                    | Entity processing, movement, collision   |
| $D307–$DF01   | 3067 |                    | Sprite rendering, screen helpers         |
| $DF02–$E04A   |  329 |                    | End game, keyboard, misc routines        |
| $E04B–$E0DF   |  149 |                    | Beeper SFX, entity state, screen params  |

### Data: Buffers & Graphics ($E0E0–$FB0F)

| Address       | Size | File                  | Description                            |
|---------------|------|-----------------------|----------------------------------------|
| $E0E0–$E8E7   | 2056 | `data_buffer.asm`     | Runtime scratch buffer (zeroed)        |
| $E8E8–$F80B   | 3876 | `data_gfx.asm`        | Sprite bitmaps, font, handler data     |
| $F80C–$FB0F   |  772 | `data_newtables.asm`  | New lookup tables + runtime buffer     |

### Code: ISR & Sound Engine ($FB10–$FFFB)

| Address       | Size | File              | Description                                |
|---------------|------|-------------------|--------------------------------------------|
| $FB10–$FB39   |   42 | `code_isr.asm`    | IM2 initialization (I=$3B, vector=$FFF4)   |
| $FB3A–$FC11   |  216 |                   | Sound data interpreter (8 commands)        |
| $FC12–$FD0A   |  249 |                   | Beeper frequency generator (cycle-exact)   |
| $FD0C–$FD18   |   13 |                   | Self-modifying runtime storage             |
| $FD19–$FD33   |   27 |                   | Pitch/timing helper routines               |
| $FD34–$FD94   |   97 |                   | MAIN ISR HANDLER (frame timing, kbd, beep) |
| $FD95–$FDC7   |   51 |                   | Speed control engine (CS+S / CS+P)         |
| $FDC8–$FE1C   |   85 |                   | Note frequency computation + table loader  |
| $FE1D–$FE23   |    7 |                   | ADD_A_TO_HL trampoline (embedded in data)  |
| $FE24–$FF3F   |  284 |                   | Sound data: freq table, patterns, effects  |
| $FF40–$FF5F   |   32 |                   | Speed preset table (cycled by CS+S)        |
| $FF60–$FF90   |   49 |                   | Sound routine data (beeper sequences)      |
| $FF91–$FFF3   |   99 |                   | Duplicate sound data + runtime state       |
| $FFF4–$FFFB   |    8 |                   | IM2 vector: JP $FD34 (patched at runtime)  |

## Key Game Variables

### Room & Player State ($EFFA–$EFFF, in data_gfx.asm)

| Address | Description                              |
|---------|------------------------------------------|
| $EFFA   | Room draw handler pointer (2 bytes)      |
| $EFFC   | Player Y position                        |
| $EFFD   | Player Y (secondary)                     |
| $EFFE   | Room row coordinate                      |
| $EFFF   | Room column coordinate                   |

### Game Config ($F8E0–$F8FD, in data_newtables.asm)

| Address | Description                              |
|---------|------------------------------------------|
| $F8E0   | Game state flag 1                        |
| $F8EC   | Movement direction flag                  |
| $F8F3   | Mission config flags                     |
| $F8F6   | Game state flag 2                        |
| $F8F8   | Mission parameter 1                      |
| $F8FB   | Mission/difficulty level (1–6)           |
| $F8FC   | Player type flag                         |

### ISR Self-Modifying Addresses (in code_isr.asm)

| Address | What it patches                          |
|---------|------------------------------------------|
| $FB44   | Sound data pointer (HL continuation)     |
| $FB6C   | Loop counter for LOOP command            |
| $FBD8   | Channel active flag (1=ch1, 2=ch2)      |
| $FC50   | Vibrato depth                            |
| $FC69   | Waveform select                          |
| $FC72   | Vibrato rate counter                     |
| $FC78   | Vibrato rate mask                        |
| $FCC6   | Speaker toggle state                     |
| $FCCF   | Current frequency (2 bytes)              |
| $FCD2   | Duration counter                         |
| $FCD8   | Portamento rate mask                     |
| $FCDC   | Slide step (2 bytes, signed)             |
| $FCE6   | Slide upper bound (2 bytes)              |
| $FCF2   | Slide lower bound (2 bytes)              |
| $FD43   | Saved SP for END command                 |
| $FD4D   | Speed counter value                      |
| $FD58   | Sound routine address (2 bytes)          |
| $FD96   | Speed table pointer (2 bytes)            |
| $FDA7   | Pause counter                            |

## IM2 Interrupt Mechanism

The mod uses IM2 (interrupt mode 2) for its ISR:

1. I register = $3B
2. Z80 bus returns $FF during interrupt acknowledge
3. Vector address = (I × 256) + bus byte = ($3B × $100) + $FF = $3BFF
4. Contents of ($3BFF) = address $FFF4 (reads 2 bytes: $FFF4/$FFF5)
5. At $FFF4: JP $FD34 (written during init at $FB25–$FB28)
6. ISR at $FD34 handles: frame timing, keyboard, speed control, beeper

## Differences from Original 128K Version

The mod converts the game from 128K (with AY-3-8912 sound chip) to
48K-only operation. Key changes:

- **Entry point** moved from $620C to $8574 (original init relocated)
- **Sound engine** completely rewritten: AY chip → beeper driver ($FB10+)
- **Room data** 98% new level designs ($6A09–$820B)
- **Info screen** new credits/config screen ($8D5E–$90EB)
- **ZX0 decompressor** added for sprite data compression ($94D0)
- **Speed control** new CS+S speed cycling system ($FD95)
- No 128K bank switching — all code fits in 48K address space
