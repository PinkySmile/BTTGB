NAME = btt

ASM = rgbasm

LD = rgblink

FIX = rgbfix

FIXFLAGS = -cjsv -k 01 -l 0x33 -m 0x01 -p 0 -r 00 -t "`echo "$(NAME)" | tr a-z A-Z | tr "_" " "`"

ASMFLAGS =

LDFLAGS = -n $(NAME).sym -l $(NAME).link

FXFLAGS =

FX = rgbgfx

SRCS = \
	src/main.asm \
	src/mem_layout.asm \
	src/assets.asm

OBJS = $(SRCS:%.asm=%.o)


IMGS =

IMGS_FX = $(IMGS:%.png=%.fx)


COMPRESSED_IMGS = \
	assets/font.png \
	assets/bigj.png \
	assets/biga.png \
	assets/bigm.png \

COMPRESSED_IMGS_FX = $(COMPRESSED_IMGS:%.png=%.zfx)


COLORED_IMGS =

COLORED_IMGS_FX = $(COLORED_IMGS:%.png=%.cfx)


COMPRESSED_COLORED_IMGS = \
	assets/epitech.png \

COMPRESSED_COLORED_IMGS_FX = $(COMPRESSED_COLORED_IMGS:%.png=%.zcfx)

all:	tools/compressor $(NAME).gbc

tools/compressor:
	$(MAKE) -C tools compressor

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
	$(MAKE) -C tools fclean
	$(RM) $(NAME).gbc

re:	fclean all
