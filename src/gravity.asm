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
    xor a
    ld hl, GRAVITY_TIMER
    cp [hl], a
    jr nz, .isFalling
    ld [hl], GRAVITY_CONSTANT
    ld hl, PLAYER_STRUCT
    add hl, 6
    dec [hl]
    cp [hl], -7
    jr nc, .cap
    ret

    .isFalling:
        dec [hl]
    ret

    .cap:
        ld [hl], -7
    ret






