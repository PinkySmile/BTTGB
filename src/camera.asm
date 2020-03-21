updateCameraH::
	bit 7, d
	ret

updateCameraV::
	bit 7, d
	jr z, .up

.up:

.down:
	ret