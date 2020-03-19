; Collision between 2 basic structures
;    struct BASIC_OBJECT_STRUCT {
;         int8_t X;
;         int8_t Xsize;
;         int8_t Y;
;         int8_t Ysize;
;    };
; Params:
;    de -> The address of the first basic struct to check
;    hl -> The address of the second basic struct to check
; Return:
;    c  -> Set if not colliding
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
checkCollisions::
	; Load struct 1 X pos
	ld a, [de]
	ld b, a

	; Add struct  1X size
	inc de
	ld a, [de]
	add a, b

	; Compare to struct 2 X
	cp [hl]
	ld a, 0
	ret c

	inc de
	inc hl
	inc hl

	; Load struct 1 Y pos
	ld a, [de]
	ld c, a

	; Add struct 1 Y size
	inc de
	ld a, [de]
	add a, c

	; Compare to struct 2 Y
	cp [hl]
	ld a, 0
	ret c

	dec hl
	dec hl

	; Load struct 2 X pos
	ld a, [hli]

	; Add struct 2 X size
	add a, [hl]

	; Compare to struct 1 X pos
	cp b
	ret c

	inc hl

	; Load struct 2 Y pos
	ld a, [hli]

	; Add struct 2 Y size
	add a, [hl]

	; Compare to struct 1 Y pos
	cp c
	ret