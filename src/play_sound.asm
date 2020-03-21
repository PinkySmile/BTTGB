wpRamWave::
    db $FF, $88, $00, $88, $FF, $88, $00, $88, $FF, $88, $00, $88, $FF, $88, $00, $88


initWPRAM::
    ld hl, wpRamWave
    ld de, WPRAM
    ld bc, 16
    call copyMemory

playChannel1Sound::
	ld de, CHANNEL1_SWEEP
	ld c, 5
.loop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

playChannel2Sound::
	ld de, CHANNEL2_LENGTH
	ld c, 4
.loop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

playChannelWave::
	ld de, CHANNEL3_ON_OFF
	ld c, 5
.loop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

playNoiseSound::
	ld de, CHANNEL4_LENGTH
	ld c, 4
.loop:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

; Updates the sound structure.
; Params:
;    hl -> Pointer to the music structure
;    de -> The Sound register to write to
;    a  -> The size to write to the register
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
updateMusic::
	ld b, a
	xor a
	or [hl]
	ret z

	dec [hl]
	ret nz

	ld a, b
	push hl
	push af
	push de

	; de = hl
	ld d, h
	ld e, l

	; hl = *de
	inc de
	ld a, [de]
	ld h, a
	inc de
	ld a, [de]
	ld l, a

	pop de
	pop af
	ld b, 0
	ld c, a
	call copyMemory

	ld a, [hl]
	cp a, $FF
	jr z, .reset

	; de = hl
	ld d, h
	ld e, l

	inc de
	pop hl
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ret

.reset:
	pop hl

	; de = hl
	ld d, h
	ld e, l
	inc de

	ld a, QUAVER
	ld [hli], a

	inc hl
	inc hl
	ld bc, 2
	jp copyMemory

; Starts a new music.
; Params:
;    de -> The sound to play
;    hl -> The music structure to play from
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
playMusic::
	ld a, 1
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a

	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ret

playMusicIntro::
	ld a, 1
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a

	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

; Updates all music structs
updateMusics::
	ld a, 5
	ld hl, MUSIC_CHANNEL_1
	ld de, CHANNEL1_SWEEP
	call updateMusic

	ld a, 4
	ld hl, MUSIC_CHANNEL_2
	ld de, CHANNEL2_LENGTH
	call updateMusic

	ld a, 5
	ld hl, MUSIC_CHANNEL_WAVE
	ld de, CHANNEL3_ON_OFF
	call updateMusic

	ld a, 4
	ld hl, MUSIC_CHANNEL_NOISE
	ld de, CHANNEL4_LENGTH
	jp updateMusic