NAME = btt

ASM = rgbasm

LD = rgblink

FIX = rgbfix

FIXFLAGS = -Cjsv -k 01 -l 0x33 -m 0x01 -p 0 -r 00 -t "`echo "$(NAME)" | tr a-z A-Z | tr "_" " "`"

ASMFLAGS =

LDFLAGS = -n $(NAME).sym -l $(NAME).link

FXFLAGS =

FX = rgbgfx

SRCS = \
	src/main.asm \
	src/mem_layout.asm \
	src/assets.asm \
	src/maps.asm

OBJS = $(SRCS:%.asm=%.o)


IMGS = \
	assets/tiles/n0target.png \
	assets/tiles/n1reaped_poster.png \
	assets/tiles/n2long.png \
	assets/tiles/n3loul.png \
	assets/tiles/n4brick.png \
	assets/tiles/n5vBrick.png \
	assets/tiles/n6default.png \
	assets/tiles/n9wah.png \
	assets/tiles/n10corona.png \
	assets/tiles/n11bitTrip.png \
	assets/tiles/n12poke.png \
	assets/tiles/s0one_way.png \
	assets/tiles/s1ground.png \
	assets/tiles/s2wall.png

IMGS_FX = $(IMGS:%.png=%.fx)


COMPRESSED_IMGS = \
	assets/font.png \
	assets/bigj.png \
	assets/biga.png \
	assets/bigm.png \

COMPRESSED_IMGS_FX = $(COMPRESSED_IMGS:%.png=%.zfx)


COLORED_IMGS = \
	assets/menu/logo.png \
	assets/menu/logo1.png \
	assets/player/player_idle/player_idle1.png \
	assets/player/player_idle/player_idle2.png \
	assets/player/player_idle/player_idle3.png \
	assets/player/player_idle/player_idle4.png \
	assets/player/player_walk/player_walk1.png \
	assets/player/player_walk/player_walk2.png \
	assets/player/player_walk/player_walk3.png \
	assets/player/player_walk/player_walk4.png \
	assets/player/player_jump/player_jump.png \

COLORED_IMGS_FX = $(COLORED_IMGS:%.png=%.cfx)


COMPRESSED_COLORED_IMGS = \
	assets/epitech.png \

COMPRESSED_COLORED_IMGS_FX = $(COMPRESSED_COLORED_IMGS:%.png=%.zcfx)

all:	tools/compressor tools/palette_fixer $(NAME).gbc

tools/compressor:
	$(MAKE) -C tools compressor

tools/palette_fixer:
	$(MAKE) -C tools palette_fixer

run:	re
	wine "$(BGB_PATH)" ./$(NAME).gbc

runw:	re
	"$(BGB_PATH)" ./$(NAME).gbc

%.fx : %.png
	$(FX) $(FXFLAGS) -o $@ $<

%.cfx : %.png
	$(FX) $(FXFLAGS) -P -o $@ $<

%.zfx : %.png
	$(FX) $(FXFLAGS) -o $@ $<
	tools/compressor $@

%.zcfx : %.png
	$(FX) $(FXFLAGS) -P -o $@ $<
	tools/palette_fixer $(@:%.zcfx=%.pal)
	tools/compressor $@

%.o : %.asm
	$(ASM) -o $@ $(ASMFLAGS) $<

$(NAME).gbc:	$(COMPRESSED_COLORED_IMGS_FX) $(COLORED_IMGS_FX) $(COMPRESSED_IMGS_FX) $(IMGS_FX) $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)
	$(FIX) $(FIXFLAGS) $@

clean:
	$(MAKE) -C tools clean
	$(RM) $(OBJS) $(IMGS_FX) $(COMPRESSED_IMGS_FX) $(COMPRESSED_COLORED_IMGS_FX) $(COLORED_IMGS_FX)

fclean:	clean
	$(RM) $(NAME).gbc

ffclean: fclean
	$(MAKE) -C tools fclean

re:	fclean all
