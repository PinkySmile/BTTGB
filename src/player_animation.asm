initAnimation::
	ld hl, ANIMATION_TIMER
	ld [hl], ANIMATION_TIME
	ret

updateAnimation::
	ld hl, ANIMATION_TIMER
	ld a, 0
	cp [hl]
	jr z, .animate
	dec [hl]
	ret

.animate
	call playerAnimationIdle
	call initAnimation
	ret

playerAnimationIdle::
	ld hl, PLAYER_STRUCT + DISPLAYABLE_OBJECT_STRUCT_SPRITE
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld a, 0
	cp [hl]
	jr z, .resetAnim
	ret

.resetAnim
	ld [hl], PLAYER_SPRITE_NBR
	ret