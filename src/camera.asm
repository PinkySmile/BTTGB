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
;getCamPos::
;	ld h, VRAM_BG_START >> 8
;	ld a, [SCROLL_X]
;	rra
;	rra
;	rra
;	and %00011111
;	ld l, a
;
;	ld a, [SCROLL_Y]
;	and %11111000
;	ld b, 0
;	ld c, a
;
;	rl b
;	rl c
;	rl b
;	rl c
;
;	add hl, bc
;	ret