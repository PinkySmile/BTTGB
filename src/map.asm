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