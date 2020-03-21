waveBTT::
    db $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F

bttIntroThree::
    db $80, $00, $00, $F7, $86, QUAVER * 2 ; NO SOUND
    db $80, $00, $00, $F7, $86, $FF ; NO SOUND

bttChannelThree::
;mesure 1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER * 2 ;FA#1
;mesure 2
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $14, $87, QUAVER ;DO#2
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 3
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER + QUAVER / 2 ;FA#1
    db $80, $00, $40, $9E, $86, QUAVER ;FA#1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
;mesure 4
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 5
    db $80, $00, $00, $F7, $86, QUAVER ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
;mesure 6
    db $80, $00, $00, $F7, $86, QUAVER ; NO SOUND
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 7
    db $80, $00, $00, $F7, $86, QUAVER ; NO SOUND
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER + QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 8
    db $80, $00, $00, $F7, $86, QUAVER ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $14, $87, QUAVER + QUAVER / 2 ;DO#2
    db $80, $00, $40, $14, $87, QUAVER + QUAVER / 2 ;DO#2
    db $80, $00, $40, $14, $87, QUAVER ;DO#2
;mesure 9
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 10
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $2E, $87, QUAVER ;RE#2
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 11
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $C4, $86, QUAVER + QUAVER / 2 ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER + QUAVER / 2 ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER + QUAVER / 2 ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER ;SOL#1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 12
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $8A, $86, QUAVER ;FA1
    db $80, $00, $40, $C4, $86, QUAVER ;SOL#1
;mesure 13
    db $80, $00, $40, $4F, $86, QUAVER / 2 ;FA#1
    db $80, $00, $40, $C4, $86, QUAVER / 2 ;SOL#1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
    db $80, $00, $40, $14, $87, QUAVER ;DO#2
    db $80, $00, $40, $39, $87, QUAVER * 3 + QUAVER / 2 ;MI#2
    db $80, $00, $00, $F7, $86, QUAVER ; NO SOUND
;mesure 14
    db $80, $00, $40, $D6, $86, QUAVER * 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
;mesure 15
    db $80, $00, $40, $2E, $87, QUAVER * 2 ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER / 2 ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER / 2 ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER / 2 ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER / 2 ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER / 2 ;RE#2
    db $80, $00, $40, $2E, $87, QUAVER / 2 ;RE#2
;mesure 16
    db $80, $00, $40, $F7, $86, QUAVER * 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
    db $80, $00, $40, $F7, $86, QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
    db $80, $00, $40, $F7, $86, QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
    db $80, $00, $40, $F7, $86, QUAVER / 2 ;SI1
    db $80, $00, $40, $F7, $86, QUAVER / 2 ;SI1
;mesure 17
    db $80, $00, $40, $D6, $86, QUAVER * 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER / 2 ;LA1
;mesure 18
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 19
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $2E, $87, QUAVER ;RE#2
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 20
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $C4, $86, QUAVER + QUAVER / 2 ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER + QUAVER / 2 ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER + QUAVER / 2 ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER ;SOL#1
    db $80, $00, $40, $C4, $86, QUAVER ;SOL#1
    db $80, $00, $40, $F7, $86, QUAVER ;SI1
;mesure 21
    db $80, $00, $00, $F7, $86, QUAVER / 2 ; NO SOUND
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER + QUAVER / 2 ;LA1
    db $80, $00, $40, $D6, $86, QUAVER ;LA1
    db $80, $00, $40, $8A, $86, QUAVER ;FA1
    db $80, $00, $40, $C4, $86, QUAVER ;SOL#1
    db $80, $00, $00, $C4, $86, $FF ;SOL#1
