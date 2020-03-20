//
// Created by Gegel85 on 20/03/2020.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool fix_palette_file(char *path)
{
	unsigned short buffer[4];
	FILE *stream = fopen(path, "rb");

	if (!stream)
		return perror(path), false;
	fread(buffer, sizeof(*buffer), sizeof(buffer) / sizeof(*buffer), stream);
	fclose(stream);

	stream = fopen(path, "wb");
	if (!stream)
		return perror(path), false;
	fwrite(buffer, sizeof(*buffer), 1, stream);
	fwrite(&buffer[2], sizeof(*buffer), 2, stream);
	fwrite(&buffer[1], sizeof(*buffer), 1, stream);
	fclose(stream);
	return true;
}

int main(int argc, char **argv)
{
	for (int i = 1; i < argc; i++)
		if (!fix_palette_file(argv[i]))
			return EXIT_FAILURE;
	return EXIT_SUCCESS;
}