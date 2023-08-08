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
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L19
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r4, .L19+4
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #20]
	bge	.L17
.L4:
	ldr	r0, .L19+8
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #20]
	blt	.L3
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L18
	ldr	r2, .L19+12
	ldr	r1, .L19+16
	ldr	r2, [r2]
	strh	r3, [r1, #6]	@ movhi
	str	r3, [r0, #8]
	str	r3, [r2, #32]
.L3:
	ldr	r3, .L19
	ldrh	r3, [r3, #2]
	tst	r3, #32
	beq	.L7
	ldr	r0, .L19+20
	ldr	r3, [r0]
	ldr	r1, .L19+24
	add	r3, r3, #1
	smull	r2, r1, r3, r1
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #2
	str	r3, [r0]
.L7:
	ldr	r3, .L19
	ldrh	r3, [r3, #2]
	tst	r3, #64
	beq	.L8
	ldr	r0, .L19+28
	ldr	r2, [r0]
	ldr	r3, .L19+32
	add	r2, r2, #1
	smull	ip, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #2
	str	r3, [r0]
.L8:
	mov	r1, #1
	ldr	r3, .L19
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r2, [r4, #12]
	ldm	r4, {r0, r1}
	ldr	r3, .L19+36
	mov	lr, pc
	bx	r3
	b	.L4
.L18:
	ldr	r2, [r0, #12]
	ldr	r3, .L19+40
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r3
	b	.L3
.L20:
	.align	2
.L19:
	.word	67109376
	.word	soundA
	.word	soundB
	.word	dma
	.word	67109120
	.word	second
	.word	-2004318071
	.word	minute
	.word	1374389535
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	titleScroll
	.syntax unified
	.arm
	.fpu softvfp
	.type	titleScroll, %function
titleScroll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #67108864
	ldr	r1, .L22
	ldr	r3, [r1]
	add	r3, r3, #1
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	str	r3, [r1]
	strh	r2, [r0, #16]	@ movhi
	bx	lr
.L23:
	.align	2
.L22:
	.word	hOff
	.size	titleScroll, .-titleScroll
	.align	2
	.global	scrollSecondBg
	.syntax unified
	.arm
	.fpu softvfp
	.type	scrollSecondBg, %function
scrollSecondBg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #67108864
	ldr	r1, .L25
	ldr	r3, [r1]
	add	r3, r3, #1
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	str	r3, [r1]
	strh	r2, [r0, #24]	@ movhi
	bx	lr
.L26:
	.align	2
.L25:
	.word	h2Off
	.size	scrollSecondBg, .-scrollSecondBg
	.align	2
	.global	resetScroll
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetScroll, %function
resetScroll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L28
	str	r3, [r1]
	strh	r3, [r2, #16]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	hOff
	.size	resetScroll, .-resetScroll
	.align	2
	.global	reset2ndScroll
	.syntax unified
	.arm
	.fpu softvfp
	.type	reset2ndScroll, %function
reset2ndScroll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L31
	str	r3, [r1]
	strh	r3, [r2, #24]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	h2Off
	.size	reset2ndScroll, .-reset2ndScroll
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16
	ldr	r4, .L35
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L35+4
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L35+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L35+12
	ldr	r1, .L35+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L35+20
	ldr	r1, .L35+24
	mov	lr, pc
	bx	r4
	mov	r3, #1616
	mov	r0, #3
	ldr	r2, .L35+28
	ldr	r1, .L35+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L35+36
	ldr	r1, .L35+40
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L35+44
	ldr	r1, .L35+48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L35+52
	ldr	r2, .L35+56
	ldr	r1, .L35+60
	mov	lr, pc
	bx	r4
	ldr	r2, .L35+64
	mov	r0, #3
	ldr	r1, .L35+68
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+76
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L35+80
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	DMANow
	.word	smallBGtilesetPal
	.word	smallBGtilesetTiles
	.word	100726784
	.word	smallbgtilemapMap
	.word	83886112
	.word	welcomeScreenPal+32
	.word	100679680
	.word	welcomeScreenTiles
	.word	100720640
	.word	welcomeScreenMap
	.word	83886208
	.word	CloudOverlayPal+128
	.word	4384
	.word	100696064
	.word	CloudOverlayTiles
	.word	100714496
	.word	CloudOverlayMap
	.word	startGameSong
	.word	waitForVBlank
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose.part.0, %function
lose.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L39
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	ldr	r2, .L39+4
	str	r3, [r2]
	b	goToStart
.L40:
	.align	2
.L39:
	.word	buttons
	.word	modified
	.size	lose.part.0, .-lose.part.0
	.set	win.part.0,lose.part.0
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L43
	mov	lr, pc
	bx	r3
	ldr	r6, .L43+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r6
	mov	r4, #67108864
	mov	r3, #5888
	mov	r5, #0
	ldr	r2, .L43+12
	ldr	r1, .L43+16
	ldr	r0, .L43+20
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #16384
	strh	r1, [r4, #12]	@ movhi
	ldr	r2, .L43+24
	strh	r0, [r4, #10]	@ movhi
	ldr	r1, .L43+28
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r2, .L43+32
	ldr	r1, .L43+36
	mov	r3, #256
	mov	lr, pc
	bx	r6
	ldr	r3, .L43+40
	mov	lr, pc
	bx	r3
	ldr	r1, .L43+44
	ldr	r2, .L43+48
	ldr	r3, .L43+52
	str	r5, [r1]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	ip, #97
	mov	r0, #1
	strh	r1, [r4, #4]	@ movhi
	ldr	r3, .L43+56
	ldr	r2, .L43+60
	ldr	r1, .L43+64
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	str	r1, [r2, #4092]
	bl	goToStart
	ldr	r3, .L43+68
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	mgba_open
	.word	DMANow
	.word	shadowOAM
	.word	7939
	.word	6410
	.word	7173
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	hOff
	.word	vOff
	.word	setupSounds
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	buffer
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16
	ldr	r4, .L47
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L47+4
	mov	lr, pc
	bx	r4
	mov	r3, #896
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L47+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L47+12
	ldr	r1, .L47+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L47+20
	ldr	r1, .L47+24
	mov	lr, pc
	bx	r4
	mov	r3, #2672
	mov	r0, #3
	ldr	r2, .L47+28
	ldr	r1, .L47+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L47+36
	ldr	r1, .L47+40
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L47+44
	ldr	r1, .L47+48
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L47+52
	ldr	r1, .L47+56
	mov	lr, pc
	bx	r4
	ldr	r2, .L47+60
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L47+64
	mov	lr, pc
	bx	r4
	ldr	r3, .L47+68
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L47+72
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
	.word	DMANow
	.word	pausetilesetPal
	.word	pausetilesetTiles
	.word	100726784
	.word	instructionstilemapMap
	.word	83886144
	.word	instructionsOverlayPal+64
	.word	100679680
	.word	instructionsOverlayTiles
	.word	100720640
	.word	instructionsOverlayMap
	.word	83886112
	.word	WinLoseOverlayPal+32
	.word	100696064
	.word	WinLoseOverlayTiles
	.word	100714496
	.word	WinLoseOverlayMap
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16
	ldr	r4, .L51
	mov	r0, #3
	ldr	r2, .L51+4
	ldr	r1, .L51+8
	mov	lr, pc
	bx	r4
	mov	r3, #2176
	mov	r0, #3
	ldr	r2, .L51+12
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L51+20
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L51+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	DMANow
	.word	83886144
	.word	instructionsOverlayPal+64
	.word	100679680
	.word	instructions2OverlayTiles
	.word	100720640
	.word	instructions2OverlayMap
	.word	waitForVBlank
	.word	state
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #67108864
	ldr	r0, .L63
	ldr	r2, .L63+4
	str	r3, [r0]
	strh	r3, [r1, #16]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #16
	beq	.L54
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L62
.L54:
	tst	r3, #32
	bxeq	lr
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #32
	bxne	lr
	b	goToStart
.L62:
	b	goToInstructions2
.L64:
	.align	2
.L63:
	.word	hOff
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L75
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	ldr	r4, .L75+8
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L75+12
	mov	lr, pc
	bx	r4
	mov	r3, #2720
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L75+20
	ldr	r1, .L75+24
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L75+28
	ldr	r1, .L75+32
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r0, #3
	ldr	r2, .L75+36
	ldr	r1, .L75+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L75+44
	ldr	r1, .L75+48
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L75+52
	ldr	r1, .L75+56
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L75+60
	ldr	r1, .L75+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L75+68
	ldr	r1, .L75+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+76
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L74
.L66:
	ldr	r3, .L75+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+88
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	r2, #3
	ldr	r1, .L75+92
	ldr	r3, .L75+96
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	ldr	r4, .L75+100
	ldr	r6, .L75+104
	add	r5, r4, #96
	b	.L68
.L67:
	cmp	r4, r5
	beq	.L66
.L68:
	ldr	r0, [r4, #4]!
	cmp	r0, #0
	beq	.L67
	mov	lr, pc
	bx	r6
	b	.L67
.L76:
	.align	2
.L75:
	.word	unpauseSounds
	.word	stopTimer
	.word	DMANow
	.word	gamestatetilesetPal
	.word	gamestatetilesetTiles
	.word	100726784
	.word	gamestatetilemapMap
	.word	83886176
	.word	Level1Pal+96
	.word	100679680
	.word	Level1Tiles
	.word	100720640
	.word	Level1Map
	.word	83886112
	.word	WinLoseOverlayPal+32
	.word	100696064
	.word	WinLoseOverlayTiles
	.word	100714496
	.word	WinLoseOverlayMap
	.word	modified
	.word	playGameSong
	.word	loopGameSong
	.word	startTimer
	.word	prev
	.word	state
	.word	index-4
	.word	saveTilemapModData
	.size	goToGame1, .-goToGame1
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, lr}
	ldr	r4, .L94
	ldr	r2, [r4]
	rsb	r3, r2, r2, lsl #5
	add	r3, r2, r3, lsl #5
	add	r3, r3, r3, lsl #3
	ldr	r1, .L94+4
	rsb	r3, r3, r3, lsl #15
	add	r3, r2, r3, lsl #2
	ldr	ip, .L94+8
	sub	r1, r1, r3
	ldr	r3, .L94+12
	cmp	r1, ip
	str	r0, [r3]
	bls	.L78
	mov	ip, #67108864
	ldr	r0, .L94+16
	ldr	r3, [r0]
	add	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #16
	str	r3, [r0]
	strh	r1, [ip, #16]	@ movhi
.L78:
	ldr	r3, .L94+20
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, r3
	beq	.L79
	mov	ip, #67108864
	ldr	r0, .L94+24
	ldr	r3, [r0]
	add	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #16
	str	r3, [r0]
	strh	r1, [ip, #24]	@ movhi
.L79:
	ldr	r3, .L94+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r1, .L94+32
	ldrh	r1, [r1]
	tst	r1, #8
	beq	.L92
.L80:
	tst	r3, #4
	beq	.L81
	ldr	r3, .L94+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L93
.L81:
	add	r2, r2, #1
	str	r2, [r4]
	pop	{r4, lr}
	bx	lr
.L92:
	bl	goToGame1
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	add	r2, r2, #1
	str	r2, [r4]
	pop	{r4, lr}
	bx	lr
.L93:
	bl	goToInstructions
	ldr	r2, [r4]
	add	r2, r2, #1
	str	r2, [r4]
	pop	{r4, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	buffer
	.word	195225786
	.word	390451572
	.word	modified
	.word	hOff
	.word	1431655766
	.word	h2Off
	.word	oldButtons
	.word	buttons
	.word	initGame1
	.size	start, .-start
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L115
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L112
	tst	r3, #32
	bxeq	lr
	ldr	r3, .L115+4
	ldrh	r3, [r3]
	tst	r3, #32
	bxne	lr
	b	goToInstructions
.L112:
	ldr	r2, .L115+4
	ldrh	r2, [r2]
	push	{r4, lr}
	ands	r4, r2, #16
	beq	.L113
	tst	r3, #32
	beq	.L96
	ldr	r3, .L115+4
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L114
.L96:
	pop	{r4, lr}
	bx	lr
.L114:
	pop	{r4, lr}
	b	goToInstructions
.L113:
	bl	goToGame1
	ldr	r3, .L115+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L115+12
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L116:
	.align	2
.L115:
	.word	oldButtons
	.word	buttons
	.word	initGame1
	.word	totalPlanted
	.size	instructions2, .-instructions2
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L127
	mov	lr, pc
	bx	r3
	ldr	r3, .L127+4
	ldr	r4, .L127+8
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L127+12
	mov	lr, pc
	bx	r4
	mov	r3, #2720
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L127+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L127+20
	ldr	r1, .L127+24
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L127+28
	ldr	r1, .L127+32
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r0, #3
	ldr	r2, .L127+36
	ldr	r1, .L127+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L127+44
	ldr	r1, .L127+48
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L127+52
	ldr	r1, .L127+56
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L127+60
	ldr	r1, .L127+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L127+68
	ldr	r1, .L127+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L127+76
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L126
.L118:
	ldr	r3, .L127+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L127+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L127+88
	mov	lr, pc
	bx	r3
	mov	r0, #2
	mov	r2, #4
	ldr	r1, .L127+92
	ldr	r3, .L127+96
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	ldr	r4, .L127+100
	ldr	r6, .L127+104
	add	r5, r4, #96
	b	.L120
.L119:
	cmp	r4, r5
	beq	.L118
.L120:
	ldr	r0, [r4, #4]!
	cmp	r0, #0
	beq	.L119
	mov	lr, pc
	bx	r6
	b	.L119
.L128:
	.align	2
.L127:
	.word	unpauseSounds
	.word	stopTimer
	.word	DMANow
	.word	gamestatetilesetPal
	.word	gamestatetilesetTiles
	.word	100726784
	.word	gamestatetilemapMap
	.word	83886176
	.word	Level2Pal+96
	.word	100679680
	.word	Level2Tiles
	.word	100720640
	.word	Level2Map
	.word	83886112
	.word	WinLoseOverlayPal+32
	.word	100696064
	.word	WinLoseOverlayTiles
	.word	100714496
	.word	WinLoseOverlayMap
	.word	modified
	.word	playGameSong
	.word	loopGameSong
	.word	startTimer
	.word	prev
	.word	state
	.word	index-4
	.word	saveTilemapModData
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame3, %function
goToGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L139
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+4
	ldr	r4, .L139+8
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L139+12
	mov	lr, pc
	bx	r4
	mov	r3, #2720
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L139+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L139+20
	ldr	r1, .L139+24
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L139+28
	ldr	r1, .L139+32
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r0, #3
	ldr	r2, .L139+36
	ldr	r1, .L139+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L139+44
	ldr	r1, .L139+48
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L139+52
	ldr	r1, .L139+56
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L139+60
	ldr	r1, .L139+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L139+68
	ldr	r1, .L139+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L139+76
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L138
.L130:
	ldr	r3, .L139+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+88
	mov	lr, pc
	bx	r3
	mov	r0, #3
	mov	r2, #5
	ldr	r1, .L139+92
	ldr	r3, .L139+96
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	ldr	r4, .L139+100
	ldr	r6, .L139+104
	add	r5, r4, #96
	b	.L132
.L131:
	cmp	r4, r5
	beq	.L130
.L132:
	ldr	r0, [r4, #4]!
	cmp	r0, #0
	beq	.L131
	mov	lr, pc
	bx	r6
	b	.L131
.L140:
	.align	2
.L139:
	.word	unpauseSounds
	.word	stopTimer
	.word	DMANow
	.word	gamestatetilesetPal
	.word	gamestatetilesetTiles
	.word	100726784
	.word	gamestatetilemapMap
	.word	83886176
	.word	Level3Pal+96
	.word	100679680
	.word	Level3Tiles
	.word	100720640
	.word	Level3Map
	.word	83886112
	.word	WinLoseOverlayPal+32
	.word	100696064
	.word	WinLoseOverlayTiles
	.word	100714496
	.word	WinLoseOverlayMap
	.word	modified
	.word	playGameSong
	.word	loopGameSong
	.word	startTimer
	.word	prev
	.word	state
	.word	index-4
	.word	saveTilemapModData
	.size	goToGame3, .-goToGame3
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16
	ldr	r4, .L143
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L143+4
	mov	lr, pc
	bx	r4
	mov	r3, #896
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L143+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L143+12
	ldr	r1, .L143+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L143+20
	ldr	r1, .L143+24
	mov	lr, pc
	bx	r4
	mov	r3, #1056
	mov	r0, #3
	ldr	r2, .L143+28
	ldr	r1, .L143+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L143+36
	ldr	r1, .L143+40
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L143+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+52
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L143+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L144:
	.align	2
.L143:
	.word	DMANow
	.word	pausetilesetPal
	.word	pausetilesetTiles
	.word	100726784
	.word	instructionstilemapMap
	.word	83886144
	.word	pauseOverlayPal+64
	.word	100679680
	.word	pauseOverlayTiles
	.word	100720640
	.word	pauseOverlayMap
	.word	pauseSounds
	.word	playPauseSong
	.word	loopPauseSong
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	ldr	r4, .L161
	ldrh	r3, [r4]
	ldr	r0, .L161+4
	ldr	r1, .L161+8
	tst	r3, #8
	str	r2, [r0]
	str	r2, [r1]
	beq	.L146
	ldr	r2, .L161+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L157
.L146:
	tst	r3, #4
	beq	.L145
	ldr	r3, .L161+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L158
.L145:
	pop	{r4, lr}
	bx	lr
.L157:
	ldr	r2, .L161+16
	ldr	r2, [r2]
	cmp	r2, #1
	beq	.L159
	cmp	r2, #2
	beq	.L160
	cmp	r2, #3
	bne	.L146
	bl	goToGame3
	ldrh	r3, [r4]
	b	.L146
.L158:
	pop	{r4, lr}
	b	goToStart
.L159:
	bl	goToGame1
	ldrh	r3, [r4]
	b	.L146
.L160:
	bl	goToGame2
	ldrh	r3, [r4]
	b	.L146
.L162:
	.align	2
.L161:
	.word	oldButtons
	.word	vOff
	.word	hOff
	.word	buttons
	.word	prev
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L165
	ldr	r4, .L165+4
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L165+8
	mov	lr, pc
	bx	r4
	mov	r3, #896
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L165+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L165+16
	ldr	r1, .L165+20
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L165+24
	ldr	r1, .L165+28
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r0, #3
	ldr	r2, .L165+32
	ldr	r1, .L165+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L165+40
	mov	r0, #3
	ldr	r1, .L165+44
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L165+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L165+52
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L165+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L166:
	.align	2
.L165:
	.word	stopTimer
	.word	DMANow
	.word	pausetilesetPal
	.word	pausetilesetTiles
	.word	100726784
	.word	instructionstilemapMap
	.word	83886144
	.word	LoseStateOverlayPal+64
	.word	100679680
	.word	LoseStateOverlayTiles
	.word	100720640
	.word	LoseStateOverlayMap
	.word	pauseSounds
	.word	playLoseSound
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1.part.0, %function
game1.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r0, .L168
	ldr	r1, .L168+4
	ldr	r2, .L168+8
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	b	goToLose
.L169:
	.align	2
.L168:
	.word	second
	.word	minute
	.word	totalPlanted
	.size	game1.part.0, .-game1.part.0
	.set	game3.part.0,game1.part.0
	.set	game2.part.0,game1.part.0
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L181
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L181+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L171
	ldr	r3, .L181+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L178
.L171:
	ldr	r4, .L181+12
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L179
.L172:
	cmp	r3, #0
	bne	.L170
	ldr	r3, .L181+16
	ldr	r3, [r3]
	cmp	r3, #24
	beq	.L180
.L170:
	pop	{r4, lr}
	bx	lr
.L179:
	mov	r3, #0
	ldr	ip, .L181+20
	ldr	r1, .L181+16
	ldr	r0, .L181+24
	ldr	r2, .L181+28
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	bl	goToGame3
	ldr	r3, [r4]
	b	.L172
.L178:
	bl	goToPause
	b	.L171
.L180:
	pop	{r4, lr}
	b	game2.part.0
.L182:
	.align	2
.L181:
	.word	updateGame2
	.word	oldButtons
	.word	buttons
	.word	metRequirement
	.word	totalPlanted
	.word	second
	.word	minute
	.word	initGame3
	.size	game2, .-game2
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L194
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L194+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L184
	ldr	r3, .L194+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L191
.L184:
	ldr	r4, .L194+12
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L192
.L185:
	cmp	r3, #0
	bne	.L183
	ldr	r3, .L194+16
	ldr	r3, [r3]
	cmp	r3, #24
	beq	.L193
.L183:
	pop	{r4, lr}
	bx	lr
.L192:
	mov	r3, #0
	ldr	ip, .L194+16
	ldr	r1, .L194+20
	ldr	r0, .L194+24
	ldr	r2, .L194+28
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	bl	goToGame2
	ldr	r3, [r4]
	b	.L185
.L191:
	bl	goToPause
	b	.L184
.L193:
	pop	{r4, lr}
	b	game1.part.0
.L195:
	.align	2
.L194:
	.word	updateGame1
	.word	oldButtons
	.word	buttons
	.word	metRequirement
	.word	totalPlanted
	.word	minute
	.word	second
	.word	initGame2
	.size	game1, .-game1
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L198
	ldrh	r0, [r2]
	ldr	r1, .L198+4
	ldr	r2, .L198+8
	tst	r0, #8
	str	r3, [r1]
	str	r3, [r2]
	bxeq	lr
	b	lose.part.0
.L199:
	.align	2
.L198:
	.word	oldButtons
	.word	vOff
	.word	hOff
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L202
	ldr	r4, .L202+4
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L202+8
	mov	lr, pc
	bx	r4
	mov	r3, #896
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L202+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L202+16
	ldr	r1, .L202+20
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L202+24
	ldr	r1, .L202+28
	mov	lr, pc
	bx	r4
	mov	r3, #672
	mov	r0, #3
	ldr	r2, .L202+32
	ldr	r1, .L202+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L202+40
	mov	r0, #3
	ldr	r1, .L202+44
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L202+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L202+52
	mov	lr, pc
	bx	r3
	mov	r2, #7
	ldr	r3, .L202+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L203:
	.align	2
.L202:
	.word	stopTimer
	.word	DMANow
	.word	pausetilesetPal
	.word	pausetilesetTiles
	.word	100726784
	.word	instructionstilemapMap
	.word	83886144
	.word	winStateOverlayPal+64
	.word	100679680
	.word	winStateOverlayTiles
	.word	100720640
	.word	winStateOverlayMap
	.word	pauseSounds
	.word	playWinSound
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	game3
	.syntax unified
	.arm
	.fpu softvfp
	.type	game3, %function
game3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L215
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L215+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L205
	ldr	r3, .L215+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L212
.L205:
	ldr	r4, .L215+12
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L213
.L206:
	cmp	r3, #0
	bne	.L204
	ldr	r3, .L215+16
	ldr	r3, [r3]
	cmp	r3, #24
	beq	.L214
.L204:
	pop	{r4, lr}
	bx	lr
.L213:
	mov	r3, #0
	ldr	r0, .L215+20
	ldr	r1, .L215+24
	ldr	r2, .L215+16
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	bl	goToWin
	ldr	r3, [r4]
	b	.L206
.L212:
	bl	goToPause
	b	.L205
.L214:
	pop	{r4, lr}
	b	game3.part.0
.L216:
	.align	2
.L215:
	.word	updateGame3
	.word	oldButtons
	.word	buttons
	.word	metRequirement
	.word	totalPlanted
	.word	second
	.word	minute
	.size	game3, .-game3
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L236
	mov	lr, pc
	bx	r3
	ldr	r4, .L236+4
	ldr	fp, .L236+8
	ldr	r6, .L236+12
	ldr	r5, .L236+16
	ldr	r10, .L236+20
	ldr	r9, .L236+24
	ldr	r8, .L236+28
	ldr	r7, .L236+32
.L231:
	ldrh	r2, [r4]
	ldr	r3, .L236+36
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp]
	ldrh	r1, [r8, #48]
	strh	r1, [r4]	@ movhi
	cmp	r3, #8
	ldrls	pc, [pc, r3, asl #2]
	b	.L218
.L220:
	.word	.L228
	.word	.L227
	.word	.L226
	.word	.L225
	.word	.L224
	.word	.L223
	.word	.L222
	.word	.L221
	.word	.L219
.L219:
	mov	r3, #0
	tst	r2, #8
	str	r3, [r6]
	str	r3, [r5]
	ldrne	r3, .L236+40
	movne	lr, pc
	bxne	r3
.L218:
	ldr	r3, .L236+44
	mov	lr, pc
	bx	r3
	mov	r1, r7
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	ip, .L236+48
	mov	lr, pc
	bx	ip
	mov	r3, #67108864
	ldrh	r2, [r5]
	strh	r2, [r3, #16]	@ movhi
	ldrh	r2, [r6]
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, .L236+52
	ldrh	r2, [r2]
	strh	r2, [r3, #22]	@ movhi
	ldr	r2, .L236+56
	ldrh	r2, [r2]
	strh	r2, [r3, #20]	@ movhi
	ldrh	r2, [r10]
	ldrh	r1, [r3, #24]
	strh	r2, [r3, #26]	@ movhi
	mov	lr, pc
	bx	r9
	b	.L231
.L221:
	mov	r3, #0
	tst	r2, #8
	str	r3, [r5]
	str	r3, [r6]
	beq	.L218
	ldr	r3, .L236+60
	mov	lr, pc
	bx	r3
	b	.L218
.L222:
	ldr	r3, .L236+64
	mov	lr, pc
	bx	r3
	b	.L218
.L223:
	ldr	r3, .L236+68
	mov	lr, pc
	bx	r3
	b	.L218
.L224:
	ldr	r3, .L236+72
	mov	lr, pc
	bx	r3
	b	.L218
.L225:
	ldr	r3, .L236+76
	mov	lr, pc
	bx	r3
	b	.L218
.L226:
	ldr	r3, .L236+80
	mov	lr, pc
	bx	r3
	b	.L218
.L228:
	ldr	r3, .L236+84
	mov	lr, pc
	bx	r3
	b	.L218
.L227:
	ldr	r3, .L236+88
	mov	lr, pc
	bx	r3
	b	.L218
.L237:
	.align	2
.L236:
	.word	initialize
	.word	buttons
	.word	state
	.word	vOff
	.word	hOff
	.word	v2Off
	.word	hideSprites
	.word	67109120
	.word	shadowOAM
	.word	oldButtons
	.word	lose.part.0
	.word	waitForVBlank
	.word	DMANow
	.word	v1Off
	.word	h1Off
	.word	win.part.0
	.word	pause
	.word	game3
	.word	game2
	.word	game1
	.word	instructions2
	.word	start
	.word	instructions
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L240
	ldrh	r0, [r2]
	ldr	r1, .L240+4
	ldr	r2, .L240+8
	tst	r0, #8
	str	r3, [r1]
	str	r3, [r2]
	bxeq	lr
	b	win.part.0
.L241:
	.align	2
.L240:
	.word	oldButtons
	.word	hOff
	.word	vOff
	.size	win, .-win
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L244
	ldr	r2, .L244+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L244+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L245:
	.align	2
.L244:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	buffer,4,4
	.comm	prev,4,4
	.comm	totalPlanted,4,4
	.comm	metRequirement,4,4
	.comm	v2Off,4,4
	.comm	h2Off,4,4
	.comm	songs,120,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	enemies,784,4
	.comm	fences,512,4
	.comm	plotArea,1248,4
	.comm	veggies,96,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
