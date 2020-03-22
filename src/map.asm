copyMap::
	ld a, [hli]
	ld b, a
	ld a, [hli]
	add $42
	ld c, a
	ld a, b
	adc $00
	ld b, a

	call copyMemory

; Copies a map column
; Params:
;    a  -> Size of the column
;    de -> Address to place the column in
;    hl -> Position of the map column to copy
;    c  -> Offset between each byte
; Return:
;    de -> The address of the next sprite
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
copyMapColumn::
	push af
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld b, a
	pop af
	push af
.loop::
	ld a, [hl]

	push bc
	ld c, a
	reg VRAM_BANK_SELECT, 1
	ld a, c
	and TILE_PALETTE
	rra
	rra
	rra
	rra
	rra
	ld [de], a
	reset VRAM_BANK_SELECT

	ld a, c
	and TILE_TEXTURE
	ld [de], a
	pop bc

	ld a, e
	add c
	ld e, a
	ld a, d
	adc $00
	ld d, a

	ld a, l
	add b
	ld l, a
	ld a, h
	adc $00
	ld h, a

	pop af
	dec a
	push af
	jr nz, .loop

	pop af
	ret

; Loads a map
; Params:
;    a  -> ROM bank where the map is stored
;    hl -> Address of the map to load
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
loadMap::
	ld [ROM_BANK_SWITCH], a
	call waitVBLANK
	reset LCD_CONTROL

	ld de, MAP
	call copyMap

	ld hl, BOTTOM_LEFT_VRAM_START_L

	ld a, MAP_VRAM_START_BOTTOM_LEFT & $FF
	ld [hli], a ; BOTTOM_LEFT_VRAM_START_L

	ld a, MAP_VRAM_START_BOTTOM_LEFT >> 8
	ld [hli], a ; BOTTOM_LEFT_VRAM_START_H

	push hl
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld h, a
	ld b, 0
	ld c, a

	rl c
	rl b
	rl c
	rl b

	ld d, b
	ld e, c

	rl e
	rl d
	rl e
	rl d

	ld a, c
	add e
	ld c, a

	ld a, b
	adc d
	ld b, a

	ld a, c
	sub h
	ld c, a

	ld a, b
	sbc $00
	ld b, a

	pop hl
	ld a, c
	add (MAP + MAP_SIZE_TILES_OFF) & $FF
	ld [hli], a ; BOTTOM_LEFT_MAP_START_L

	ld a, b
	adc (MAP + MAP_SIZE_TILES_OFF) >> 8
	ld [hli], a ; BOTTOM_LEFT_MAP_START_H


	ld a, MAP_VRAM_START_TOP_RIGHT & $FF
	ld [hli], a ; TOP_RIGHT_VRAM_START_L
	ld a, MAP_VRAM_START_TOP_RIGHT >> 8
	ld [hli], a ; TOP_RIGHT_VRAM_START_H

	ld a, 21
	add (MAP + MAP_SIZE_TILES_OFF) & $FF
	ld [hli], a ; TOP_RIGHT_MAP_START_L

	ld a, 0
	adc (MAP + MAP_SIZE_TILES_OFF) >> 8
	ld [hli], a ; TOP_RIGHT_MAP_START_H


	ld a, MAP_VRAM_START_LEFT_LEFT & $FF
	ld [hli], a ; LEFT_LEFT_VRAM_START_L
	ld a, MAP_VRAM_START_LEFT_LEFT >> 8
	ld [hli], a ; LEFT_LEFT_VRAM_START_H
	ld a, MAP_MAP_START_LEFT_LEFT & $FF
	ld [hli], a ; LEFT_LEFT_MAP_START_L
	ld a, MAP_MAP_START_LEFT_LEFT >> 8
	ld [hli], a ; LEFT_LEFT_MAP_START_H


	ld a, MAP_VRAM_START_TOP_LEFT & $FF
	ld [hli], a ; TOP_LEFT_VRAM_START_L
	ld a, MAP_VRAM_START_TOP_LEFT >> 8
	ld [hli], a ; TOP_LEFT_VRAM_START_H

	ld a, [MAP + MAP_SIZE_X_OFF]
	ld b, a
	ld a, (MAP + MAP_SIZE_TILES_OFF) & $FF
	sub b
	ld [hli], a ; TOP_LEFT_MAP_START_L

	ld a, (MAP + MAP_SIZE_TILES_OFF) >> 8
	sbc 0
	ld [hli], a ; TOP_LEFT_MAP_START_H


	ld hl, MAP + MAP_SIZE_PAL_OFF
	ld bc, $40
	ld a, 0
	ld e, BGPI & $FF
	call setGBCPalette

	reg SCROLL_X, $8
	reg SCROLL_Y, $8

	ld a, [MAP + MAP_SIZE_X_OFF]
	inc a

	ld d, a
	ld a, l
	sub d
	ld l, a
	ld a, h
	sbc $0
	ld h, a

	ld de, VRAM_BG_START
	ld b, 20
.loop:
	ld c, 22
.copyLoop:
	ld a, [hli]

	push bc
	ld b, a
	and TILE_TEXTURE
	ld [de], a

	reg VRAM_BANK_SELECT, 1
	ld a, b
	and TILE_PALETTE
	rra
	rra
	rra
	rra
	rra
	ld [de], a
	reset VRAM_BANK_SELECT
	pop bc

	inc de
	dec c
	jr nz, .copyLoop

	ld a, e
	add 10
	ld e, a
	ld a, d
	adc $00
	ld d, a

	push hl
	ld hl, MAP + MAP_SIZE_X_OFF
	ld a, [hl]
	pop hl

	sub 22
	add l
	ld l, a
	ld a, h
	adc $00
	ld h, a

	dec b
	jr nz, .loop
	reg ROM_BANK_SWITCH, 1
	ret