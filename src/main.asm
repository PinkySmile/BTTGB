include "src/constants.asm"
include "src/macro.asm"

SECTION "Main", ROM0


; Locks the CPU
; Params:
;    None
; Return:
;    None
; Registers:
;    N/A
lockup::
	reset INTERRUPT_ENABLED
	halt

; Main function
main::
	call init               ; Init
	ld sp, $E000            ; Init stack
	call intro

mainMenu::
	call waitVBLANK
	reset LCD_CONTROL
	ld [WX], a

	reg WY, $90

	ld de, menuChannelOne
	ld hl, MUSIC_CHANNEL_1
	call playMusic
	ld de, menuChannelTwo
	ld hl, MUSIC_CHANNEL_2
	call playMusic
	ld de, menuChannelThree
	ld hl, MUSIC_CHANNEL_WAVE
	call playMusic

	ld hl, LogoPal
	ld a, $8
	ld bc, $10
	ld e, BGPI & $FF
	call setGBCPalette

	ld hl, MenuLogo
	ld bc, MenuLogoEnd - MenuLogo
	ld de, $8600
	call copyMemory

.lateInit:
	call waitVBLANK
	reset LCD_CONTROL

	ld de, VRAM_BG_START
	ld bc, $400
	xor a
	call fillMemory

	reg VRAM_BANK_SELECT, 1
	ld de, VRAM_BG_START
	ld bc, $400
	xor a
	call fillMemory

	ld a, 2
	ld de, $9984
	ld bc, pressStartEnd - pressStart
	call fillMemory
	reset VRAM_BANK_SELECT

	ld de, OAM_SRC_START
	ld bc, $A0
	xor a
	call fillMemory

	ld hl, pressStart
	ld bc, pressStartEnd - pressStart
	ld de, $9984
	call copyMemory

	ld hl, VRAM_BG_START + $20 + 6
	ld b, 8
	ld a, $60
.copyLogo:
	ld c, 8
.copyLogoLine::
	push af
	ld [hl], a
	reg VRAM_BANK_SELECT, 1
	ld [hli], a
	reset VRAM_BANK_SELECT
	pop af
	inc a
	dec c
	jr nz, .copyLogoLine

	push af
	ld a, l
	add $20 - 8
	ld l, a
	ld a, h
	adc $0
	ld h, a
	pop af

	dec b
	jr nz, .copyLogo

	reg LCD_CONTROL, LCD_BASE_CONTROL

	xor a
	push af
.loop:
	call random
	reset INTERRUPT_REQUEST
	halt
	call updateMusics
	jr nz, .skip
.skip:
	pop af
	dec a
	push af
	jr z, .credits
	call getKeys
	bit 7, a
	jr nz, .loop
	jr run
.credits:
	jp credits

; Runs the main program
run::
	ld bc, bttChannelOne
	ld de, bttIntroOne
	ld hl, MUSIC_CHANNEL_1
	call playMusicIntro
	ld bc, bttChannelTwo
	ld de, bttIntroTwo
	ld hl, MUSIC_CHANNEL_2
	call playMusicIntro
	ld bc, bttChannelThree
	ld de, bttIntroThree
	ld hl, MUSIC_CHANNEL_WAVE
	call playMusicIntro
	ld bc, bttChannelFour
	ld de, bttIntroFour
	ld hl, MUSIC_CHANNEL_NOISE
	call playMusicIntro

	ei
	reg INTERRUPT_ENABLED, VBLANK_INTERRUPT
	call waitVBLANK
	reset LCD_CONTROL

	reg WY, $88
	reg WX, $68
	ld hl, $9C02
	ld a, ":"
	ld [hli], a
	inc hl
	inc hl
	ld [hl], a

	ld de, VRAM_START
	ld hl, GameSprites
	ld bc, GameSpritesEnd - GameSprites
	call copyMemory

	ld de, VRAM_START + PLAYER_SPRITE_NBR * $10
	ld hl, PlayerSprites
	ld bc, PlayerSpritesEnd - PlayerSprites
	call copyMemory

	ld hl, TestMap
	ld a, BANK(TestMap)
	call loadMap

	ld a, 0
	ld hl, playerPal
	ld e, OBPI & $FF
	ld bc, 8
	call setGBCPalette

	reg LCD_CONTROL, LCD_BASE_CONTROL

	call initGravity
	call initPlayers
	call initAnimation
.gameLoop:
	reset INTERRUPT_REQUEST
	halt
	call displayTimer
	call updateCameras
	call updateGravity
	call updatePlayer
	call updateAnimation
	call updateMusics
	call updateTimer
	jr .gameLoop

include "src/init.asm"
include "src/fatal_error.asm"
include "src/utils.asm"
include "src/strutils.asm"
include "src/interrupts.asm"
include "src/rendering.asm"
include "src/player.asm"
include "src/play_sound.asm"
include "src/intro.asm"
include "src/basic_object.asm"
include "src/text.asm"
include "src/credits.asm"
include "src/map.asm"
include "src/camera.asm"
include "src/displayable_object.asm"
include "src/gravity.asm"
include "src/btt_channel_one.asm"
include "src/btt_channel_two.asm"
include "src/btt_channel_three.asm"
include "src/btt_channel_four.asm"
include "src/player_animation.asm"
include "src/menu_channel_one.asm"
include "src/menu_channel_two.asm"
include "src/menu_channel_three.asm"
include "src/timer.asm"
