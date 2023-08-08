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
	.file	"game.c"
	.text
	.align	2
	.global	canMoveLeft
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft, %function
canMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L6
	str	lr, [sp, #-4]!
	ldr	r3, .L6+4
	ldr	r2, [r1, #4]
	ldr	ip, [r3]
	ldr	lr, [r1, #8]
	ldr	r3, [r1]
	add	r0, ip, r2, lsl #8
	sub	r3, r3, lr
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1
	ldr	r1, [r1, #20]
	add	r2, r2, r1
	sub	r2, r2, #1
	add	r2, ip, r2, lsl #8
	ldrb	r0, [r2, r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	player
	.word	collisionMap
	.size	canMoveLeft, .-canMoveLeft
	.align	2
	.global	canMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight, %function
canMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L12
	str	lr, [sp, #-4]!
	ldr	r0, [r1, #16]
	ldr	lr, [r1, #4]
	ldr	r2, [r1, #20]
	ldr	r3, [r1]
	ldr	ip, .L12+4
	add	r3, r3, r0
	ldr	ip, [ip]
	ldr	r1, [r1, #8]
	add	r2, lr, r2
	sub	r2, r2, #1
	sub	r3, r3, #1
	add	r2, ip, r2, lsl #8
	add	r3, r3, r1
	ldrb	r0, [r2, r3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L8
	add	ip, ip, lr, lsl #8
	ldrb	r0, [ip, r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
.L8:
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	collisionMap
	.size	canMoveRight, .-canMoveRight
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L17
	ldr	r3, .L17+4
	ldr	r0, [r1, #12]
	ldr	ip, [r1]
	ldr	r3, [r3]
	ldr	r2, [r1, #4]
	add	r3, r3, ip
	sub	r2, r2, r0
	ldrb	r0, [r3, r2, lsl #8]	@ zero_extendqisi2
	cmp	r0, #0
	add	r3, r3, r2, lsl #8
	bxeq	lr
	ldr	r2, [r1, #16]
	add	r3, r3, r2
	ldrb	r0, [r3, #-1]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	collisionMap
	.size	canMoveUp, .-canMoveUp
	.align	2
	.global	canMoveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown, %function
canMoveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L22
	ldr	r2, .L22+4
	ldr	r0, [r1, #20]
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #12]
	add	r3, r3, r0
	ldr	r2, [r2]
	ldr	r0, [r1]
	sub	r3, r3, #1
	add	r3, r3, ip
	add	r2, r2, r0
	ldrb	r0, [r2, r3, lsl #8]	@ zero_extendqisi2
	cmp	r0, #0
	add	r3, r2, r3, lsl #8
	bxeq	lr
	ldr	r2, [r1, #16]
	add	r3, r3, r2
	ldrb	r0, [r3, #-1]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.word	collisionMap
	.size	canMoveDown, .-canMoveDown
	.align	2
	.global	LevelRequirement
	.syntax unified
	.arm
	.fpu softvfp
	.type	LevelRequirement, %function
LevelRequirement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	ldr	r3, .L26+4
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	bxlt	lr
	ldr	r2, .L26+8
	ldr	r3, .L26+12
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	bxlt	lr
	ldr	r2, .L26+16
	ldr	r3, .L26+20
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	bxlt	lr
	ldr	r2, .L26+24
	ldr	r3, .L26+28
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	movge	r2, #1
	ldrge	r3, .L26+32
	strge	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	carrotCount
	.word	carrotR
	.word	tomatoCount
	.word	tomatoR
	.word	eggplantCount
	.word	eggplantR
	.word	cornCount
	.word	cornR
	.word	metRequirement
	.size	LevelRequirement, .-LevelRequirement
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #1
	mov	r0, #24
	mov	r5, #96
	mov	r4, #64
	mov	lr, #3
	mov	r1, #0
	mov	ip, #10
	ldr	r3, .L30
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #40]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #32]
	str	r1, [r3, #36]
	str	r1, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initInventory
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInventory, %function
initInventory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L36
	mov	r0, #3
	mov	r3, r2
	mov	r1, #24
	push	{r4, r5, lr}
	add	ip, r2, #96
.L33:
	str	r0, [r3]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	add	r3, r3, #24
	cmp	r3, ip
	bne	.L33
	mov	r4, #1
	mov	r5, #20
	mov	lr, #2
	mov	ip, #4
	ldr	r3, [r2, #36]
	add	r1, r3, #10
	lsl	r1, r1, r4
	str	r1, [r2, #52]
	add	r1, r3, r3, lsl r4
	add	r1, r1, r5
	add	r3, r3, r5
	str	r5, [r2, #4]
	str	r4, [r2, #16]
	str	lr, [r2, #40]
	str	r0, [r2, #64]
	str	r1, [r2, #76]
	str	r3, [r2, #28]
	str	ip, [r2, #88]
	pop	{r4, r5, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	veggies
	.size	initInventory, .-initInventory
	.align	2
	.global	initPlot
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlot, %function
initPlot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L48
	mov	ip, #0
	mov	r3, r2
	mov	r1, #16
	push	{r4, r5, r6, r7, lr}
	add	r0, r2, #1248
.L39:
	str	ip, [r3, #40]
	str	r1, [r3, #36]
	str	r1, [r3, #20]
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L39
	mov	r0, #1
	mov	r1, #10
	mov	r7, r0
	mov	r6, #14
	mov	r5, #15
	mov	r4, #112
	ldr	r3, .L48
.L40:
	str	r1, [r3]
	add	lr, r1, #1
	lsl	ip, r1, #3
	add	r1, r1, #2
	cmp	r1, #26
	str	r0, [r3, #28]
	str	r6, [r3, #4]
	str	r5, [r3, #12]
	str	r4, [r3, #32]
	str	r7, [r3, #24]
	str	lr, [r3, #8]
	str	ip, [r3, #16]
	add	r0, r0, #1
	add	r3, r3, #52
	bne	.L40
	mov	r0, #1
	mov	r1, #10
	mov	r7, #19
	mov	r6, #20
	mov	r5, #152
	mov	r4, #2
	ldr	r3, .L48
.L41:
	str	r1, [r3, #416]
	add	lr, r1, #1
	lsl	ip, r1, #3
	add	r1, r1, #2
	cmp	r1, #26
	str	r0, [r3, #444]
	str	r7, [r3, #420]
	str	r6, [r3, #428]
	str	r5, [r3, #448]
	str	r4, [r3, #440]
	str	lr, [r3, #424]
	str	ip, [r3, #432]
	add	r0, r0, #1
	add	r3, r3, #52
	bne	.L41
	mov	r1, #1
	mov	r3, #10
	mov	r6, #24
	mov	r5, #25
	mov	r4, #192
	mov	lr, #3
.L42:
	str	r3, [r2, #832]
	add	ip, r3, #1
	lsl	r0, r3, #3
	add	r3, r3, #2
	cmp	r3, #26
	str	r1, [r2, #860]
	str	r6, [r2, #836]
	str	r5, [r2, #844]
	str	r4, [r2, #864]
	str	lr, [r2, #856]
	str	ip, [r2, #840]
	str	r0, [r2, #848]
	add	r1, r1, #1
	add	r2, r2, #52
	bne	.L42
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	plotArea
	.size	initPlot, .-initPlot
	.align	2
	.global	initFences
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFences, %function
initFences:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #10
	ldr	lr, .L56
	mov	r9, #6
	mov	r2, #110
	mov	r3, lr
	mov	r1, lr
	mov	r0, #64
	mov	r7, #224
	mov	r6, #24
	mov	r5, #32
	mov	r4, #0
	mov	ip, #1
	ldr	r8, .L56+4
	str	r10, [r8]
	ldr	r8, .L56+8
	str	r9, [r8]
.L51:
	str	r2, [r1, #28]
	add	r2, r2, #1
	cmp	r2, #115
	stm	r1, {r0, r5}
	str	r7, [r1, #8]
	str	r6, [r1, #12]
	str	r4, [r1, #24]
	str	ip, [r1, #16]
	add	r0, r0, #32
	add	r1, r1, #32
	bne	.L51
	mov	r4, #64
	mov	r6, #68
	mov	r5, #24
	mov	ip, #32
	mov	r0, #0
	mov	r1, #1
.L52:
	str	r2, [lr, #188]
	add	r2, r2, #1
	cmp	r2, #120
	str	r4, [lr, #160]
	str	r6, [lr, #168]
	str	r5, [lr, #172]
	str	ip, [lr, #164]
	str	r0, [lr, #184]
	str	r1, [lr, #176]
	add	r4, r4, #32
	add	lr, lr, #32
	bne	.L52
	str	r2, [r3, #348]
	mov	r2, #123
	mov	lr, #16
	mov	r5, #48
	mov	r4, #224
	mov	r8, #104
	mov	r7, #144
	mov	r6, #184
	mov	fp, #121
	mov	r10, #122
	mov	r9, #125
	str	r2, [r3, #444]
	mov	r2, #124
	str	r8, [r3, #328]
	str	r8, [r3, #424]
	str	r5, [r3, #320]
	str	r5, [r3, #352]
	str	r5, [r3, #384]
	str	lr, [r3, #324]
	str	lr, [r3, #356]
	str	lr, [r3, #388]
	str	lr, [r3, #420]
	str	lr, [r3, #452]
	str	r7, [r3, #360]
	str	r7, [r3, #456]
	str	fp, [r3, #380]
	str	r6, [r3, #392]
	str	r10, [r3, #412]
	str	r4, [r3, #416]
	str	r4, [r3, #448]
	str	ip, [r3, #332]
	str	r0, [r3, #344]
	str	r1, [r3, #340]
	str	ip, [r3, #364]
	str	r0, [r3, #376]
	str	r1, [r3, #372]
	str	ip, [r3, #396]
	str	r0, [r3, #408]
	str	r1, [r3, #404]
	str	ip, [r3, #428]
	str	r0, [r3, #440]
	str	r1, [r3, #436]
	str	ip, [r3, #460]
	str	r0, [r3, #472]
	str	lr, [r3, #484]
	str	r6, [r3, #488]
	str	r4, [r3, #480]
	str	r9, [r3, #508]
	str	r1, [r3, #468]
	str	ip, [r3, #492]
	str	r0, [r3, #504]
	str	r1, [r3, #500]
	str	r2, [r3, #476]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	fences
	.word	horizontalFences
	.word	verticalFences
	.size	initFences, .-initFences
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L62
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, r3
	mov	lr, #24
	mov	r2, #1
	mov	r1, #3
	mov	r5, #10
	mov	r0, #0
	add	r4, r3, #784
.L59:
	str	lr, [ip, #20]
	str	lr, [ip, #16]
	str	r2, [ip, #24]
	str	r1, [ip, #40]
	str	r5, [ip, #32]
	str	r2, [ip, #8]
	str	r2, [ip, #12]
	str	r0, [ip, #36]
	add	ip, ip, #56
	cmp	ip, r4
	bne	.L59
	mov	r7, #80
	str	r7, [r3, #44]
	str	r7, [r3, #56]
	mov	r7, #84
	str	r7, [r3, #268]
	mov	r7, #96
	str	r7, [r3, #224]
	mov	r7, #85
	str	r7, [r3, #772]
	mov	r7, #112
	str	r7, [r3, #728]
	mov	r7, #86
	mov	ip, #224
	mov	r4, #144
	mov	lr, #2
	mov	r6, #104
	mov	r8, #184
	mov	fp, #81
	mov	r10, #82
	mov	r9, #83
	str	r7, [r3, #436]
	mov	r7, #128
	str	r2, [r3, #28]
	str	r2, [r3, #48]
	str	r2, [r3, #196]
	str	r2, [r3, #364]
	str	r2, [r3, #108]
	str	r6, [r3, #4]
	str	fp, [r3, #212]
	str	r4, [r3, #172]
	str	lr, [r3, #216]
	str	lr, [r3, #276]
	str	r10, [r3, #380]
	str	r8, [r3, #340]
	str	r9, [r3, #100]
	str	r0, [r3]
	str	r0, [r3, #168]
	str	r0, [r3, #336]
	str	r1, [r3, #384]
	str	r1, [r3, #84]
	str	r1, [r3, #252]
	str	r1, [r3, #756]
	str	r1, [r3, #780]
	str	r1, [r3, #420]
	str	ip, [r3, #60]
	str	ip, [r3, #228]
	str	ip, [r3, #732]
	str	r7, [r3, #392]
	str	r2, [r3, #332]
	mov	r2, #4
	str	r2, [r3, #444]
	mov	r2, #87
	str	r2, [r3, #492]
	mov	r2, #5
	str	r2, [r3, #500]
	mov	r2, #91
	str	r2, [r3, #156]
	mov	r2, #160
	str	r2, [r3, #112]
	mov	r2, #6
	str	r2, [r3, #164]
	mov	r2, #92
	str	r2, [r3, #716]
	mov	r2, #176
	str	r2, [r3, #672]
	mov	r2, #7
	str	r2, [r3, #724]
	mov	r2, #93
	str	r2, [r3, #660]
	mov	r2, #192
	str	r2, [r3, #616]
	mov	r2, #220
	str	r2, [r3, #620]
	mov	r2, #8
	str	r2, [r3, #668]
	mov	r2, #88
	str	r2, [r3, #324]
	mov	r2, #89
	mov	r5, #210
	str	r2, [r3, #548]
	mov	r2, #90
	str	r6, [r3, #284]
	str	r4, [r3, #448]
	str	r4, [r3, #508]
	str	lr, [r3, #556]
	str	r5, [r3, #452]
	str	r5, [r3, #116]
	str	ip, [r3, #396]
	str	ip, [r3, #676]
	str	ip, [r3, #280]
	str	ip, [r3, #504]
	str	r1, [r3, #476]
	str	r1, [r3, #140]
	str	r1, [r3, #700]
	str	r1, [r3, #644]
	str	r0, [r3, #308]
	str	r0, [r3, #532]
	str	r0, [r3, #588]
	str	r8, [r3, #564]
	str	ip, [r3, #560]
	str	r1, [r3, #612]
	str	r2, [r3, #604]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	enemies
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initLevel1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevel1, %function
initLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #11
	mov	r6, #4
	mov	r2, #3
	mov	r1, #1
	mov	lr, #10
	mov	ip, #24
	mov	r0, #0
	mov	r5, #96
	mov	r4, #64
	ldr	r3, .L66
	str	r7, [r3]
	ldr	r3, .L66+4
	str	r6, [r3]
	ldr	r3, .L66+8
	str	r2, [r3]
	ldr	r3, .L66+12
	str	r2, [r3]
	ldr	r3, .L66+16
	str	r2, [r3]
	ldr	r3, .L66+20
	str	r2, [r3]
	ldr	r3, .L66+24
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #32]
	str	r2, [r3, #40]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	bl	initEnemy
	bl	initInventory
	bl	initPlot
	pop	{r4, r5, r6, r7, r8, lr}
	b	initFences
.L67:
	.align	2
.L66:
	.word	level1FenceNum
	.word	level1EnemyNum
	.word	carrotR
	.word	eggplantR
	.word	cornR
	.word	tomatoR
	.word	player
	.size	initLevel1, .-initLevel1
	.align	2
	.global	initGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame1, %function
initGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r0, .L72
	ldr	ip, .L72+4
	str	r3, [r0]
	ldr	r1, .L72+8
	ldr	r0, .L72+12
	str	r3, [ip]
	ldr	ip, .L72+16
	str	r3, [r1]
	str	r3, [r0]
	ldr	r1, .L72+20
	mov	r2, r3
	ldr	r0, .L72+24
	ldr	r3, .L72+28
	str	lr, [ip]
	str	r0, [r1]
	add	r1, r3, #96
.L69:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L69
	ldr	r3, .L72+32
	ldr	lr, .L72+36
	str	r2, [r3]
	ldr	ip, .L72+40
	ldr	r0, .L72+44
	ldr	r1, .L72+48
	ldr	r3, .L72+52
	str	r2, [lr]
	ldr	lr, .L72+56
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	ldr	ip, .L72+60
	ldr	r0, .L72+64
	ldr	r1, .L72+68
	ldr	r3, .L72+72
	str	r2, [lr]
	ldr	lr, [sp], #4
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	b	initLevel1
.L73:
	.align	2
.L72:
	.word	hOff
	.word	vOff
	.word	h1Off
	.word	v1Off
	.word	selectVeggie
	.word	collisionMap
	.word	collisionmapBitmap
	.word	index-4
	.word	carrotCount
	.word	cornCount
	.word	tomatoCount
	.word	eggplantCount
	.word	metRequirement
	.word	modified
	.word	paletteNum
	.word	fenceNum
	.word	second
	.word	minute
	.word	totalPlanted
	.size	initGame1, .-initGame1
	.align	2
	.global	initLevel2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevel2, %function
initLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #8
	mov	r3, #5
	mov	r7, #4
	mov	ip, #3
	mov	r2, #1
	mov	r1, #0
	mov	r0, #24
	mov	r6, #96
	mov	r5, #64
	mov	r4, #10
	ldr	r8, .L76
	str	lr, [r8]
	ldr	r8, .L76+4
	str	lr, [r8]
	ldr	lr, .L76+8
	str	r3, [lr]
	ldr	lr, .L76+12
	str	r3, [lr]
	ldr	r3, .L76+16
	str	r7, [r3]
	ldr	r3, .L76+20
	str	ip, [r3]
	ldr	r3, .L76+24
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #32]
	str	ip, [r3, #40]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #36]
	str	r1, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	bl	initEnemy
	bl	initInventory
	bl	initPlot
	pop	{r4, r5, r6, r7, r8, lr}
	b	initFences
.L77:
	.align	2
.L76:
	.word	level2FenceNum
	.word	level2EnemyNum
	.word	carrotR
	.word	cornR
	.word	eggplantR
	.word	tomatoR
	.word	player
	.size	initLevel2, .-initLevel2
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r0, .L82
	ldr	ip, .L82+4
	str	r3, [r0]
	ldr	r1, .L82+8
	ldr	r0, .L82+12
	str	r3, [ip]
	ldr	ip, .L82+16
	str	r3, [r1]
	str	r3, [r0]
	ldr	r1, .L82+20
	mov	r2, r3
	ldr	r0, .L82+24
	ldr	r3, .L82+28
	str	lr, [ip]
	str	r0, [r1]
	add	r1, r3, #96
.L79:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L79
	mov	r1, #1
	ldr	r3, .L82+32
	ldr	lr, .L82+36
	str	r1, [r3]
	ldr	ip, .L82+40
	ldr	r0, .L82+44
	ldr	r1, .L82+48
	ldr	r3, .L82+52
	str	r2, [lr]
	ldr	lr, .L82+56
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	ldr	ip, .L82+60
	ldr	r0, .L82+64
	ldr	r1, .L82+68
	ldr	r3, .L82+72
	str	r2, [lr]
	ldr	lr, [sp], #4
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	b	initLevel2
.L83:
	.align	2
.L82:
	.word	hOff
	.word	vOff
	.word	h1Off
	.word	v1Off
	.word	selectVeggie
	.word	collisionMap
	.word	collisionmapBitmap
	.word	index-4
	.word	paletteNum
	.word	carrotCount
	.word	cornCount
	.word	tomatoCount
	.word	eggplantCount
	.word	metRequirement
	.word	modified
	.word	fenceNum
	.word	second
	.word	minute
	.word	totalPlanted
	.size	initGame2, .-initGame2
	.align	2
	.global	initLevel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevel3, %function
initLevel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #6
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #11
	mov	r7, #4
	mov	ip, #3
	mov	r2, #1
	mov	r1, #0
	mov	lr, #5
	mov	r0, #24
	mov	r6, #96
	mov	r5, #64
	mov	r4, #10
	ldr	r9, .L86
	str	r3, [r9]
	ldr	r9, .L86+4
	str	r3, [r9]
	ldr	r3, .L86+8
	str	r8, [r3]
	ldr	r3, .L86+12
	str	r7, [r3]
	ldr	r3, .L86+16
	str	ip, [r3]
	ldr	r3, .L86+20
	str	ip, [r3, #40]
	ldr	ip, .L86+24
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #32]
	str	lr, [ip]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #36]
	str	r1, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	bl	initEnemy
	bl	initInventory
	bl	initPlot
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initFences
.L87:
	.align	2
.L86:
	.word	level3FenceNum
	.word	tomatoR
	.word	level3EnemyNum
	.word	carrotR
	.word	eggplantR
	.word	player
	.word	cornR
	.size	initLevel3, .-initLevel3
	.align	2
	.global	initGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame3, %function
initGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r0, .L92
	ldr	ip, .L92+4
	str	r3, [r0]
	ldr	r1, .L92+8
	ldr	r0, .L92+12
	str	r3, [ip]
	ldr	ip, .L92+16
	str	r3, [r1]
	str	r3, [r0]
	ldr	r1, .L92+20
	mov	r2, r3
	ldr	r0, .L92+24
	ldr	r3, .L92+28
	str	lr, [ip]
	str	r0, [r1]
	add	r1, r3, #96
.L89:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L89
	mov	r1, #2
	ldr	r3, .L92+32
	ldr	lr, .L92+36
	str	r1, [r3]
	ldr	ip, .L92+40
	ldr	r0, .L92+44
	ldr	r1, .L92+48
	ldr	r3, .L92+52
	str	r2, [lr]
	ldr	lr, .L92+56
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	ldr	ip, .L92+60
	ldr	r0, .L92+64
	ldr	r1, .L92+68
	ldr	r3, .L92+72
	str	r2, [lr]
	ldr	lr, [sp], #4
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r3]
	b	initLevel3
.L93:
	.align	2
.L92:
	.word	hOff
	.word	vOff
	.word	h1Off
	.word	v1Off
	.word	selectVeggie
	.word	collisionMap
	.word	collisionmapBitmap
	.word	index-4
	.word	paletteNum
	.word	carrotCount
	.word	cornCount
	.word	tomatoCount
	.word	eggplantCount
	.word	modified
	.word	metRequirement
	.word	fenceNum
	.word	second
	.word	minute
	.word	totalPlanted
	.size	initGame3, .-initGame3
	.align	2
	.global	updateInventory
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInventory, %function
updateInventory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L118
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, r3
	mov	r9, r3
	mov	r10, r3
	ldr	r2, .L118+4
	ldr	r0, .L118+8
	ldr	r4, [r2, #4]
	ldrh	r0, [r0]
	ldr	r1, .L118+12
	sub	r4, r4, r0
	ldrh	ip, [r1]
	and	r4, r4, #255
	ldr	r1, [r2]
	strh	r4, [fp, #-32]!	@ movhi
	strh	r4, [r3]	@ movhi
	ldr	r4, .L118+16
	sub	r1, r1, ip
	and	r1, r1, r4
	orr	r1, r1, #32768
	strh	r1, [fp, #2]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	r1, [r2, #28]
	sub	r1, r1, r0
	and	r1, r1, #255
	strh	r1, [r9, #-40]!	@ movhi
	strh	r1, [r10, #-8]!	@ movhi
	mov	r1, #1632	@ movhi
	mov	r8, r3
	mov	r7, r3
	mov	r6, r3
	mov	r5, r3
	mov	lr, #0
	strh	r1, [r3, #-28]	@ movhi
	ldr	r1, .L118+20
	strh	r1, [r3, #-36]	@ movhi
	add	r1, r1, #4
	strh	r1, [r3, #-44]	@ movhi
	ldr	r1, [r2, #24]
	sub	r1, r1, ip
	and	r1, r1, r4
	orr	r1, r1, #32768
	strh	r1, [r9, #2]	@ movhi
	strh	r1, [r10, #2]	@ movhi
	ldr	r1, [r2, #52]
	sub	r1, r1, r0
	and	r1, r1, #255
	strh	r1, [r8, #-16]!	@ movhi
	strh	r1, [r7, #-48]!	@ movhi
	ldr	r1, [r2, #76]
	sub	r1, r1, r0
	and	r1, r1, #255
	strh	r1, [r6, #-24]!	@ movhi
	strh	r1, [r5, #-56]!	@ movhi
	ldr	r9, [r2, #48]
	ldr	r1, [r2, #72]
	sub	r9, r9, ip
	sub	r1, r1, ip
	and	r9, r9, r4
	and	r4, r4, r1
	orr	r4, r4, #32768
	ldr	r1, .L118+24
	strh	r4, [r6, #2]	@ movhi
	ldr	r6, .L118+28
	orr	r9, r9, #32768
	strh	r1, [r3, #4]	@ movhi
	strh	r1, [r3, #-4]	@ movhi
	strh	r1, [r3, #-12]	@ movhi
	strh	r9, [r8, #2]	@ movhi
	strh	r9, [r7, #2]	@ movhi
	strh	r1, [r3, #-20]	@ movhi
	ldrh	r1, [r6]
	strh	r4, [r5, #2]	@ movhi
	ldr	r4, .L118+32
	ldr	r5, .L118+36
	tst	r1, #1
	strh	r4, [r3, #-52]	@ movhi
	str	lr, [r2, #20]
	str	lr, [r2, #44]
	str	lr, [r2, #68]
	str	lr, [r2, #92]
	ldr	r4, [r5]
	beq	.L95
	ldr	r3, .L118+40
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L116
.L95:
	tst	r1, #2
	beq	.L97
	ldr	r3, .L118+40
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L117
.L97:
	ldr	r3, .L118+4
	mov	r5, #1
	mov	r2, r3
	add	r1, r3, #96
.L100:
	ldr	lr, [r2, #16]
	cmp	lr, r4
	streq	r5, [r2, #20]
	add	r2, r2, #24
	cmp	r1, r2
	bne	.L100
	ldr	r4, .L118+44
	mov	r5, r4
	mov	r6, #0
	ldrh	r7, [r5, #4]!
	ldrh	fp, [r4]
	ldrh	lr, [r4, #2]
	ldr	r10, .L118+16
	ldr	r9, .L118+48
	ldr	r8, .L118+52
.L102:
	ldr	r2, [r3, #20]
	cmp	r2, #1
	bne	.L101
	mov	r7, r8
	mov	r6, r2
	ldm	r3, {r2, fp}
	sub	r2, r2, ip
	and	r2, r2, r10
	and	lr, r9, #32768
	sub	fp, fp, r0
	orr	lr, lr, r2
	and	fp, fp, #255
.L101:
	add	r3, r3, #24
	cmp	r3, r1
	bne	.L102
	cmp	r6, #0
	strhne	fp, [r4]	@ movhi
	strhne	lr, [r4, #2]	@ movhi
	strhne	r7, [r5]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	sub	r4, r4, #1
	cmp	r4, #0
	movle	r3, #4
	strgt	r4, [r5]
	movle	r4, r3
	strle	r3, [r5]
	b	.L97
.L116:
	add	r4, r4, #1
	cmp	r4, #4
	movgt	r3, #1
	strle	r4, [r5]
	movgt	r4, r3
	strgt	r3, [r5]
	b	.L95
.L119:
	.align	2
.L118:
	.word	shadowOAM+560
	.word	veggies
	.word	v1Off
	.word	h1Off
	.word	511
	.word	1636
	.word	1505
	.word	oldButtons
	.word	1644
	.word	selectVeggie
	.word	buttons
	.word	shadowOAM+496
	.word	-32768
	.word	486
	.size	updateInventory, .-updateInventory
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L166
	ldrh	r5, [r6]
	ldr	r4, .L166+4
	tst	r5, #64
	str	r3, [r4, #28]
	bne	.L121
	bl	canMoveUp
	cmp	r0, #0
	bne	.L163
.L121:
	ands	r7, r5, #128
	bne	.L122
	bl	canMoveDown
	cmp	r0, #0
	bne	.L164
.L122:
	tst	r5, #16
	and	r5, r5, #32
	bne	.L123
	bl	canMoveRight
	cmp	r0, #0
	beq	.L123
	mov	r1, #1
	mov	r2, #2
	ldr	r3, [r4]
	ldr	r0, [r4, #8]
	cmp	r5, #0
	add	r3, r3, r0
	str	r3, [r4]
	str	r1, [r4, #28]
	str	r2, [r4, #24]
	bne	.L125
	bl	canMoveLeft
	cmp	r0, #0
	beq	.L125
.L126:
	mov	r1, #1
	mov	r2, #3
	ldr	r3, [r4]
	ldr	r0, [r4, #8]
	sub	r3, r3, r0
	str	r3, [r4]
	str	r1, [r4, #28]
	str	r2, [r4, #24]
.L125:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r4, #32]
	bne	.L132
	ldr	r0, [r4, #36]
	ldr	r3, .L166+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r3, [r4, #32]
	ldr	r3, [r4]
	cmp	r3, #119
	str	r1, [r4, #36]
	ble	.L165
.L133:
	cmp	r3, #136
	movgt	r2, #16
	ldrgt	ip, .L166+12
	ldrle	ip, .L166+12
	suble	r2, r3, #120
	str	r2, [ip]
	ldr	r2, [r4, #4]
	cmp	r2, #79
	bgt	.L135
	mov	r3, #0
	ldr	r0, .L166+16
	str	r3, [r0]
.L139:
	cmp	r2, #0
	movlt	r3, #0
	movlt	r2, r3
	strlt	r3, [r4, #4]
	ldr	r3, [r4]
.L143:
	ldr	r1, [r4, #16]
	rsb	r1, r1, #256
	cmp	r1, r3
	ldr	r3, [r4, #20]
	rsb	r3, r3, #256
	strlt	r1, [r4]
	cmp	r3, r2
	strlt	r3, [r4, #4]
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L120
	ldr	r3, [ip]
	ldr	r2, [r4]
	sub	r2, r2, r3
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r4, #36]
	ldr	r3, [r4, #24]
	ldr	ip, .L166+20
	add	r3, r3, r1, lsl #5
	ldr	lr, [r0]
	ldr	r1, [r4, #4]
	ldr	ip, [ip]
	lsl	r3, r3, #2
	and	r3, r3, #1020
	ldr	r0, .L166+24
	sub	r1, r1, lr
	orr	r3, r3, ip, lsl #12
	and	r1, r1, #255
	orr	r3, r3, #3072
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
.L120:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L123:
	cmp	r5, #0
	beq	.L128
.L127:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	moveq	r2, #10
	streq	r3, [r4, #36]
	streq	r2, [r4, #32]
	bne	.L125
.L132:
	ldr	r3, [r4]
	cmp	r3, #119
	bgt	.L133
.L165:
	mov	r1, #0
	ldr	r2, [r4, #4]
	ldr	ip, .L166+12
	cmp	r2, #79
	str	r1, [ip]
	bgt	.L135
	ldr	r0, .L166+16
	cmp	r3, #0
	str	r1, [r0]
	bge	.L139
.L138:
	mov	r3, #0
	str	r3, [r4]
	b	.L139
.L135:
	cmp	r2, #176
	movgt	r1, #96
	ldrgt	r0, .L166+16
	ldrle	r0, .L166+16
	suble	r1, r2, #80
	cmp	r3, #0
	str	r1, [r0]
	bge	.L143
	b	.L138
.L128:
	bl	canMoveLeft
	cmp	r0, #0
	bne	.L126
	b	.L127
.L164:
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	add	r3, r3, r1
	str	r7, [r4, #24]
	str	r3, [r4, #4]
	str	r2, [r4, #28]
	b	.L122
.L163:
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	str	r2, [r4, #28]
	str	r2, [r4, #24]
	b	.L121
.L167:
	.align	2
.L166:
	.word	buttons
	.word	player
	.word	__aeabi_idivmod
	.word	hOff
	.word	vOff
	.word	paletteNum
	.word	shadowOAM+1008
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	incrementVeggieType
	.syntax unified
	.arm
	.fpu softvfp
	.type	incrementVeggieType, %function
incrementVeggieType:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L176
	ldr	r3, [r3]
	sub	r3, r3, #1
	str	lr, [sp, #-4]!
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L168
.L171:
	.word	.L174
	.word	.L173
	.word	.L172
	.word	.L170
.L170:
	mov	ip, #4
	ldr	r1, .L176+4
	ldr	r3, .L176+8
	ldr	r2, [r1]
	add	lr, r0, r0, lsl #1
	add	r0, r0, lr, lsl #2
	add	r2, r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [r1]
	str	ip, [r0, #44]
.L168:
	ldr	lr, [sp], #4
	bx	lr
.L174:
	mov	lr, #1
	ldr	ip, .L176+12
	add	r1, r0, r0, lsl lr
	ldr	r2, [ip]
	ldr	r3, .L176+8
	add	r0, r0, r1, lsl #2
	add	r2, r2, lr
	add	r0, r3, r0, lsl #2
	str	r2, [ip]
	str	lr, [r0, #44]
	ldr	lr, [sp], #4
	bx	lr
.L173:
	mov	lr, #2
	ldr	ip, .L176+16
	ldr	r3, .L176+8
	ldr	r2, [ip]
	add	r1, r0, r0, lsl #1
	add	r0, r0, r1, lsl lr
	add	r0, r3, r0, lsl lr
	add	r2, r2, #1
	str	r2, [ip]
	str	lr, [r0, #44]
	ldr	lr, [sp], #4
	bx	lr
.L172:
	mov	lr, #3
	ldr	ip, .L176+20
	ldr	r3, .L176+8
	ldr	r2, [ip]
	add	r1, r0, r0, lsl #1
	add	r0, r0, r1, lsl #2
	add	r2, r2, #1
	add	r0, r3, r0, lsl #2
	str	r2, [ip]
	str	lr, [r0, #44]
	ldr	lr, [sp], #4
	bx	lr
.L177:
	.align	2
.L176:
	.word	selectVeggie
	.word	tomatoCount
	.word	plotArea
	.word	carrotCount
	.word	cornCount
	.word	eggplantCount
	.size	incrementVeggieType, .-incrementVeggieType
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlot.part.0, %function
updatePlot.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #0
	ldr	r4, .L196
	ldr	r8, .L196+4
	ldr	fp, .L196+8
	ldr	r9, .L196+12
	ldr	r10, .L196+16
	sub	sp, sp, #20
	b	.L187
.L180:
	cmp	r5, #24
	beq	.L178
.L185:
	mov	r7, r5
	add	r4, r4, #52
.L187:
	ldr	r6, [r4, #40]
	cmp	r6, #0
	add	r5, r7, #1
	bne	.L180
	ldr	r2, [r8, #16]
	smull	r3, r0, fp, r2
	ldr	r1, [r4, #36]
	ldr	r3, [r4, #20]
	add	r1, r1, r1, lsr #31
	asr	r1, r1, #1
	ldr	ip, [r4, #32]
	str	r1, [sp, #12]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r4, #16]
	asr	r3, r3, #1
	stm	sp, {r1, ip}
	str	r3, [sp, #8]
	sub	r2, r0, r2, asr #31
	ldr	r3, [r8, #20]
	ldm	r8, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L180
	mov	r3, #1
	ldr	r2, .L196+20
	str	r3, [r4, #40]
	mov	lr, pc
	bx	r2
	mov	lr, #34
	ldm	r4, {r0, r3}
	ldr	ip, .L196+24
	add	r2, r0, r3, lsl #5
	lsl	r2, r2, #1
	strh	lr, [ip, r2]	@ movhi
	ldr	lr, [r4, #12]
	ldr	r2, [r4, #8]
	add	r0, r0, lr, lsl #5
	add	r3, r2, r3, lsl #5
	add	r2, r2, lr, lsl #5
	mov	lr, #35	@ movhi
	lsl	r3, r3, #1
	strh	lr, [ip, r3]	@ movhi
	mov	r1, #52
	mov	lr, #51	@ movhi
	mov	r3, #1
	lsl	r0, r0, #1
	lsl	r2, r2, #1
	strh	lr, [ip, r0]	@ movhi
	strh	r1, [ip, r2]	@ movhi
	ldr	r2, .L196+28
	mov	r0, r7
	str	r3, [r2]
	bl	incrementVeggieType
	ldr	r1, .L196+32
	ldr	r3, [r10]
	ldr	r2, [r1]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r10]
	beq	.L182
	add	r3, r1, #4
.L183:
	ldr	r2, [r3], #4
	cmp	r2, #0
	add	r6, r6, #1
	bne	.L183
.L182:
	cmp	r7, #0
	moveq	r3, #24
	streq	r3, [r1, r6, lsl #2]
	beq	.L185
	cmp	r5, #24
	str	r7, [r1, r6, lsl #2]
	bne	.L185
.L178:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L197:
	.align	2
.L196:
	.word	plotArea
	.word	player
	.word	1431655766
	.word	collision
	.word	totalPlanted
	.word	playPlantSound
	.word	100726784
	.word	modified
	.word	index
	.size	updatePlot.part.0, .-updatePlot.part.0
	.align	2
	.global	updatePlot
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlot, %function
updatePlot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L200
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	updatePlot.part.0
.L201:
	.align	2
.L200:
	.word	buttons
	.size	updatePlot, .-updatePlot
	.align	2
	.global	decrementVeggieReq
	.syntax unified
	.arm
	.fpu softvfp
	.type	decrementVeggieReq, %function
decrementVeggieReq:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L211
	add	r3, r0, r0, lsl #1
	add	r3, r0, r3, lsl #2
	add	r3, r2, r3, lsl #2
	ldr	r1, [r3, #44]
	sub	r1, r1, #1
	str	lr, [sp, #-4]!
	lsl	r3, r0, #1
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L202
.L205:
	.word	.L208
	.word	.L207
	.word	.L206
	.word	.L204
.L204:
	mov	lr, #0
	ldr	ip, .L211+4
.L210:
	ldr	r1, [ip]
	add	r3, r3, r0
	add	r0, r0, r3, lsl #2
	add	r0, r2, r0, lsl #2
	sub	r3, r1, #1
	str	lr, [r0, #44]
	str	r3, [ip]
.L202:
	ldr	lr, [sp], #4
	bx	lr
.L208:
	mov	lr, #0
	ldr	ip, .L211+8
	b	.L210
.L207:
	mov	lr, #0
	ldr	ip, .L211+12
	b	.L210
.L206:
	mov	lr, #0
	ldr	ip, .L211+16
	b	.L210
.L212:
	.align	2
.L211:
	.word	plotArea
	.word	tomatoCount
	.word	carrotCount
	.word	cornCount
	.word	eggplantCount
	.size	decrementVeggieReq, .-decrementVeggieReq
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #3
	ldr	r7, .L279
	rsb	r0, r0, r0, lsl r4
	mov	r3, r7
	mov	lr, #2
	mov	ip, #1
	mov	r1, #0
	sub	sp, sp, #28
	add	fp, r7, r0, lsl r4
	b	.L219
.L216:
	cmp	r2, #0
	bne	.L217
	ldr	r2, [r3]
	cmp	r2, #0
	strlt	ip, [r3, #28]
.L215:
	add	r3, r3, #56
	cmp	r3, fp
	beq	.L272
.L219:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L215
	ldr	r2, [r3, #28]
	cmp	r2, #1
	bne	.L216
	ldr	r2, [r3]
	ldr	r0, [r3, #16]
	add	r2, r2, r0
	cmp	r2, #256
	strgt	r1, [r3, #28]
	add	r3, r3, #56
	cmp	r3, fp
	bne	.L219
.L272:
	mov	r6, #10
	ldr	r4, .L279
	ldr	r5, .L279+4
	b	.L228
.L220:
	cmp	r3, #2
	bne	.L273
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	str	r3, [r4, #4]
.L221:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r4, #32]
	bne	.L227
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r5
	str	r6, [r4, #32]
	str	r1, [r4, #36]
.L227:
	add	r4, r4, #56
	cmp	r4, fp
	beq	.L274
.L228:
	ldr	r3, [r4, #28]
	cmp	r3, #3
	bne	.L220
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	b	.L221
.L217:
	cmp	r2, #3
	beq	.L275
	cmp	r2, #2
	bne	.L215
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #20]
	add	r2, r2, r0
	cmp	r2, #256
	strgt	r4, [r3, #28]
	b	.L215
.L273:
	cmp	r3, #0
	bne	.L276
	ldr	r3, [r4]
	ldr	r2, [r4, #8]
	sub	r3, r3, r2
	str	r3, [r4]
	b	.L221
.L276:
	cmp	r3, #1
	ldreq	r3, [r4]
	ldreq	r2, [r4, #8]
	addeq	r3, r3, r2
	streq	r3, [r4]
	b	.L221
.L274:
	mov	ip, #512
	ldr	r3, .L279+8
	ldr	r2, .L279+12
	ldrh	r5, [r3]
	ldrh	r6, [r2]
	ldr	r3, .L279
	ldr	r0, .L279+16
	ldr	r4, .L279+20
	ldr	lr, .L279+24
.L231:
	ldr	r2, [r3, #24]
	cmp	r2, #1
	ldr	r2, [r3, #44]
	lslne	r2, r2, #3
	strhne	ip, [r0, r2]	@ movhi
	bne	.L230
	ldr	r1, [r3, #28]
	ldr	r9, [r3, #36]
	ldr	r8, [r3]
	add	r1, r1, #4
	add	r1, r1, r9, lsl #5
	ldr	r9, [r3, #4]
	lsl	r1, r1, #2
	sub	r8, r8, r5
	and	r1, r1, #1020
	sub	r9, r9, r6
	and	r8, r8, r4
	add	r10, r0, r2, lsl #3
	orr	r1, r1, #3072
	lsl	r2, r2, #3
	and	r9, r9, #255
	orr	r8, r8, lr
	strh	r1, [r10, #4]	@ movhi
	strh	r9, [r0, r2]	@ movhi
	strh	r8, [r10, #2]	@ movhi
.L230:
	add	r3, r3, #56
	cmp	r3, fp
	bne	.L231
	mov	r8, #0
	ldr	r6, .L279
	ldr	r10, .L279+28
	ldr	r9, .L279+32
	str	r7, [sp, #20]
	str	fp, [sp, #16]
.L241:
	mov	r4, #0
	ldr	r5, .L279+36
	b	.L233
.L235:
	add	r4, r4, #1
	cmp	r4, #24
	add	r5, r5, #52
	beq	.L277
.L233:
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L235
	ldr	r0, [r6, #20]
	ldr	r1, [r6, #16]
	ldr	r2, [r6, #4]
	ldr	r3, [r6]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #36]
	ldr	r2, [r5, #20]
	ldr	r1, [r5, #32]
	ldr	r0, [r5, #16]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L235
	ldr	r2, .L279+40
	ldr	r3, [r2]
	mov	r0, r4
	sub	r3, r3, #1
	str	r8, [r5, #40]
	str	r3, [r2]
	bl	decrementVeggieReq
	ldr	r3, .L279+44
	mov	r1, r3
	add	r2, r3, #96
.L237:
	ldr	r0, [r1, #4]!
	cmp	r0, r4
	streq	r8, [r1]
	cmp	r2, r1
	bne	.L237
	mov	fp, #1
	mov	r7, #17
	ldm	r5, {r0, ip}
	ldr	r1, [r5, #8]
	add	lr, r0, ip, lsl #5
	add	ip, r1, ip, lsl #5
	lsl	ip, ip, fp
	lsl	lr, lr, fp
	strh	r8, [r9, lr]	@ movhi
	strh	fp, [r9, ip]	@ movhi
	ldr	ip, [r5, #12]
	add	r0, r0, ip, lsl #5
	lsl	r0, r0, fp
	strh	r7, [r9, r0]	@ movhi
	mov	r0, #18	@ movhi
	add	r1, r1, ip, lsl #5
	lsl	r1, r1, fp
	strh	r0, [r9, r1]	@ movhi
	b	.L240
.L238:
	cmp	r1, r4
	streq	r8, [r3]
.L239:
	cmp	r2, r3
	beq	.L235
.L240:
	ldr	r1, [r3, #4]!
	cmp	r1, #24
	bne	.L238
	cmp	r4, #0
	streq	r4, [r3]
	b	.L239
.L277:
	ldr	r3, [sp, #16]
	add	r6, r6, #56
	cmp	r6, r3
	bne	.L241
	mov	fp, r3
	mov	r8, #0
	ldr	r7, [sp, #20]
	ldr	r5, .L279+48
	ldr	r6, .L279+28
.L246:
	ldr	r4, .L279+52
	b	.L245
.L243:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L278
.L245:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L243
	ldr	r0, [r7, #20]
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r6
	add	r4, r4, #32
	cmp	r0, #0
	strne	r8, [r7, #24]
	cmp	r4, r5
	bne	.L245
.L278:
	add	r7, r7, #56
	cmp	r7, fp
	bne	.L246
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L275:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	strlt	lr, [r3, #28]
	b	.L215
.L280:
	.align	2
.L279:
	.word	enemies
	.word	__aeabi_idivmod
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	collision
	.word	100726784
	.word	plotArea
	.word	totalPlanted
	.word	index-4
	.word	fences+512
	.word	fences
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateFence
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFence, %function
updateFence:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L303
	ldr	r4, .L303+4
	ldr	r2, .L303+8
	sub	sp, sp, #28
	mov	r3, r4
	mov	fp, #3840
	str	r0, [sp, #20]
	ldrh	r9, [r1]
	ldrh	r8, [r2]
	ldr	ip, .L303+12
	ldr	r7, .L303+16
	ldr	r6, .L303+20
	ldr	r10, .L303+24
	add	r5, r4, #512
	b	.L284
.L302:
	ldr	r2, [r3]
	ldr	r1, [r3, #28]
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	and	r2, r2, r7
	sub	r2, r2, r8
	add	lr, ip, r1, lsl #3
	orr	r2, r2, r6
	lsl	r1, r1, #3
	sub	r0, r0, r9
	strh	r2, [lr, #2]	@ movhi
	strh	r10, [lr, #4]	@ movhi
	strh	r0, [ip, r1]	@ movhi
.L282:
	add	r3, r3, #32
	cmp	r3, r5
	beq	.L301
.L284:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L282
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L302
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L282
	ldr	r2, [r3]
	ldr	r1, [r3, #28]
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	and	r2, r2, r7
	sub	r2, r2, r8
	add	r3, r3, #32
	add	lr, ip, r1, lsl #3
	orr	r2, r2, r6
	lsl	r1, r1, #3
	sub	r0, r0, r9
	cmp	r3, r5
	strh	r2, [lr, #2]	@ movhi
	strh	fp, [lr, #4]	@ movhi
	strh	r0, [ip, r1]	@ movhi
	bne	.L284
.L301:
	ldr	r3, .L303+28
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L281
	ldr	r3, .L303+32
	ldrh	r3, [r3]
	tst	r3, #512
	bne	.L281
	mov	r9, #1
	ldr	r6, .L303+36
	ldr	r7, .L303+40
	ldr	r8, .L303+44
	ldr	r10, [sp, #20]
.L288:
	ldmib	r4, {r1, r2}
	ldr	r0, [r4, #12]
	ldr	r3, [r4]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L287
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L287
	ldr	r3, [r8]
	cmp	r3, r10
	addlt	r3, r3, #1
	strlt	r3, [r8]
	strlt	r9, [r4, #24]
.L287:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L288
.L281:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L304:
	.align	2
.L303:
	.word	vOff
	.word	fences
	.word	hOff
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	3845
	.word	oldButtons
	.word	buttons
	.word	player
	.word	collision
	.word	fenceNum
	.size	updateFence, .-updateFence
	.align	2
	.global	updateRequirements
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRequirements, %function
updateRequirements:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L323
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldrh	lr, [r3]
	ldr	r0, .L323+4
	rsb	ip, lr, #200
	and	ip, ip, r0
	mvn	ip, ip, lsl #17
	ldr	r6, .L323+8
	mov	r5, r6
	mov	r7, r6
	mov	r8, r6
	ldr	r2, .L323+12
	ldr	r3, .L323+16
	ldr	r4, [r2]
	ldr	r3, [r3]
	mvn	ip, ip, lsr #17
	sub	r4, r3, r4
	cmp	r3, #0
	cmpne	r3, r4
	ldr	r2, .L323+20
	ldrh	r1, [r2]
	add	r2, r3, #488
	add	r2, r2, #2
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	strh	r2, [r5, #20]!	@ movhi
	rsb	r2, r1, #10
	and	r2, r2, #255
	strh	r2, [r6]	@ movhi
	rsb	r2, r1, #18
	and	r2, r2, #255
	strh	r2, [r7, #8]!	@ movhi
	strh	r2, [r8, #16]!	@ movhi
	ldr	r2, .L323+24
	strh	r2, [r6, #4]	@ movhi
	sub	r2, r2, #109
	strh	ip, [r6, #2]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	rsb	ip, lr, #220
	rsb	r2, lr, #228
	and	ip, ip, r0
	and	r0, r0, r2
	strh	ip, [r7, #2]	@ movhi
	strh	r0, [r8, #2]	@ movhi
	ble	.L306
.L307:
	mov	r2, r3
	sub	r3, r3, #1
	cmp	r3, #0
	cmpne	r3, r4
	bgt	.L307
	add	r2, r2, #488
	add	r2, r2, #1
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	strh	r2, [r5]	@ movhi
.L306:
	ldr	r6, .L323+28
	ldr	r2, .L323+32
	ldr	r3, .L323+36
	mov	r5, r6
	ldr	r3, [r3]
	ldr	r4, [r2]
	mov	r7, r6
	mov	r8, r6
	sub	r4, r3, r4
	cmp	r3, #0
	cmpne	r3, r4
	add	r2, r3, #488
	add	r2, r2, #2
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	strh	r2, [r5, #20]!	@ movhi
	rsb	lr, lr, #192
	rsb	r9, r1, #37
	rsb	r2, r1, #29
	and	r9, r9, #255
	and	r2, r2, #255
	lsl	lr, lr, #23
	strh	r9, [r7, #8]!	@ movhi
	strh	r9, [r8, #16]!	@ movhi
	strh	r2, [r6]	@ movhi
	ldr	r9, .L323+40
	ldr	r2, .L323+44
	lsr	lr, lr, #23
	orr	lr, lr, #32768
	strh	lr, [r6, #2]	@ movhi
	strh	ip, [r7, #2]	@ movhi
	strh	r9, [r6, #4]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	strh	r0, [r8, #2]	@ movhi
	ble	.L308
.L309:
	mov	r2, r3
	sub	r3, r3, #1
	cmp	r3, #0
	cmpne	r3, r4
	bgt	.L309
	add	r2, r2, #488
	add	r2, r2, #1
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	strh	r2, [r5]	@ movhi
.L308:
	ldr	r3, .L323+48
	ldr	r2, [r3]
	subs	r3, r2, #1
	moveq	r9, #1
	movne	r9, #0
	ldr	r4, .L323+52
	ldr	r4, [r4]
	ldr	r6, .L323+56
	sub	r4, r2, r4
	cmp	r3, r4
	orrle	r9, r9, #1
	mov	r5, r6
	mov	r7, r6
	mov	r8, r6
	add	r2, r2, #488
	add	r2, r2, #2
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	strh	r2, [r5, #20]!	@ movhi
	cmp	r9, #0
	rsb	r2, r1, #48
	rsb	r9, r1, #56
	and	r9, r9, #255
	and	r2, r2, #255
	strh	r9, [r7, #8]!	@ movhi
	strh	r9, [r8, #16]!	@ movhi
	strh	r2, [r6]	@ movhi
	ldr	r9, .L323+60
	ldr	r2, .L323+44
	strh	lr, [r6, #2]	@ movhi
	strh	ip, [r7, #2]	@ movhi
	strh	r9, [r6, #4]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	strh	r0, [r8, #2]	@ movhi
	bne	.L310
.L311:
	mov	r2, r3
	sub	r3, r3, #1
	cmp	r3, #0
	cmpne	r3, r4
	bgt	.L311
	add	r2, r2, #488
	add	r2, r2, #1
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	orr	r2, r2, #1024
	strh	r2, [r5]	@ movhi
.L310:
	ldr	r3, .L323+64
	ldr	r2, [r3]
	subs	r3, r2, #1
	moveq	r9, #1
	movne	r9, #0
	ldr	r4, .L323+68
	ldr	r6, .L323+72
	ldr	r5, [r4]
	mov	r7, r6
	mov	r8, r6
	sub	r5, r2, r5
	mov	r4, r6
	cmp	r3, r5
	orrle	r9, r9, #1
	add	r2, r2, #488
	add	r2, r2, #2
	lsl	r2, r2, #22
	strh	lr, [r6, #2]	@ movhi
	lsr	r2, r2, #22
	rsb	lr, r1, #75
	rsb	r1, r1, #67
	orr	r2, r2, #1024
	and	lr, lr, #255
	and	r1, r1, #255
	strh	lr, [r7, #8]!	@ movhi
	strh	lr, [r8, #16]!	@ movhi
	strh	r2, [r4, #20]!	@ movhi
	strh	r1, [r6]	@ movhi
	ldr	r2, .L323+44
	ldr	r1, .L323+76
	cmp	r9, #0
	strh	ip, [r7, #2]	@ movhi
	strh	r1, [r6, #4]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	strh	r0, [r8, #2]	@ movhi
	bne	.L305
.L313:
	mov	r1, r3
	subs	r3, r3, #1
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r5
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	.L313
	add	r1, r1, #488
	add	r1, r1, #1
	lsl	r1, r1, #22
	lsr	r1, r1, #22
	orr	r1, r1, #1024
	strh	r1, [r4]	@ movhi
.L305:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L324:
	.align	2
.L323:
	.word	h1Off
	.word	511
	.word	shadowOAM+472
	.word	carrotCount
	.word	carrotR
	.word	v1Off
	.word	1633
	.word	shadowOAM+448
	.word	cornCount
	.word	cornR
	.word	1636
	.word	1524
	.word	eggplantR
	.word	eggplantCount
	.word	shadowOAM+424
	.word	1640
	.word	tomatoR
	.word	tomatoCount
	.word	shadowOAM+400
	.word	1644
	.size	updateRequirements, .-updateRequirements
	.align	2
	.global	saveTilemapModData
	.syntax unified
	.arm
	.fpu softvfp
	.type	saveTilemapModData, %function
saveTilemapModData:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #24
	moveq	r0, #0
	push	{r4, r5, r6, lr}
	mov	r6, #34
	mov	r4, #35
	mov	lr, #51
	mov	ip, #52
	ldr	r3, .L328
	add	r2, r0, r0, lsl #1
	add	r0, r0, r2, lsl #2
	add	r5, r3, r0, lsl #2
	ldr	r2, [r3, r0, lsl #2]
	ldr	r1, [r5, #4]
	ldr	r0, .L328+4
	add	r3, r2, r1, lsl #5
	lsl	r3, r3, #1
	strh	r6, [r0, r3]	@ movhi
	add	r3, r5, #8
	ldm	r3, {r3, r5}
	add	r1, r3, r1, lsl #5
	add	r2, r2, r5, lsl #5
	add	r3, r3, r5, lsl #5
	lsl	r1, r1, #1
	lsl	r2, r2, #1
	lsl	r3, r3, #1
	strh	r4, [r0, r1]	@ movhi
	strh	lr, [r0, r2]	@ movhi
	strh	ip, [r0, r3]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L329:
	.align	2
.L328:
	.word	plotArea
	.word	100726784
	.size	saveTilemapModData, .-saveTilemapModData
	.align	2
	.global	updateFenceLimit
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFenceLimit, %function
updateFenceLimit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, #1792
	ldr	r3, .L334
	ldr	r2, [r3]
	ldr	r3, .L334+4
	sub	r0, r0, r2
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	ldr	r2, .L334+8
	ldrh	ip, [r2]
	ldr	r4, .L334+12
	ldr	r2, .L334+16
	add	r3, r3, r3, lsl #2
	ldr	r6, .L334+20
	sub	r3, r0, r3, lsl #1
	cmp	r0, #9
	rsb	r0, ip, #220
	ldrh	r1, [r2]
	rsb	r5, ip, #190
	ldr	r2, .L334+24
	and	r0, r0, r4
	orr	r0, r0, r6
	add	r3, r3, #488
	and	r5, r5, r4
	orr	r5, r5, r6
	strh	r0, [r2, #154]	@ movhi
	add	r3, r3, #2
	rsb	r0, r1, #134
	and	r0, r0, #255
	strh	r5, [r2, #162]	@ movhi
	orr	r3, r3, #1024
	ldr	r5, .L334+28
	rsb	r1, r1, #142
	strh	r0, [r2, #160]	@ movhi
	lsl	r3, r3, #16
	and	r1, r1, #255
	rsb	r0, ip, #230
	strh	r1, [r2, #152]	@ movhi
	strh	lr, [r2, #164]	@ movhi
	strh	r5, [r2, #156]	@ movhi
	lsr	r3, r3, #16
	and	r0, r0, r4
	bgt	.L331
	mov	ip, #512
	strh	r1, [r2, #144]	@ movhi
	strh	r0, [r2, #146]	@ movhi
	strh	r3, [r2, #148]	@ movhi
	strh	ip, [r2, #136]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L331:
	ldr	lr, .L334+32
	rsb	ip, ip, #225
	and	ip, ip, r4
	strh	lr, [r2, #140]	@ movhi
	strh	ip, [r2, #138]	@ movhi
	strh	r1, [r2, #144]	@ movhi
	strh	r0, [r2, #146]	@ movhi
	strh	r3, [r2, #148]	@ movhi
	strh	r1, [r2, #136]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L335:
	.align	2
.L334:
	.word	fenceNum
	.word	1717986919
	.word	h1Off
	.word	511
	.word	v1Off
	.word	-32768
	.word	shadowOAM
	.word	1524
	.word	1515
	.size	updateFenceLimit, .-updateFenceLimit
	.align	2
	.global	updateGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame1, %function
updateGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r3, .L345
	ldrh	r3, [r3]
	tst	r3, #256
	ldr	r5, .L345+4
	beq	.L339
	ldrh	r3, [r5]
	tst	r3, #256
	beq	.L343
.L339:
	ldr	r4, .L345+8
	ldr	r0, [r4]
.L338:
	bl	updateFence
	bl	updateInventory
	ldrh	r3, [r5]
	tst	r3, #4
	bleq	updatePlot.part.0
.L340:
	ldr	r0, [r4]
	bl	updateFenceLimit
	ldr	r3, .L345+12
	ldr	r3, [r3]
	cmp	r3, #5
	bgt	.L344
	bl	LevelRequirement
	pop	{r4, r5, r6, lr}
	b	updateRequirements
.L343:
	mov	r3, #16
	ldr	r4, .L345+8
	mov	r0, r3
	str	r3, [r4]
	b	.L338
.L344:
	ldr	r3, .L345+16
	ldr	r0, [r3]
	bl	updateEnemy
	bl	LevelRequirement
	pop	{r4, r5, r6, lr}
	b	updateRequirements
.L346:
	.align	2
.L345:
	.word	oldButtons
	.word	buttons
	.word	level1FenceNum
	.word	second
	.word	level1EnemyNum
	.size	updateGame1, .-updateGame1
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r3, .L356
	ldrh	r3, [r3]
	tst	r3, #256
	ldr	r5, .L356+4
	beq	.L350
	ldrh	r3, [r5]
	tst	r3, #256
	beq	.L354
.L350:
	ldr	r4, .L356+8
	ldr	r0, [r4]
.L349:
	bl	updateFence
	bl	updateInventory
	ldrh	r3, [r5]
	tst	r3, #4
	bleq	updatePlot.part.0
.L351:
	ldr	r0, [r4]
	bl	updateFenceLimit
	ldr	r3, .L356+12
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L355
	bl	LevelRequirement
	pop	{r4, r5, r6, lr}
	b	updateRequirements
.L354:
	mov	r3, #16
	ldr	r4, .L356+8
	mov	r0, r3
	str	r3, [r4]
	b	.L349
.L355:
	ldr	r3, .L356+16
	ldr	r0, [r3]
	bl	updateEnemy
	bl	LevelRequirement
	pop	{r4, r5, r6, lr}
	b	updateRequirements
.L357:
	.align	2
.L356:
	.word	oldButtons
	.word	buttons
	.word	level2FenceNum
	.word	second
	.word	level2EnemyNum
	.size	updateGame2, .-updateGame2
	.align	2
	.global	updateGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame3, %function
updateGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r3, .L367
	ldrh	r3, [r3]
	tst	r3, #256
	ldr	r5, .L367+4
	beq	.L361
	ldrh	r3, [r5]
	tst	r3, #256
	beq	.L365
.L361:
	ldr	r4, .L367+8
	ldr	r0, [r4]
.L360:
	bl	updateFence
	bl	updateInventory
	ldrh	r3, [r5]
	tst	r3, #4
	bleq	updatePlot.part.0
.L362:
	ldr	r3, .L367+12
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L366
.L363:
	ldr	r0, [r4]
	bl	updateFenceLimit
	bl	LevelRequirement
	pop	{r4, r5, r6, lr}
	b	updateRequirements
.L365:
	mov	r3, #16
	ldr	r4, .L367+8
	mov	r0, r3
	str	r3, [r4]
	b	.L360
.L366:
	ldr	r3, .L367+16
	ldr	r0, [r3]
	bl	updateEnemy
	b	.L363
.L368:
	.align	2
.L367:
	.word	oldButtons
	.word	buttons
	.word	level3FenceNum
	.word	second
	.word	level3EnemyNum
	.size	updateGame3, .-updateGame3
	.align	2
	.global	stopTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopTimer, %function
stopTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L370
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	bx	lr
.L371:
	.align	2
.L370:
	.word	67109120
	.size	stopTimer, .-stopTimer
	.align	2
	.global	startTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	startTimer, %function
startTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #195
	mov	r2, #196
	ldr	r3, .L373
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	bx	lr
.L374:
	.align	2
.L373:
	.word	67109120
	.size	startTimer, .-startTimer
	.comm	selectVeggie,4,4
	.comm	fenceNum,4,4
	.comm	paletteNum,4,4
	.comm	cornR,4,4
	.comm	eggplantR,4,4
	.comm	tomatoR,4,4
	.comm	carrotR,4,4
	.comm	index,96,4
	.comm	modified,4,4
	.comm	level3EnemyNum,4,4
	.comm	level3FenceNum,4,4
	.comm	level2EnemyNum,4,4
	.comm	level2FenceNum,4,4
	.comm	level1EnemyNum,4,4
	.comm	level1FenceNum,4,4
	.comm	horizontalFences,4,4
	.comm	verticalFences,4,4
	.comm	metRequirement,4,4
	.comm	totalPlanted,4,4
	.comm	eggplantCount,4,4
	.comm	tomatoCount,4,4
	.comm	cornCount,4,4
	.comm	carrotCount,4,4
	.comm	player,52,4
	.comm	second,4,4
	.comm	minute,4,4
	.comm	v1Off,4,4
	.comm	h1Off,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shadowOAM,1024,4
	.comm	collisionMap,4,4
	.comm	songs,120,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	enemies,784,4
	.comm	fences,512,4
	.comm	plotArea,1248,4
	.comm	veggies,96,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
