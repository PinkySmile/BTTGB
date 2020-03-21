;channel 2
bttIntro::
	db $80, $00, $42, $86, $07 ; NO SOUND
	db $80, $87, $42, $86, INTROLN ; RE1
	db $80, $87, $5C, $86, INTROLN ; RE#1
	db $80, $87, $8A, $86, INTROLN ; FA1
	db $80, $00, $8A, $86, $FF ; FA1

;bttChannelTwo::
;mesure 1