; Initialize the player.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
initPlayers::
	ld hl, PLAYER_STRUCT

	ld a, PLAYER_POSITION_X
	ld [hli], a ; BASIC_OBJECT_STRUCT_X_OFF
	ld a, $10
	ld [hli], a ; X SIZE
	xor a
	ld [hli], a ; BASIC_OBJECT_STRUCT_X_SPEED_OFF

	ld a, PLAYER_POSITION_Y
	ld [hli], a ; BASIC_OBJECT_STRUCT_Y_OFF
	ld a, $10
	ld [hli], a ; Y SIZE
	xor a
	ld [hli], a ; BASIC_OBJECT_STRUCT_Y_SPEED_OFF

	ld a, PLAYER_SPRITE_NBR
	ld [hli], a ; DISPLAYABLE_OBJECT_STRUCT_SPRITE
	ld a, %0001
	ld [hli], a ; DISPLAYABLE_OBJECT_STRUCT_ORIENTATION
	ret

endGame::
	ld sp, $E000
	reset LCD_CONTROL

	ld de, VRAM_START
	ld bc, $1C00
	call fillMemory

	xor a
	ld bc, $A0
	ld de, OAM_SRC_START
	call fillMemory

	reg VRAM_BANK_SELECT, 1
	ld de, VRAM_START
	ld bc, $1C00
	call fillMemory
	reset VRAM_BANK_SELECT

	ld hl, finalScore
	ld bc, finalScoreEnd - finalScore
	ld de, $9A20
	call copyMemory

	xor a
	ld bc, $18
	ld hl, DMGPal
	ld e, BGPI & $FF
	call setGBCPalette
	call loadSprites
	ld hl, pressStart
	ld bc, pressStartEnd - pressStart
	ld de, $9984
	call copyMemory

	ld hl, VRAM_BG_START + $20 + 6
	ld b, 8
	ld a, $60
.copyLogo:
	ld c, 8
.copyLogoLine::
	push af
	ld [hl], a
	reg VRAM_BANK_SELECT, 1
	ld [hli], a
	reset VRAM_BANK_SELECT
	pop af
	inc a
	dec c
	jr nz, .copyLogoLine

	push af
	ld a, l
	add $20 - 8
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop af

	dec b
	jr nz, .copyLogo

	reset SCROLL_X
	reset SCROLL_Y

	ld hl, MenuLogo
	ld bc, MenuLogoEnd - MenuLogo
	ld de, $8600
	call copyMemory

	reg LCD_CONTROL, LCD_BASE_CONTROL

.loop:
	call waitVBLANK
	call updateMusics
	call getKeys
	bit 7, a
	jr nz, .loop

.mainMenu:
	reset LCD_CONTROL

	ld de, VRAM_START
	ld bc, $1800
	call fillMemory

	xor a
	ld de, MUSIC_CHANNEL_1
	ld bc, 20
	call fillMemory

	xor a
	ld bc, $18
	ld hl, DMGPal
	ld e, BGPI & $FF
	call setGBCPalette
	call loadSprites

	xor a
	ld hl, textAssets + 32 * 8
	ld bc, textAssetsEnd - (textAssets + 32 * 8)
	ld de, VRAM_START + 32 * 16
	call uncompress

	reg WY, $90
	jp mainMenu

; Update the player.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
updatePlayer::
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF
	ld [hl], 0

	ld hl, OAM_SRC_START
	ld d, h
	ld e, l
	ld hl, PLAYER_STRUCT
	call renderDisplayableObject
	;call executePlayerActions FALLTHROUGH

; Read input and execute the actions associated.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Preserved
;    de -> Preserved
;    hl -> Not preserved
executePlayerActions::
	call getKeysFiltered
	ld b, a
	bit 2, b
	call z, .up
	bit 4, b
	call z, .a

	call getKeys
	ld b, a
	bit 0, b
	call z, .right
	bit 1, b
	call z, .left
	bit 3, b
	call z, .down
	bit 6, b
	call z, .select
	bit 7, b
	call z, .start

	call movePlayer
	jr tag

.start::
	ret

.select::
	ret

.right::
	ld hl, PLAYER_STRUCT + DISPLAYABLE_OBJECT_STRUCT_ORIENTATION
	ld a, %0001
	ld [hl], a

	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF

	xor a
	or [hl]
	jr z, .moveRight

	bit 7, [hl]
	ret z

.moveRight:
	inc [hl]
	ret

.left::
	ld hl, PLAYER_STRUCT + DISPLAYABLE_OBJECT_STRUCT_ORIENTATION
	ld a, %0000
	ld [hl], a

	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF

	bit 7, [hl]
	ret nz

	dec [hl]
	ret

.down::
	ret

.a::
.up::
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	cp 0
	jr z, .ok

	ld a, [PLAYER_STRUCT + HAS_DOUBLE_JUMP_OFF]
	cp 0
	ret z
	xor a
	ld [PLAYER_STRUCT + HAS_DOUBLE_JUMP_OFF], a

.ok:
	call initGravity
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF
	ld [hl], -3
	ret

tag::
	ld a, [MAP_PTR_H]
	ld h, a
	ld a, [MAP_PTR_L]
	ld l, a
	ld d, 0
	ld e, 0

	ld a, [hl]
	or a
	jr z, .ok ; Check if the tile is a target

	inc hl
	ld a, [hl]
	or a
	ret nz
	ld e, 1

.ok:
	call random
	and %11
	ld b, h
	ld c, l

	ld hl, MAP + MAP_NB_TARGETS_OFF
	dec [hl]
	jr nz, .notEnd

	ld hl, CURRENTLY_LOADED_MAP
	ld a, [hl]
	inc a
	ld [hl], a
	cp (allMapsEnd - allMaps) / 3
	jp z, endGame

	ld d, a
	rla
	res 0, a
	add d
	add allMaps & $FF
	ld e, a
	ld a, allMaps >> 8
	adc $0
	ld d, a

	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	ld a, [de]
	call loadMap
	reg LCD_CONTROL, LCD_BASE_CONTROL
	ret

.notEnd:
	ld h, 0
	ld l, a
	push de
	ld de, MAP + MAP_TAGS_OFF
	add hl, de
	pop de
	ld a, [hl]
	push af

	ld h, b
	ld l, c
	ld [hl], a ; Change the tile in the ram.

	ld hl, STAT_CONTROL
.waitEndHBlank:
	bit 1, [hl]
	jr z, .waitEndHBlank
.waitHBlank:
	bit 1, [hl]
	jr nz, .waitHBlank

	call getCamPos
	ld a, l
	and %11100000
	ld c, a
	ld a, PLAYER_POSITION_X / 8
	bit 0, e
	jr z, .notRight
	add 1
.notRight:
	add l
	and %00011111
	or c
	ld l, a
	ld a, $20
	ld d, 0
	ld e, a
	rl e
	rl d
	rl e
	rl d
	rl e
	rl d
	add hl, de ; hl now contains the vram address of the target's texture.
	ld a, h
	and $9B
	ld h, a

	pop af
	push af
	and a, TILE_TEXTURE ; a now contails the texture id
	ld [hl], a

	reg VRAM_BANK_SELECT, 1
	pop af
	and a, TILE_PALETTE
	rra
	rra
	rra
	rra
	rra ; a now contails the palette id
	ld [hl], a
	reset VRAM_BANK_SELECT

	reg PLAYER_STRUCT + DISPLAYABLE_OBJECT_STRUCT_SPRITE, PLAYER_SPRITE_PAINT_NBR
	call initPaintAnimation

	ret


collidedLeft::
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF
	inc [hl]
	ret

collidedRight::
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF
	dec [hl]
	ret

movePlayer::
	ld de, moveY
	push de

.moveX:
	; Check collisions.
	call collideLeft
	jr c, collidedLeft
	call collideRight
	jr c, collidedRight

	; Initialize value for the move.
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	or a
	ret z
	ld d, a

	ld hl, SCROLL_X
	ld a, [hl]
	push af
	add d
	ld [hl], a

	pop af
	bit 7, d
	jr nz, .negX
	and 7
	cp 7
	ret nz
	jr .endNegX
.negX:
	and 7
	ret nz
.endNegX:
	pop hl

	; Move the map ptr (position of the player on the map)
	ld hl, MAP_PTR_L
	ld a, [hl]
	add d
	ld [hld], a

	bit 7, d
	jr nz, .underflow
	ret nc
	inc [hl]
	ret

.underflow:
	ret c
	dec [hl]
	ret

collidedBelow::
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF
	dec [hl]
	ld a, 1
	ld [PLAYER_STRUCT + HAS_DOUBLE_JUMP_OFF], a
	ret

collidedUp::
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF
	inc [hl]
	ret

moveY::
	;check collisions on Y
	call collideBelow
	jr c, collidedBelow
	call collideUp
	jr c, collidedUp

	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	or a
	ret z
	ld d, a
	ld b, a
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld e, a

	ld hl, SCROLL_Y
	ld a, [hl]
	push af
	add d
	ld [hl], a
	push af

	; Minus operator - if the number is neg, replace $FB (-5) by 5 etc
	bit 7, d
	jr nz, .neg

	pop bc
	pop af

	and 7
	ld c, a
	ld a, b
	and 7
	cp c
	ret nc

	; Move the map ptr (position of the player on the map)
.loopPos:
	ld hl, MAP_PTR_L
	ld a, [hl]
	add e
	ld [hld], a
	ret nc
	inc [hl]
	ret

.neg::
	pop af
	pop bc

	and 7
	ld c, a
	ld a, b
	and 7
	cp c
	ret nc

.loopNeg:
	ld hl, MAP_PTR_L
	ld a, [hl]
	sub e
	ld [hld], a

	ret nc
	dec [hl]
	ret


; Check left collisions for the player.
; Params:
;    None
; Return:
;    c -> set if the player collide.
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
collideLeft::
	ld a, [MAP_PTR_H]
	ld d, a
	ld a, [MAP_PTR_L]
	ld e, a ;Get the top left tile of the player

	; Do not collide if the tile is not solid
	ld a, [de]
	and TILE_IS_SOLID ; and clear the carry flag.
	jr nz, .ok

	; Check for the lower half of the body.
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld h, 0
	ld l, a
	add hl, de
	ld a, [hl]
	and TILE_IS_SOLID ; and clear the carry flag.
	ret z

	; Do not check collisions if the player moves to the right.
.ok:
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	bit 7, a ; the c flag can't be set because the 'and' clear it.
	ret z

	scf ; set the carry flag
	ret

; Check right collisions for the player.
; Params:
;    None
; Return:
;    c -> set if the player collide.
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
collideRight::
	ld a, [MAP_PTR_H]
	ld d, a
	ld a, [MAP_PTR_L]
	ld e, a
	inc de
	inc de ;Get the top right tile of the player

	; Do not collide if the tile is not solid
	ld a, [de]
	and TILE_IS_SOLID ; and clear the carry flag.
	jr nz, .ok

	; Check for the lower half of the body.
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld h, 0
	ld l, a
	add hl, de
	ld a, [hl]
	and TILE_IS_SOLID ; and clear the carry flag.
	ret z

	; Do not check collisions if the player moves to the left.
.ok:
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	bit 7, a ; the c flag can't be set because the 'and' clear it.
	ret nz
	or a ; or clear the carry flag
	ret z

	scf ; set the carry flag
	ret

; Check Below collisions for the player.
; Params:
;    None
; Return:
;    c -> set if the player collide.
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
collideBelow::
	ld a, [MAP_PTR_H]
	ld d, a
	ld a, [MAP_PTR_L]
	ld e, a ;Get the top left tile of the player

	; Check for the upper half of the body.
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld b, 0
	ld c, a
	ld h, 0
	ld l, a
	add hl, bc
	add hl, de

	ld a, [SCROLL_X]
	and 7
	cp 7
	jr nz, .skipOffsetX
	inc hl
.skipOffsetX:
	ld a, [hl]
	and TILE_IS_SOLID ; and clear the carry flag.
	jr nz, .ok

	inc hl
	ld a, [hl]
	and TILE_IS_SOLID
	ret z

.ok:
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	bit 7, a  ; the c flag can't be set because the 'and' clear it.
	ret nz
	or a
	ret z

	scf ; set the carry flag
	ret

; Check Upper collisions for the player.
; Params:
;    None
; Return:
;    c -> set if the player collide.
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
collideUp::
	ld a, [MAP_PTR_H]
	ld d, a
	ld a, [MAP_PTR_L]
	ld e, a ;Get the top left tile of the player

	ld a, [SCROLL_X]
	and 7
	cp 7
	jr nz, .skipOffsetX
	inc de
.skipOffsetX:
	ld a, [de]
	and TILE_IS_SOLID ; and clear the carry flag.
	jr nz, .ok

	inc de
	ld a, [de]
	and TILE_IS_SOLID
	ret z

.ok:
	; check if it is a one way
	ld a, [de]
	and %00001111
	ret z

	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	bit 7, a  ; the c flag can't be set because the 'and' clear it.
	ret z

	scf ; set the carry flag
	ret