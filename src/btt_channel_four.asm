;channel 4
bttIntroFour::
    db $00, $00, $00, $C0, QUAVER * 2 ; NO SOUND
    db $00, $00, $00, $C0, $FF ; NO SOUND

bttChannelFour::
;mesure 1
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 2
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 3
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 4
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare

    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare

    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare

    db $00, $67, $07, $C0, QUAVER * 2 ; Tsssssss
;mesure 5
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 6
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 7
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 8
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 9
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 10
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 11
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 12
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 13
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $00, $84, $7F, $C0, QUAVER / 2 ; KICK
    db $00, $84, $7F, $C0, QUAVER / 2 ; KICK
    db $00, $00, $00, $C0, QUAVER / 2 ; NO SOUND
    db $00, $84, $7F, $C0, QUAVER / 2 ; KICK
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $00, $00, $00, $C0, QUAVER / 2 ; NO SOUND
    db $3C, $82, $60, $C0, QUAVER / 2 ; Snare
    db $00, $00, $00, $C0, QUAVER / 2 ; NO SOUND
;mesure 14
    db $00, $67, $07, $C0, QUAVER ; Tsssssss
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 15
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 16
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 17
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $3C, $82, $60, $C0, QUAVER ; Snare
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 18
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 19
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 20
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
;mesure 21
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $84, $7F, $C0, QUAVER ; KICK
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, QUAVER ; NO SOUND
    db $00, $64, $02, $C0, QUAVER ; HiHat
    db $00, $00, $00, $C0, $FF ; NO SOUND
