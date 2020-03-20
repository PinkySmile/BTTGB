INC =

LDFLAGS =

CFLAGS= $(INC)	\
		-W		\
		-Wall	\
		-Wextra	\

CC =	gcc

LIBS =

all:	$(LIBS) $(NAME)

compressor:compressor.o
	$(CC) -o compressor compressor.o $(LDFLAGS)

palette_fixer:palette_fixer.o
	$(CC) -o palette_fixer palette_fixer.o $(LDFLAGS)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) palette_fixer palette_fixer.exe compressor compressor.exe

ffclean:fclean

re:	fclean all

dbg:	CFLAGS += -g -O0
dbg:	ffclean all
