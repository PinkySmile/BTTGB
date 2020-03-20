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

	ld bc, 0
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
	;a = this->sprite + (this->sizeY + 1) * this->sizeX / 8;
	;for (int y = a->sizeY; y > 0; y -= 8) {
	;	for (int x = a->sizeX; x > 0; x -= 8) {
	;		printSprite(x, y, a, fliped, fliped);
	;		a--;
	;	}
	;}
	ret