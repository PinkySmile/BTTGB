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

