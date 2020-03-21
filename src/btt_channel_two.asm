;channel 2
bttIntroTwo::
	db $80, $00, $42, $86, $D ; NO SOUND
	db $80, $87, $42, $86, INTROLN ; RE1
	db $80, $87, $5C, $86, INTROLN ; RE#1
	db $80, $87, $8A, $86, INTROLN ; FA1
	db $80, $00, $8A, $86, $FF ; FA1

bttChannelTwo::
;mesure 1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $00, $D6, $86, QUAVER ; NO SOUND
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2 ; SI1
;mesure 2
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER ; LA1
    db $80, $00, $14, $87, QUAVER ; DO#2
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2 ; SI1
;mesure 3
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2 ; LA1
;mesure 4
    db $80, $00, $14, $87, QUAVER / 2 ; NO SOUND
    db $80, $87, $5C, $87, QUAVER + QUAVER / 2 ; RE#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $5C, $87, QUAVER ; RE#2
;mesure 5
    db $80, $00, $D6, $86, QUAVER ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
;mesure 6
    db $80, $00, $D6, $86, QUAVER ; NO SOUND
    db $80, $87, $5C, $87, QUAVER + QUAVER / 2 ; RE#2
    db $80, $87, $5C, $87, QUAVER + QUAVER / 2 ; RE#2
    db $80, $87, $5C, $87, QUAVER + QUAVER / 2 ; RE#2
    db $80, $87, $5C, $87, QUAVER + QUAVER / 2 ; RE#2
    db $80, $87, $5C, $87, QUAVER ; RE#2
;mesure 7
    db $80, $00, $D6, $86, QUAVER ; NO SOUND
    db $80, $87, $39, $87, QUAVER + QUAVER / 2 ; MI2
    db $80, $87, $39, $87, QUAVER + QUAVER / 2 ; MI2
    db $80, $87, $39, $87, QUAVER + QUAVER / 2 ; MI2
    db $80, $87, $39, $87, QUAVER + QUAVER / 2 ; MI2
    db $80, $87, $39, $87, QUAVER ; MI2
;mesure 8
    db $80, $00, $D6, $86, QUAVER ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $44, $87, QUAVER + QUAVER / 2 ; FA2
    db $80, $87, $44, $87, QUAVER + QUAVER / 2 ; FA2
    db $80, $87, $44, $87, QUAVER ; FA2
;mesure 9
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $5C, $87, QUAVER ; RE#2
;mesure 10
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER  ; DO#2
    db $80, $87, $4F, $87, QUAVER  ; FA#2
    db $80, $87, $5C, $87, QUAVER ; RE#2
;mesure 11
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2  ; SI1
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2  ; SI1
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2  ; SI1
    db $80, $87, $F7, $86, QUAVER  ; SI1
    db $80, $87, $F7, $86, QUAVER  ; SI1
    db $80, $87, $21, $87, QUAVER  ; RE2
;mesure 12
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER  ; DO#2
    db $80, $87, $C4, $86, QUAVER  ; SOL#1
    db $80, $87, $F7, $86, QUAVER  ; SI1
;mesure 13
    db $80, $00, $D6, $86, QUAVER * 8 ; NO SOUND
;mesure 14
    db $80, $87, $14, $87, QUAVER * 2 ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $14, $87, QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $14, $87, QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $14, $87, QUAVER / 2 ; DO#2
    db $80, $87, $14, $87, QUAVER / 2 ; DO#2
;mesure 15
    db $80, $87, $44, $87, QUAVER / 2 ; FA2
    db $80, $87, $4F, $87, QUAVER  ; FA#2
    db $80, $87, $44, $87, QUAVER / 2 ; FA2
    db $80, $87, $4F, $87, QUAVER  ; FA#2
    db $80, $87, $44, $87, QUAVER / 2 ; FA2
    db $80, $87, $4F, $87, QUAVER  ; FA#2
    db $80, $87, $44, $87, QUAVER / 2 ; FA2
    db $80, $87, $4F, $87, QUAVER  ; FA#2
    db $80, $00, $D6, $86, QUAVER * 2 ; NO SOUND

;mesure 16
    db $80, $87, $21, $87, QUAVER * 2 ; RE2
    db $80, $87, $21, $87, QUAVER ; RE2
    db $80, $87, $21, $87, QUAVER / 2 ; RE2
    db $80, $87, $21, $87, QUAVER / 2 ; RE2
    db $80, $87, $21, $87, QUAVER / 2 ; RE2
    db $80, $87, $21, $87, QUAVER ; RE2
    db $80, $87, $21, $87, QUAVER / 2 ; RE2
    db $80, $87, $21, $87, QUAVER ; RE2
    db $80, $87, $21, $87, QUAVER / 2 ; RE2
    db $80, $87, $21, $87, QUAVER / 2 ; RE2
;mesure 17
    db $80, $87, $D6, $86, QUAVER + QUAVER / 2  ; LA1
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER  ; DO#2
    db $80, $87, $D6, $86, QUAVER  ; LA1
;mesure 18
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $14, $87, QUAVER  ; DO#2
    db $80, $87, $2E, $87, QUAVER  ; RE#2
;mesure 19
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $4F, $87, QUAVER ; FA#2
    db $80, $87, $2E, $87, QUAVER ; RE#2
;mesure 20
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2 ; SI1
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2 ; SI1
    db $80, $87, $F7, $86, QUAVER + QUAVER / 2 ; SI1
    db $80, $87, $F7, $86, QUAVER ; SI1
    db $80, $87, $F7, $86, QUAVER ; SI1
    db $80, $87, $21, $87, QUAVER ; RE2
;mesure 21
    db $80, $00, $D6, $86, QUAVER / 2 ; NO SOUND
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER + QUAVER / 2  ; DO#2
    db $80, $87, $14, $87, QUAVER ; DO#2
    db $80, $87, $C4, $86, QUAVER ; SOL#1
    db $80, $87, $F7, $86, QUAVER ; SI1
    db $80, $00, $F7, $86, $FF ; SI1
