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

include "src/palettes.asm"