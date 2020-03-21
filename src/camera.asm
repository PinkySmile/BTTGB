updateCameraH::
	ld hl, VRAM_BG_START

	bit 7, d
	jr nz, .left

.right:
	ret

.left:
	ret

updateCameraV::
	ld hl, VRAM_BG_START

	bit 7, d
	jr nz, .down

.up:
	ret

.down:
	ret