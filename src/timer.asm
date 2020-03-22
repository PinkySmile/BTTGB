updateTimer:: ; increment the timer
	ld a, 1
	ld hl, TIMER_FRAME_COUNTER_REGISTER
	dec [hl]
	jr nz, .noInc ; 1 of 3 frames
	ld a, 2
	ld [hl], a
.noInc:
	ld hl, TIMER_REGISTER
	add [hl]
	daa
	ld [hli], a
	ld a, 0
	adc [hl]
	daa
	cp $60
	scf
	ccf
	jr nz, .displaySecs
	xor a
	scf
.displaySecs:
	ld [hli], a
	ld a, 0
	adc [hl]
	daa
	ld [hl], a
	ret

displayTimer::
	ld hl, TIMER_REGISTER + 2
	ld a, [hld]
	ld de, $9C00
	call writeNumber
	inc de
	ld a, [hld]
	call writeNumber
	inc de
	ld a, [hl]
	call writeNumber
	ret