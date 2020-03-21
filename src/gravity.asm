; Initialize the gravity timer.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
initGravity::
    ld hl, GRAVITY_TIMER
    ld [hl], GRAVITY_CONSTANT
    ret

; Update the gravity.
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
updateGravity::
    ld a, 0
    ld hl, GRAVITY_TIMER
    cp a, [hl]
    jr nz, .isFalling

    ld [hl], GRAVITY_CONSTANT
    ld a, [hl]
    ld hl, GRAVITY_LIMITER
    sub [hl]
    ld [hl], a


    ld hl, PLAYER_STRUCT
    ld b, 0
    ld c, 5 ; BASIC_OBJECT_STRUCT_Y_SPEED_OFF
    add hl, bc
    inc [hl]
    ld a, 7 ; Max speed
    cp [hl]
    jp c, .overflow
    ld hl, GRAVITY_LIMITER
    inc [hl]

.isFalling:
    dec [hl]
    ret

.capGravity:
    ld [hl], 1
    ret

.overflow:
    ld [hl], 7
    ret






