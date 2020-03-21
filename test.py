with open("assets/test_map.map", "wb") as fd:
	# Map of 50x50
	sizeX = 50
	sizeY = 50
	size = sizeX * sizeY
	fd.write(bytes([size >> 8, size & 0xFF]))
	fd.write(bytes([sizeX, sizeY]))

	# All default palettes ($7FFF, $5294, $294A, $0000)
	fd.write(bytes([0xFF, 0x7F, 0x94, 0x52, 0x4A, 0x29, 0, 0] * 8))

	# Generate garbage map
	fd.write(bytes([i % sizeX for i in range(size)]))