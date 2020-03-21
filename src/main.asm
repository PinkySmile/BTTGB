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
	jp intro

mainMenu::
	ld de, OAM_SRC_START
	ld bc, $A0
	xor a
	call fillMemory

.lateInit:
	xor a
	push af
.loop:
	call random
	reset INTERRUPT_REQUEST
	halt
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

	ei
	reg INTERRUPT_ENABLED, VBLANK_INTERRUPT
	call waitVBLANK
	reset LCD_CONTROL

	ld [WX], a
	reg WY, $90

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
.gameLoop:
	reset INTERRUPT_REQUEST
	halt

	;call updateGravity
	call updatePlayer
	call updateMusics
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