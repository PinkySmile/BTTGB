makeEpitechBackground::
	; Reset VRAM
	ld de, $9800
	xor a
	ld bc, $800
	call fillMemory

	; Copy logo on background
	ld a, $80
	ld e, 4
	ld hl, $9883
.loop:
	ld d, 13
.loop2:
	ld [hli], a
	inc a
	dec d
	jr nz, .loop2
	inc a
	ld bc, $20 - 13
	dec e
	add hl, bc
	jr nz, .loop

	; Copy right bracket on window
	ld hl, $9C00
	ld a, $8D
	ld d, 4
	ld bc, $20
.loop3:
	ld [hl], a
	add a, $E
	add hl, bc
	dec d
	jr nz, .loop3

	ld a, [HARDWARE_TYPE]
	or a
	ret z

	; GBC stuff
	ld d, 8
	ld hl, epitechLogoPal
	ld e, BGPI & $FF
	ld bc, $8
	call setGBCPalette.noCheck

	ld a, 1
	ld [VRAM_BANK_SELECT], a


	; Copy logo color on background
	ld a, %00000001
	ld e, 4
	ld hl, $9883
.loop1:
	ld d, 13
.loop12:
	ld [hli], a
	dec d
	jr nz, .loop12
	ld bc, $20 - 13
	dec e
	add hl, bc
	jr nz, .loop1

	; Copy right bracket color on window
	ld hl, $9C00
	ld d, 4
	ld bc, $20
.loop13:
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop13

	xor a
	ld [VRAM_BANK_SELECT], a
	ret

intro::
	ei
	reg INTRO_COUNTER, $FF
	call makeEpitechBackground
	reg WX, $5C
	reg WY, $20
	reg SCROLL_X, $D5
	reg LCD_CONTROL, LCD_BASE_CONTROL
	ld a, $40
	call waitFrames
	xor a
.start:
	ld hl, WX
	inc [hl]
	ld hl, SCROLL_X
	inc [hl]
	reset INTERRUPT_REQUEST
	halt
	or [hl]
	jr nz, .start

	ld a, $10
	call waitFrames

	ld hl, nantes
	ld bc, nantesEnd - nantes
	ld de, $9907
	call copyMemory

	ld a, $8
	call waitFrames

	reg BGP, DMG_BG_PALETTE & %11001111 | %00100000
	ld a, $4
	call waitFrames
	reg BGP, DMG_BG_PALETTE | %00110000
	ld a, $10
	call waitFrames
	reg BGP, DMG_BG_PALETTE & %11001111 | %00100000
.loop:
	reset INTERRUPT_REQUEST
	ld a, [INTRO_COUNTER]

	push af

	cp $B0
	jr nc, .dec
	xor a
	ld [INTRO_COUNTER], a
	jr .skip
.dec:
	ld hl, INTRO_COUNTER
	dec [hl]
	jr .skip
.skip:
	halt
	pop af
	or a
	jr nz, .loop

	call waitVBLANK
	reset LCD_CONTROL
	call loadSprites
	xor a
	ld hl, textAssets + 32 * 8
	ld bc, textAssetsEnd - (textAssets + 32 * 8)
	ld de, VRAM_START + 32 * 16
	call uncompress
	reg LCD_CONTROL, LCD_BASE_CONTROL
	di
	jp mainMenu
