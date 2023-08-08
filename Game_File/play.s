	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"play.c"
	.text
	.align	2
	.global	playSong
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L4
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #2
	push	{r4, lr}
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #8]
	ldr	r3, .L4+4
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #49152
	mvn	ip, #59
	mov	r0, #195
	mov	r1, #196
	ldr	r3, .L4+8
	strh	r2, [r3, #10]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	pop	{r4, lr}
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	songs
	.word	playSoundA
	.word	67109120
	.size	playSong, .-playSong
	.align	2
	.global	startGameSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	startGameSong, %function
startGameSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L8
	push	{r4, r5, lr}
	ldr	r2, [r3]
	ldr	lr, .L8+4
	ldr	r3, .L8+8
	ldr	ip, .L8+12
	ldr	lr, [lr]
	ldr	ip, [ip]
	str	r2, [r3, #4]
	ldr	r4, .L8+16
	ldr	r2, .L8+20
	ldr	r4, [r4]
	ldr	r2, [r2]
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	ldr	lr, .L8+24
	ldr	ip, .L8+28
	ldr	lr, [lr]
	str	r4, [r3, #8]
	str	ip, [r3, #32]
	ldr	r4, .L8+32
	str	r2, [r3, #48]
	ldr	r5, .L8+36
	ldr	r2, .L8+40
	ldr	ip, .L8+44
	ldr	r5, [r5]
	ldr	ip, [ip]
	str	r4, [r3, #12]
	str	lr, [r3, #64]
	str	r2, [r3, #52]
	ldr	r4, .L8+48
	ldr	lr, .L8+52
	ldr	r2, .L8+56
	ldr	r4, [r4]
	ldr	lr, [lr]
	ldr	r2, [r2]
	str	r5, [r3, #44]
	str	ip, [r3, #88]
	ldr	r5, .L8+60
	ldr	ip, .L8+64
	ldr	r5, [r5]
	str	r4, [r3, #68]
	str	lr, [r3, #104]
	ldr	r4, .L8+68
	ldr	lr, .L8+72
	str	ip, [r3, #92]
	str	r2, [r3, #108]
	ldr	ip, .L8+76
	ldr	r2, .L8+80
	str	r5, [r3, #84]
	str	r4, [r3, #72]
	str	lr, [r3, #112]
	str	r0, [ip]
	str	r1, [r2]
	pop	{r4, r5, lr}
	b	playSong
.L9:
	.align	2
.L8:
	.word	WelcomeMusic_sampleRate
	.word	GameplayMusic_sampleRate
	.word	songs
	.word	GameplayMusic_length
	.word	WelcomeMusic_length
	.word	pausemusic_length
	.word	WinMusic_sampleRate
	.word	GameplayMusic_data
	.word	WelcomeMusic_data
	.word	pausemusic_sampleRate
	.word	pausemusic_data
	.word	plantSound_length
	.word	WinMusic_length
	.word	loseSound_sampleRate
	.word	loseSound_length
	.word	plantSound_sampleRate
	.word	plantSound_data
	.word	WinMusic_data
	.word	loseSound_data
	.word	currentSong
	.word	paused
	.size	startGameSong, .-startGameSong
	.align	2
	.global	playSong2
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong2, %function
playSong2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L12
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #2
	push	{r4, lr}
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #8]
	ldr	r3, .L12+4
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #49152
	mvn	ip, #59
	mov	r0, #195
	mov	r1, #196
	ldr	r3, .L12+8
	strh	r2, [r3, #10]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	pop	{r4, lr}
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
	.word	songs
	.word	playSoundB
	.word	67109120
	.size	playSong2, .-playSong2
	.align	2
	.global	playIntroSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playIntroSong, %function
playIntroSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	b	playSong
	.size	playIntroSong, .-playIntroSong
	.align	2
	.global	loopIntroSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	loopIntroSong, %function
loopIntroSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r0, [r3, #8]
	cmp	r0, #0
	bxne	lr
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bxle	lr
	b	playSong
.L18:
	.align	2
.L17:
	.word	soundA
	.size	loopIntroSong, .-loopIntroSong
	.align	2
	.global	playGameSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playGameSong, %function
playGameSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	b	playSong
	.size	playGameSong, .-playGameSong
	.align	2
	.global	loopGameSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	loopGameSong, %function
loopGameSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	ldr	r2, [r3, #8]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bxle	lr
	mov	r0, #1
	b	playSong
.L23:
	.align	2
.L22:
	.word	soundA
	.size	loopGameSong, .-loopGameSong
	.align	2
	.global	playPauseSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playPauseSong, %function
playPauseSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #2
	b	playSong
	.size	playPauseSong, .-playPauseSong
	.align	2
	.global	loopPauseSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	loopPauseSong, %function
loopPauseSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldr	r2, [r3, #8]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bxle	lr
	mov	r0, #2
	b	playSong
.L28:
	.align	2
.L27:
	.word	soundA
	.size	loopPauseSong, .-loopPauseSong
	.align	2
	.global	playWinSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playWinSound, %function
playWinSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #3
	b	playSong
	.size	playWinSound, .-playWinSound
	.align	2
	.global	playPlantSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playPlantSound, %function
playPlantSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #4
	b	playSong2
	.size	playPlantSound, .-playPlantSound
	.align	2
	.global	playLoseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playLoseSound, %function
playLoseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #5
	b	playSong
	.size	playLoseSound, .-playLoseSound
	.comm	paused,4,4
	.comm	currentSong,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,120,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
