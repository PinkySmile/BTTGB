; Initialize the gravity timer.
; Params:
;    hl -> pointer to the first basic object structure
; Return:
;    set z if there is a collision
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
checkCollisionsUnderPlayer::
	; if the tile where the player is is standing is solid
	ld a, [MAP_PTR_L]
	ld b, b
	and TILE_IS_SOLID
	ld b, b
	dec a
	ld b, b
	ret z
	; tile under the player
	ld a, [MAP_PTR_L + MAP_SIZE_X_OFF]
	ld b, b
	and TILE_IS_SOLID
	ld b, b
	dec a
	ld b, b
	ret z
	; tile under left the player
	ld a, [MAP_PTR_L + MAP_SIZE_X_OFF - 1]
	ld b, b
	and TILE_IS_SOLID
	ld b, b
	dec a
	ld b, b
	ret z
	; tile under right the player
	ld a, [MAP_PTR_L + MAP_SIZE_X_OFF + 1]
	ld b, b
	and TILE_IS_SOLID
	ld b, b
	dec a
	ret z
	ld b, b
	; if no collision
	ret