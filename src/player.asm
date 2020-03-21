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

	ld a, $40
	ld [hli], a ; BASIC_OBJECT_STRUCT_X_OFF
	ld a, $10
	ld [hli], a ; X SIZE
	xor a
	ld [hli], a ; BASIC_OBJECT_STRUCT_X_SPEED_OFF

	ld a, $70
	ld [hli], a ; BASIC_OBJECT_STRUCT_Y_OFF
	ld a, $10
	ld [hli], a ; Y SIZE
	xor a
	ld [hli], a ; BASIC_OBJECT_STRUCT_Y_SPEED_OFF

	ld a, 2
	ld [hli], a ; DISPLAYABLE_OBJECT_STRUCT_SPRITE
	ld a, %0001
	ld [hli], a ; DISPLAYABLE_OBJECT_STRUCT_ORIENTATION

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
	call movePlayer
	ret

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
	call z, .start
	ret

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
	jp z, .moveRight

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
	jp jump

.down::
	ret


movePlayer::
	ld de, .moveY
	push de

.moveX:
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF]
	ld d, a

	ld hl, SCROLL_X
	ld a, [hl]
	add d
	ld [hl], a

	; Move the map ptr (position of the player on the map)
	ld hl, MAP_PTR_L
	ld a, [hl]
	add d
	ld [hld], a

	ret nz
	bit 7, d
	jp nz, .underflow
	inc [hl]
	ret
.underflow:
	dec [hl]
	ret

.moveY:
	ld a, [PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF]
	ld d, a
	ld a, [MAP + MAP_SIZE_Y_OFF]
	ld e, a

	ld hl, SCROLL_Y
	ld a, [hl]
	add d
	ld [hl], a

	; Move the map ptr (position of the player on the map)
.loop:
	call .moveMapPtrY
	dec e
	jp nz, .loop
	ret

.moveMapPtrY:
	ld hl, MAP_PTR_L
	ld a, [hl]
	add d
	ld [hld], a

	ret nz
	bit 7, d
	jp nz, .yUnderflow
	inc [hl]
	ret
.yUnderflow:
	dec [hl]
	ret

jump::
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SPEED_OFF
	ld [hl], -5
	ret