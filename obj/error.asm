;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module error
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EMU_printf
	.globl _raise_error
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
Ferror$who_error$0_0$0==.
_who_error:
	.ds 1
Ferror$error_num$0_0$0==.
_error_num:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
Ferror$__EMU_PROFILER_INIT$0_0$0==.
___EMU_PROFILER_INIT:
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
	G$raise_error$0$0	= .
	.globl	G$raise_error$0$0
	C$error.c$8$0_0$118	= .
	.globl	C$error.c$8$0_0$118
;src/error.c:8: void raise_error(uint8_t error,uint8_t who,char * how)
;	---------------------------------
; Function raise_error
; ---------------------------------
_raise_error::
	ld	c, a
	C$error.c$12$1_0$118	= .
	.globl	C$error.c$12$1_0$118
;src/error.c:12: who_error = who;
	ld	hl, #_who_error
	ld	(hl), e
	C$error.c$13$1_0$118	= .
	.globl	C$error.c$13$1_0$118
;src/error.c:13: error_num = error;
	ld	hl, #_error_num
	ld	(hl), c
	C$error.c$20$1_0$118	= .
	.globl	C$error.c$20$1_0$118
;src/error.c:20: EMU_printf("%d raised %d : %s",who,error,how);
	ld	b, #0x00
	ld	d, b
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	bc
	push	de
	ld	de, #___str_0
	push	de
	call	_EMU_printf
	add	sp, #8
	C$error.c$21$1_0$118	= .
	.globl	C$error.c$21$1_0$118
;src/error.c:21: }
	pop	hl
	pop	af
	jp	(hl)
Ferror$__str_0$0_0$0 == .
___str_0:
	.ascii "%d raised %d : %s"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
Ferror$__xinit___EMU_PROFILER_INIT$0_0$0 == .
__xinit____EMU_PROFILER_INIT:
	.dw _EMU_profiler_message
	.area _CABS (ABS)
