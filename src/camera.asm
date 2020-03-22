updateCameras::
	ld hl, SCROLL_Y
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld hl, OLD_SCROLL_X
	ld a, [hl]
	ld b, a
	ld a, d
	ld [hli], a

	ld a, [hl]
	ld c, a
	ld a, e
	ld [hli], a

	ld h, d
	ld l, e

	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	push af
	or a
	jr z, .noUpdateX

	bit 7, a
	jr nz, .negX

	ld a, b
	and 7
	ld b, a
	ld a, h
	and 7
	cp b
	jr nc, .noUpdateX
	jr .updateX

.negX:
	ld a, h
	and 7
	ld h, a
	ld a, b
	and 7
	cp h
	jr nc, .noUpdateX
.updateX:
	pop de
	jp updateCameraH

.noUpdateX:
	pop af
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	push af
	or a
	jr z, .noUpdateY

	bit 7, a
	jr nz, .negY

	ld a, c
	and 7
	ld c, a
	ld a, l
	and 7
	cp c
	jr nc, .noUpdateY
	jr .updateY

.negY:
	ld a, l
	and 7
	ld l, a
	ld a, c
	and 7
	cp l
	jr nc, .noUpdateY
.updateY:
	pop de
	jp updateCameraV
.noUpdateY:
	pop af
	ret

updateCameraH::
	or d
	ret z
	ld hl, VRAM_BG_START

	bit 7, d
	jr nz, .left

.right:
	ld hl, TOP_RIGHT_VRAM_START_L
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, a
	ld l, b

	ld c, 21
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld b, a

.loopRight:
	ld a, [hl]
	push af
	and a, TILE_TEXTURE
	ld [de], a

	reg VRAM_BANK_SELECT, 1
	pop af
	and a, TILE_PALETTE
	rra
	rra
	rra
	rra
	rra
	ld [de], a
	reset VRAM_BANK_SELECT

	ld a, l
	add b
	ld l, a
	ld a, h
	adc $0
	ld h, a

	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	and $9B
	ld d, a

	dec c
	jr nz, .loopRight

	ld hl, BOTTOM_LEFT_VRAM_START_L
	ld b, 4

.changeLoopRight:
	ld a, [hl]
	push bc
	push af
	inc a
	and %00011111
	ld b, a

	pop af
	and %11100000
	or b
	pop bc

	ld [hli], a
	inc hl

	ld a, [hl]
	add $1
	ld [hli], a

	ld a, [hl]
	adc $0
	ld [hli], a

	dec b
	jr nz, .changeLoopRight
	ret

.left:
	ld hl, LEFT_LEFT_VRAM_START_L
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, a
	ld l, b

	ld c, 21
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld b, a

.loopLeft:
	ld a, [hl]
	push af
	and a, TILE_TEXTURE
	ld [de], a

	reg VRAM_BANK_SELECT, 1
	pop af
	and a, TILE_PALETTE
	rra
	rra
	rra
	rra
	rra
	ld [de], a
	reset VRAM_BANK_SELECT

	ld a, l
	add b
	ld l, a
	ld a, h
	adc $0
	ld h, a

	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	and $9B
	ld d, a

	dec c
	jr nz, .loopLeft

	ld hl, BOTTOM_LEFT_VRAM_START_L
	ld b, 4
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld c, a

.changeLoopLeft:
	ld a, [hl]
	push bc
	push af
	dec a
	and %00011111
	ld b, a

	pop af
	and %11100000
	or b
	pop bc

	ld [hli], a
	inc hl

	ld a, [hl]
	sub $1
	ld [hli], a

	ld a, [hl]
	sbc $0
	ld [hli], a

	dec b
	jr nz, .changeLoopLeft
	ret



updateCameraV::
	bit 7, d
	jr nz, .up

.down:
	ld hl, BOTTOM_LEFT_VRAM_START_L
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, a
	ld l, b

	ld a, e
	and %00011111
	ld b, a
	ld a, e
	and %11100000
	ld e, a
	ld c, 21

.loopDown:
	ld a, e
	or b
	ld e, a
	ld a, [hli]
	push af
	and a, TILE_TEXTURE
	ld [de], a
	reg VRAM_BANK_SELECT, 1
	pop af
	and a, TILE_PALETTE
	rra
	rra
	rra
	rra
	rra
	ld [de], a
	reset VRAM_BANK_SELECT
	ld a, e
	and %11100000
	ld e, a

	ld a, b
	inc a
	and %00011111
	ld b, a
	dec c
	jr nz, .loopDown

	ld hl, BOTTOM_LEFT_VRAM_START_L
	ld b, 4
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld c, a

.changeLoopDown:
	ld a, [hl]
	add $20
	ld [hli], a

	ld a, [hl]
	adc $0
	and $9B
	ld [hli], a

	ld a, [hl]
	add c
	ld [hli], a

	ld a, [hl]
	adc $0
	ld [hli], a

	dec b
	jr nz, .changeLoopDown
	ret


.up:
	ld hl, TOP_LEFT_VRAM_START_L
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, a
	ld l, b

	ld a, e
	and %00011111
	ld b, a
	ld a, e
	and %11100000
	ld e, a
	ld c, 21

.loopUp:
	ld a, e
	or b
	ld e, a
	ld a, [hli]
	push af
	and a, TILE_TEXTURE
	ld [de], a
	reg VRAM_BANK_SELECT, 1
	pop af
	and a, TILE_PALETTE
	rra
	rra
	rra
	rra
	rra
	ld [de], a
	reset VRAM_BANK_SELECT
	ld a, e
	and %11100000
	ld e, a

	ld a, b
	inc a
	and %00011111
	ld b, a
	dec c
	jr nz, .loopUp

	ld hl, BOTTOM_LEFT_VRAM_START_L
	ld b, 4
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld c, a

.changeLoopUp:
	ld a, [hl]
	sub $20
	ld [hli], a

	ld a, [hl]
	sbc $0
	or $98
	and $9B
	ld [hli], a

	ld a, [hl]
	sub c
	ld [hli], a

	ld a, [hl]
	sbc $0
	ld [hli], a

	dec b
	jr nz, .changeLoopUp
	ret

;	call getCamPos
;
;	ld a, l
;	and %11111000
;
;	ld a, [MAP + MAP_SIZE_X_OFF]
;	ld c, a
;	ld b, 0
;	rl c
;	rl b
;	rl c
;	rl b
;	rl c
;	rl b
;
;	bit 7, d
;	jr nz, .loopStart
;
;.down:
;	ld bc, $240
;	add hl, bc
;
;.loopStart:
;	push hl
;	ld hl, MAP_PTR_H
;	ld a, [hl]
;	pop hl
;	ld b, 20
;
;.loop:
;	ld a, [de]
;	ld b, a
;	inc de
;	and TILE_TEXTURE
;	ld [hl], a
;	reg VRAM_BANK_SELECT, 1
;	ld a, b
;	and TILE_PALETTE
;	ld [hl], a
;	reset VRAM_BANK_SELECT
;	dec b
;	jr nz, .loop
;	ret
;
getCamPos::
	ld h, VRAM_BG_START >> 8
	ld a, [SCROLL_X]
	rra
	rra
	rra
	and %00011111
	ld l, a

	ld a, [SCROLL_Y]
	and %11111000
	ld b, 0
	ld c, a

	rl c
	rl b
	rl c
	rl b

	add hl, bc
	ret