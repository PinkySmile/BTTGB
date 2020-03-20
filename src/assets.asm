SECTION "Assets", ROMX[$6800], BANK[1]

; The fonts used.
textAssets::
 	incbin "assets/font.zfx"
textAssetsEnd::

; The background asset used.
EpitechLogo::
 	incbin "assets/epitech.zcfx"
EpitechLogoEnd::

; The jam lettres
JAMLetters::
 	incbin "assets/bigj.zfx"
 	incbin "assets/biga.zfx"
 	incbin "assets/bigm.zfx"
JAMLettersEnd::

; All the sprites needed by the game
GameSprites::
	incbin "assets/player/player_idle/player_idle1.cfx"
GameSpritesEnd::

include "src/palettes.asm"