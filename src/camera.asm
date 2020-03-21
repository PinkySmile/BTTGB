updateCameraH::
	ld hl, VRAM_BG_START

	bit 7, d
	jr nz, .left

.right:
	; $9B
	ret

.left:
	ret

updateCameraV::
	;ld b, b
	call getCamPos

	ld a, l
	and %11111000

	ld a, [MAP + MAP_SIZE_X_OFF]
	ld c, a
	ld b, 0
	rl c
	rl b
	rl c
	rl b
	rl c
	rl b

	bit 7, d
	jr nz, .loopStart

.down:
	ld bc, $240
	add hl, bc

.loopStart:
	push hl
	ld hl, MAP_PTR_H
	ld a, [hl]
	pop hl
	ld b, 20

.loop:
	ld a, [de]
	ld b, a
	inc de
	and TILE_TEXTURE
	ld [hl], a
	reg VRAM_BANK_SELECT, 1
	ld a, b
	and TILE_PALETTE
	ld [hl], a
	reset VRAM_BANK_SELECT
	dec b
	jr nz, .loop
	ret

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

	rl b
	rl c
	rl b
	rl c

	add hl, bc
	ret