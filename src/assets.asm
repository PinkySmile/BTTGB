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
	incbin "assets/tiles/n0target.fx"
	incbin "assets/tiles/n1reaped_poster.fx"
	incbin "assets/tiles/n2long.fx"
	incbin "assets/tiles/n3loul.fx"
	incbin "assets/tiles/n4brick.fx"
	incbin "assets/tiles/n5vBrick.fx"
	incbin "assets/tiles/n6default.fx"
	incbin "assets/tiles/n5vBrick.fx" ; 7
	incbin "assets/tiles/n5vBrick.fx" ; 8
	incbin "assets/tiles/n9wah.fx"
	incbin "assets/tiles/n10corona.fx"
	incbin "assets/tiles/n11bitTrip.fx"
	incbin "assets/tiles/n12poke.fx"
	incbin "assets/tiles/n5vBrick.fx" ; 13
	incbin "assets/tiles/n5vBrick.fx" ; 14
	incbin "assets/tiles/n5vBrick.fx" ; 15
	incbin "assets/tiles/s0one_way.fx"
	incbin "assets/tiles/s1ground.fx"
	incbin "assets/tiles/s2wall.fx"
	incbin "assets/tiles/s2wall.fx" ; 3
	incbin "assets/tiles/s2wall.fx" ; 4
	incbin "assets/tiles/s2wall.fx" ; 5
	incbin "assets/tiles/s2wall.fx" ; 6
	incbin "assets/tiles/s2wall.fx" ; 7
	incbin "assets/tiles/s2wall.fx" ; 8
	incbin "assets/tiles/s2wall.fx" ; 9
	incbin "assets/tiles/s2wall.fx" ; 10
	incbin "assets/tiles/s2wall.fx" ; 11
	incbin "assets/tiles/s2wall.fx" ; 12
	incbin "assets/tiles/s2wall.fx" ; 13
	incbin "assets/tiles/s2wall.fx" ; 14
	incbin "assets/tiles/s2wall.fx" ; 15
GameSpritesEnd::

PlayerSprites::
	incbin "assets/player/player_idle/player_idle1.cfx"
	incbin "assets/player/player_idle/player_idle2.cfx"
	incbin "assets/player/player_idle/player_idle3.cfx"
	incbin "assets/player/player_idle/player_idle4.cfx"

	incbin "assets/player/player_walk/player_walk1.cfx"
	incbin "assets/player/player_walk/player_walk2.cfx"
	incbin "assets/player/player_walk/player_walk3.cfx"
	incbin "assets/player/player_walk/player_walk4.cfx"

	incbin "assets/player/player_jump/player_jump.cfx"
PlayerSpritesEnd::

MenuLogo::
	incbin "assets/menu/logo.cfx"
MenuLogoEnd::

MenuLogoNoText::
	incbin "assets/menu/logo1.cfx"
MenuLogoEndText::

include "src/palettes.asm"