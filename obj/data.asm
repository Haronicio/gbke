;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module data
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _last_data_p
	.globl _task_datas
	.globl _init_flags
	.globl _set_flag
	.globl _clear_flag
	.globl _is_flag_set
	.globl _is_any_flag_set
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$task_datas$0_0$0==.
_task_datas::
	.ds 992
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$last_data_p$0_0$0==.
_last_data_p::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$init_flags$0$0	= .
	.globl	G$init_flags$0$0
	C$data.c$10$0_0$116	= .
	.globl	C$data.c$10$0_0$116
;src/data.c:10: inline void init_flags(FLAG_T *flags) {
;	---------------------------------
; Function init_flags
; ---------------------------------
_init_flags::
	C$data.c$11$1_0$116	= .
	.globl	C$data.c$11$1_0$116
;src/data.c:11: *flags = 0;
	xor	a, a
	ld	(de), a
	inc	de
	ld	(de), a
	C$data.c$12$1_0$116	= .
	.globl	C$data.c$12$1_0$116
;src/data.c:12: }
	C$data.c$12$1_0$116	= .
	.globl	C$data.c$12$1_0$116
	XG$init_flags$0$0	= .
	.globl	XG$init_flags$0$0
	ret
	G$set_flag$0$0	= .
	.globl	G$set_flag$0$0
	C$data.c$15$1_0$118	= .
	.globl	C$data.c$15$1_0$118
;src/data.c:15: inline void set_flag(FLAG_T *flags, uint8_t index) {
;	---------------------------------
; Function set_flag
; ---------------------------------
_set_flag::
	push	de
	ld	b, a
	C$data.c$16$1_0$118	= .
	.globl	C$data.c$16$1_0$118
;src/data.c:16: *flags |= (1 << index);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	hl, #0x0001
	inc	b
	jr	00104$
00103$:
	add	hl, hl
00104$:
	dec	b
	jr	NZ,00103$
	push	af
	ld	a, c
	or	a, l
	ld	c, a
	pop	af
	or	a, h
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$data.c$17$1_0$118	= .
	.globl	C$data.c$17$1_0$118
;src/data.c:17: }
	inc	sp
	inc	sp
	C$data.c$17$1_0$118	= .
	.globl	C$data.c$17$1_0$118
	XG$set_flag$0$0	= .
	.globl	XG$set_flag$0$0
	ret
	G$clear_flag$0$0	= .
	.globl	G$clear_flag$0$0
	C$data.c$20$1_0$120	= .
	.globl	C$data.c$20$1_0$120
;src/data.c:20: inline void clear_flag(FLAG_T *flags, uint8_t index) {
;	---------------------------------
; Function clear_flag
; ---------------------------------
_clear_flag::
	push	de
	ld	b, a
	C$data.c$21$1_0$120	= .
	.globl	C$data.c$21$1_0$120
;src/data.c:21: *flags &= ~(1 << index);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	hl, #0x0001
	inc	b
	jr	00104$
00103$:
	add	hl, hl
00104$:
	dec	b
	jr	NZ,00103$
	push	af
	ld	a, l
	cpl
	ld	e, a
	ld	a, h
	cpl
	ld	d, a
	ld	a, c
	and	a, e
	ld	c, a
	pop	af
	and	a, d
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$data.c$22$1_0$120	= .
	.globl	C$data.c$22$1_0$120
;src/data.c:22: }
	inc	sp
	inc	sp
	C$data.c$22$1_0$120	= .
	.globl	C$data.c$22$1_0$120
	XG$clear_flag$0$0	= .
	.globl	XG$clear_flag$0$0
	ret
	G$is_flag_set$0$0	= .
	.globl	G$is_flag_set$0$0
	C$data.c$25$1_0$122	= .
	.globl	C$data.c$25$1_0$122
;src/data.c:25: inline _Bool is_flag_set(FLAG_T *flags, uint8_t index) {
;	---------------------------------
; Function is_flag_set
; ---------------------------------
_is_flag_set::
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	ld	c, a
	C$data.c$26$1_0$122	= .
	.globl	C$data.c$26$1_0$122
;src/data.c:26: return (*flags & (1 << index)) != 0;
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	ld	b, #0x00
	inc	c
	jr	00104$
00103$:
	add	a, a
	rl	b
00104$:
	dec	c
	jr	NZ,00103$
	and	a, l
	ld	c, a
	ld	a, b
	and	a, h
	or	a, c
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	C$data.c$27$1_0$122	= .
	.globl	C$data.c$27$1_0$122
;src/data.c:27: }
	C$data.c$27$1_0$122	= .
	.globl	C$data.c$27$1_0$122
	XG$is_flag_set$0$0	= .
	.globl	XG$is_flag_set$0$0
	ret
	G$is_any_flag_set$0$0	= .
	.globl	G$is_any_flag_set$0$0
	C$data.c$30$1_0$124	= .
	.globl	C$data.c$30$1_0$124
;src/data.c:30: inline _Bool is_any_flag_set(FLAG_T *flags) {
;	---------------------------------
; Function is_any_flag_set
; ---------------------------------
_is_any_flag_set::
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	C$data.c$31$1_0$124	= .
	.globl	C$data.c$31$1_0$124
;src/data.c:31: return (*flags != 0);
	ld	a, (hl+)
	or	a,(hl)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	C$data.c$32$1_0$124	= .
	.globl	C$data.c$32$1_0$124
;src/data.c:32: }
	C$data.c$32$1_0$124	= .
	.globl	C$data.c$32$1_0$124
	XG$is_any_flag_set$0$0	= .
	.globl	XG$is_any_flag_set$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fdata$__xinit_last_data_p$0_0$0 == .
__xinit__last_data_p:
	.dw (_task_datas + 992)
	.area _CABS (ABS)
