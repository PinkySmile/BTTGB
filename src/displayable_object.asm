; Renders a displayable object
; Params:
;    de -> Address to place the sprites to
;    hl -> Object to render
; Return:
;    de -> The address of the next sprite
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
renderDisplayableObject::
	push hl
	xor a
	ld a, l
	add DISPLAYABLE_OBJECT_STRUCT_ORIENTATION
	ld l, a
	ld a, h
	adc $0
	ld h, a

	ld a, [hl]
	or a
	jr z, displayObjectReversed

displayObject:
	dec hl
	ld a, [hl]
	pop hl
	push af

	ld b, 0
.loopY:
	ld c, 0
.loopX:
	ld a, b
	add $10
	ld [de], a
	inc de

	ld a, c
	add $8
	ld [de], a
	inc de

	pop af
	ld [de], a
	inc de
	inc a
	push af

	push hl
	xor a
	ld a, l
	add DISPLAYABLE_OBJECT_STRUCT_ORIENTATION
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hl]
	pop hl

	rra
	and $8

	ld [de], a
	inc de

	push hl
	inc hl
	ld a, c
	add $8
	ld c, a
	cp [hl]
	pop hl
	jr c, .loopX

	push hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, b
	add $8
	ld b, a
	cp [hl]
	pop hl
	jr c, .loopY

	pop af
	ret

displayObjectReversed:
	dec hl
	ld a, [hl]
	pop hl
	push af

	inc hl
	ld b, a
	ld a, [hl]
	rra
	rra
	rra
	and %00011111
	add b
	dec hl

	ld b, 0
.loopY:
	ld c, 0
.loopX:
	ld a, b
	add $10
	ld [de], a
	inc de

	ld a, c
	add $8
	ld [de], a
	inc de

	pop af
	ld [de], a
	inc de
	dec a
	push af

	push hl
	xor a
	ld a, l
	add DISPLAYABLE_OBJECT_STRUCT_ORIENTATION
	ld l, a
	ld a, h
	adc $0
	ld h, a
	ld a, [hl]
	pop hl
	jr nz, .loopX

	push hl
	inc hl
	push bc
	ld b, a
	ld a, [hl+]
	rra
	rra
	rra
	and %00011111
	add b
	pop bc

	inc hl
	inc hl
	ld a, b
	add $8
	ld b, a
	cp [hl]
	pop hl
	jr c, .loopY

	pop af
	ret