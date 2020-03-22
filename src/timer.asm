updateTimer::
; increment the timer
	ld hl, TIMER_REGISTER
	ld a, e
	add a, [hl]
	daa
	ld [hli], a
	ld a, d
	adc a, [hl]
	daa
	ldi [hl], a
	xor a
	adc a, [hl]
	daa
	ld [hl], a
	ret
displayTimer::
	ld hl, TIMER_REGISTER + 2
	ld a, [hld]
	ld de, $9C00
	call writeNumber
	ld a, [hld]
	call writeNumber
	ld a, [hl]
	call writeNumber
	ret