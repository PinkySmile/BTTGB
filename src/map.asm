copyMap::
	ld a, [hli]
	ld b, a
	ld a, [hli]
	add $06
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
	ld [de], a

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