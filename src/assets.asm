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
	incbin "assets/tiles/n0default.fx"
	incbin "assets/tiles/n1reaped_poster.fx"
	incbin "assets/tiles/n2long.fx"
	incbin "assets/tiles/n3loul.fx"
	incbin "assets/tiles/n4brick.fx"
	incbin "assets/tiles/n5vBrick.fx"
	incbin "assets/tiles/s0ground.fx"
	incbin "assets/tiles/s1one_way.fx"
	incbin "assets/tiles/s2wall.fx"
GameSpritesEnd::

PlayerSprites::
	incbin "assets/player/player_idle/player_idle1.cfx"
PlayerSpritesEnd::

include "src/palettes.asm"