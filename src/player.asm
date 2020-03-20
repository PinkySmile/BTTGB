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
	ld b,b
	xor a
	ld hl, PLAYER_STRUCT
	ld [hli], a ; BASIC_OBJECT_STRUCT_X_OFF
	inc hl ; Skip the X size
	ld [hli], a ; BASIC_OBJECT_STRUCT_X_SPEED_OFF
	ld [hli], a ; BASIC_OBJECT_STRUCT_Y_OFF
	inc hl ; Skip the Y size
	ld [hli], a ; BASIC_OBJECT_STRUCT_Y_SPEED_OFF
	ld a, PLAYER_SPRITE_NBR
	ld [hli], a ; DISPLAYABLE_OBJECT_STRUCT_SPRITE
	ld a, %0001
	ld [hli], a ; DISPLAYABLE_OBJECT_STRUCT_ORIENTATION

	ld a, $10
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SIZE_OFF
	ld [hl], a
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_Y_SIZE_OFF
	ld [hl], a

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
	ld hl, OAM_SRC_START
	ld d, h
	ld e, l
	ld hl, PLAYER_STRUCT
	ld b, b
	call renderDisplayableObject
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

.a::
	ret

.b::
	ret

.start::
	ret

.select::
	ret

.right::
	ret

.left::
	ret

.up::
	ret

.down::
	ret