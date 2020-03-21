; Initialize the animations timer.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
initAnimation::
	ld hl, ANIMATION_TIMER
	ld [hl], ANIMATION_TIME
	ret

; Update animations.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
updateAnimation::
	ld hl, ANIMATION_TIMER
	ld a, 0
	cp [hl]
	jr z, .animate
	dec [hl]
	ret

.animate
	ld hl, PLAYER_STRUCT + BASIC_OBJECT_STRUCT_X_SPEED_OFF
	ld a, 0
	cp [hl]
	jr z, .idle
	call playerAnimationWalk
	call initAnimation
	ret

.idle
	call playerAnimationIdle
	call initAnimation
	ret

; Animate player idle.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
playerAnimationIdle::
	ld hl, PLAYER_STRUCT + DISPLAYABLE_OBJECT_STRUCT_SPRITE
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld a, PLAYER_SPRITE_NBR + 12
	cp [hl]
	jr c, .resetIdleAnim
	ret

.resetIdleAnim
	ld [hl], PLAYER_SPRITE_NBR
	ret

; Animate player walk.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
playerAnimationWalk::
	ld hl, PLAYER_STRUCT + DISPLAYABLE_OBJECT_STRUCT_SPRITE
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld a, PLAYER_SPRITE_WALK_NBR + 12
	cp [hl]
	jr z, .resetWalkAnim
	ret

.resetWalkAnim
	ld [hl], PLAYER_SPRITE_WALK_NBR
	ret