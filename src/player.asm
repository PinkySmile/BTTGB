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

	; Init the MAP_PTR.
	ld a, [MAP + MAP_SIZE_X_OFF]
	ld c, a
	ld b, 0
	rl c
	rl b
	rl c
	rl b
	rl c
	rl b

	ld h, MAP >> 8
	ld l, MAP & $FF + MAP_SIZE_TILES_OFF
	add hl, bc
	ld b, 0
	ld c, PLAYER_POSITION_X / 8
	add hl, bc
	push hl
	pop bc

	ld hl, MAP_PTR_H
	ld [hl], b
	inc hl
	ld [hl], c
	ret

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
	call executePlayerActions

	ld hl, OAM_SRC_START
	ld d, h
	ld e, l
	ld hl, PLAYER_STRUCT
	call renderDisplayableObject
	jp movePlayer

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
	call getKeys
	ld b, a
	bit 0, b
	call z, .right
	bit 1, b
	call z, .left
	bit 2, b
	call z, .up
	bit 3, b
	call z, .down
	bit 4, b
	call z, .a
	bit 5, b
	call z, .b
	bit 6, b
	call z, .select
	bit 7, b
	jp z, .start

.b::
	ret

.start::
	ret

.select::
	ret

.right::
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
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF

	bit 7, [hl]
	ret nz

	dec [hl]
	ret

.a::
.up::
	call initGravity
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF
	ld [hl], -5
	ret

.down::
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
	ld de, .moveY
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

	; Move the map ptr (position of the player on the map)
	ld hl, MAP_PTR_L
	ld a, [hl]
	add d
	ld [hld], a

	ret nz
	bit 7, d
	jr nz, .underflow
	inc [hl]
	jp updateCameraH

.underflow:
	dec [hl]
	jp updateCameraH

.moveY:
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	or a
	ret z
	ld d, a
	ld b, a
	ld a, [MAP + MAP_SIZE_Y_OFF]
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
	push de

	; Move the map ptr (position of the player on the map)
.loopPos:
	ld hl, MAP_PTR_L
	ld a, [hl]
	add e
	ld [hld], a
	jr nc, .updateCamera
	inc [hl]
	jr .updateCamera

.neg::
	pop af
	pop bc

	and 7
	ld c, a
	ld a, b
	and 7
	cp c
	ret nc
	push de

.loopNeg:
	ld hl, MAP_PTR_L
	ld a, [hl]
	sub e
	ld [hld], a

	jr nc, .updateCamera
	dec [hl]

.updateCamera:
	pop de

	jp updateCameraV


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
	ret z

	; Do not check collisions if the player moves to the right.
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	bit 7, a ; bit clear the carry flag
	ret z
	ld b, a

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
	ld b, b
	ld e, a
	inc de
	inc de ;Get the top right tile of the player

	; Do not collide if the tile is not solid
	ld a, [de]
	and TILE_IS_SOLID ; and clear the carry flag.
	ret z

	; Do not check collisions if the player moves to the left.
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	bit 7, a ; bit clear the carry flag
	ret nz
	or a ; or clear the carry flag
	ret z
	ld b, a

	scf ; set the carry flag
	ret