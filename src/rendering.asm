; Load all sprites and put thems inside the VRam
; Params:
;    None
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
loadSprites::
	ld de, VRAM_START + $10
	ld bc, $10
	ld a, $FF
	call fillMemory

	; Load font into VRAM
	ld a, 1
	ld hl, textAssets + $20 * $08
	ld bc, textAssetsEnd - (textAssets + $20 * $08)
	ld de, VRAM_START + $20 * $10
	call uncompress

	ld bc, $20
	xor a
	call fillMemory

	xor a
	ld de, $8800
	ld hl, EpitechLogo
	ld bc, EpitechLogoEnd - EpitechLogo
	call uncompress

	; Load JAM letters into VRAM
	xor a
	ld hl, JAMLetters
	ld bc, JAMLettersEnd - JAMLetters
	jp uncompress

; Change the GBC palette
; Params:
;    a  -> The index of the palette
;    hl -> New palette to load
;    e  -> The lowest byte of the address to stream palette index
;    bc -> The size of the palette
; Return:
;    None
; Registers:
;    af -> Not preserved
;    bc -> Not preserved
;    de -> Not preserved
;    hl -> Not preserved
setGBCPalette::
	; Check if on Gameboy or Gameboy Color
	ld d, a
	ld a, [HARDWARE_TYPE]
	or a

.noCheck:
	; If we are on Gameboy, no need to change palette
	ret z

	ld a, d

	; Enable auto increment
	set 7, a

	; Load index to palette index
	ld d, $FF
	ld [de], a

	; Stream data to the palette data
	inc de
	jp copyMemorySingleAddr