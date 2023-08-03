;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _destroy_task
	.globl _create_task
	.globl _raise_error
	.globl _sprintf
	.globl _wait_vbl_done
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
Fmain$__EMU_PROFILER_INIT$0_0$0==.
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$10$0_0$133	= .
	.globl	C$main.c$10$0_0$133
;src/main.c:10: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-32
	C$main.c$12$1_0$133	= .
	.globl	C$main.c$12$1_0$133
;src/main.c:12: raise_error(ENONE,0xFF,"Hello World !");
	ld	de, #___str_0
	push	de
	ld	e, #0xff
	xor	a, a
	call	_raise_error
	C$main.c$19$1_1$134	= .
	.globl	C$main.c$19$1_1$134
;src/main.c:19: struct task_t * task_0 = create_task(Event,0,NULL,NULL);
	ld	de, #0x0000
	push	de
	push	de
	xor	a, a
	ld	e, a
	call	_create_task
	ld	e, c
	C$main.c$21$1_1$134	= .
	.globl	C$main.c$21$1_1$134
;src/main.c:21: if(!task_0)
	ld	a,b
	ld	d,a
	or	a, c
	jr	NZ, 00102$
	C$main.c$22$1_1$134	= .
	.globl	C$main.c$22$1_1$134
;src/main.c:22: raise_error(EASSERT,0xFF,"task0 !");
	push	de
	ld	bc, #___str_1
	push	bc
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
	pop	de
00102$:
	C$main.c$23$1_1$134	= .
	.globl	C$main.c$23$1_1$134
;src/main.c:23: if(task_number != 1)
	ld	a, (#_task_number)
	dec	a
	jr	Z, 00104$
	C$main.c$24$1_1$134	= .
	.globl	C$main.c$24$1_1$134
;src/main.c:24: raise_error(EASSERT,0xFF,"task_number !");
	push	de
	ld	bc, #___str_2
	push	bc
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
	pop	de
00104$:
	C$main.c$25$1_1$134	= .
	.globl	C$main.c$25$1_1$134
;src/main.c:25: destroy_task(task_0);
	call	_destroy_task
	C$main.c$26$1_1$134	= .
	.globl	C$main.c$26$1_1$134
;src/main.c:26: if(task_number != 0)
	ld	a, (#_task_number)
	or	a, a
	jr	Z, 00106$
	C$main.c$27$1_1$134	= .
	.globl	C$main.c$27$1_1$134
;src/main.c:27: raise_error(EASSERT,0xFF,"task_number 2!");
	ld	de, #___str_3
	push	de
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
00106$:
	C$main.c$32$2_2$136	= .
	.globl	C$main.c$32$2_2$136
;src/main.c:32: foreach_task(t)
	ld	bc, #_tasks
00122$:
	ld	hl, #_last_task_p
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00109$
	C$main.c$34$3_2$137	= .
	.globl	C$main.c$34$3_2$137
;src/main.c:34: if(!create_task(Event,0,NULL,NULL))
	push	bc
	ld	de, #0x0000
	push	de
	push	de
	xor	a, a
	ld	e, a
	call	_create_task
	ld	e, c
	ld	d, b
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00123$
	C$main.c$35$3_2$137	= .
	.globl	C$main.c$35$3_2$137
;src/main.c:35: raise_error(EASSERT,0xFF,"bunch of task !");
	push	bc
	ld	de, #___str_4
	push	de
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
	pop	bc
00123$:
	C$main.c$32$2_2$136	= .
	.globl	C$main.c$32$2_2$136
;src/main.c:32: foreach_task(t)
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	jr	00122$
00109$:
	C$main.c$38$2_3$139	= .
	.globl	C$main.c$38$2_3$139
;src/main.c:38: foreach_task(t)
	ld	bc, #_tasks
00125$:
	ld	hl, #_last_task_p
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00110$
	C$main.c$40$3_3$140	= .
	.globl	C$main.c$40$3_3$140
;src/main.c:40: sprintf(buff,"task id : %d",t->task_id);
	ld	hl, #0x0004
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	push	bc
	push	de
	ld	de, #___str_5
	push	de
	push	hl
	call	_sprintf
	add	sp, #6
	pop	bc
	C$main.c$41$3_3$140	= .
	.globl	C$main.c$41$3_3$140
;src/main.c:41: raise_error(ENONE,0xFF,buff);
	ld	hl, #0
	add	hl, sp
	push	bc
	push	hl
	ld	e, #0xff
	xor	a, a
	call	_raise_error
	pop	bc
	C$main.c$38$2_3$139	= .
	.globl	C$main.c$38$2_3$139
;src/main.c:38: foreach_task(t)
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	jr	00125$
00110$:
	C$main.c$44$1_3$138	= .
	.globl	C$main.c$44$1_3$138
;src/main.c:44: if(create_task(Event,0,NULL,NULL))
	ld	de, #0x0000
	push	de
	push	de
	xor	a, a
	ld	e, a
	call	_create_task
	ld	a, b
	or	a, c
	jr	Z, 00112$
	C$main.c$45$1_3$138	= .
	.globl	C$main.c$45$1_3$138
;src/main.c:45: raise_error(EASSERT,0xFF,"to much task !");
	ld	de, #___str_6
	push	de
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
00112$:
	C$main.c$47$1_3$138	= .
	.globl	C$main.c$47$1_3$138
;src/main.c:47: task_number--;
	ld	hl, #_task_number
	dec	(hl)
	C$main.c$48$1_3$138	= .
	.globl	C$main.c$48$1_3$138
;src/main.c:48: if(create_task(Event,0,NULL,NULL))
	ld	de, #0x0000
	push	de
	push	de
	xor	a, a
	ld	e, a
	call	_create_task
	ld	a, b
	or	a, c
	jr	Z, 00114$
	C$main.c$49$1_3$138	= .
	.globl	C$main.c$49$1_3$138
;src/main.c:49: raise_error(EASSERT,0xFF,"overwrite task !");
	ld	de, #___str_7
	push	de
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
00114$:
	C$main.c$50$1_3$138	= .
	.globl	C$main.c$50$1_3$138
;src/main.c:50: task_number++;
	ld	hl, #_task_number
	inc	(hl)
	C$main.c$52$1_3$138	= .
	.globl	C$main.c$52$1_3$138
;src/main.c:52: current_task_p = &tasks[0];
	ld	hl, #_current_task_p
	ld	a, #<(_tasks)
	ld	(hl+), a
	C$main.c$53$1_3$138	= .
	.globl	C$main.c$53$1_3$138
;src/main.c:53: destroy_task(current_task_p);
	ld	a, #>(_tasks)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_destroy_task
	C$main.c$54$1_3$138	= .
	.globl	C$main.c$54$1_3$138
;src/main.c:54: if(task_number != 32)
	ld	a, (#_task_number)
	sub	a, #0x20
	jr	Z, 00116$
	C$main.c$55$1_3$138	= .
	.globl	C$main.c$55$1_3$138
;src/main.c:55: raise_error(EASSERT,0xFF,"illegal destroy !");
	ld	de, #___str_8
	push	de
	ld	e, #0xff
	ld	a, #0x0f
	call	_raise_error
00116$:
	C$main.c$57$2_3$141	= .
	.globl	C$main.c$57$2_3$141
;src/main.c:57: foreach_task(t)
	ld	bc, #_tasks
00128$:
	ld	hl, #_last_task_p
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00119$
	C$main.c$59$3_3$142	= .
	.globl	C$main.c$59$3_3$142
;src/main.c:59: destroy_task(t);
	push	bc
	ld	e, c
	ld	d, b
	call	_destroy_task
	pop	bc
	C$main.c$57$2_3$141	= .
	.globl	C$main.c$57$2_3$141
;src/main.c:57: foreach_task(t)
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	jr	00128$
	C$main.c$64$1_3$138	= .
	.globl	C$main.c$64$1_3$138
;src/main.c:64: while(1) {
00119$:
	C$main.c$70$2_3$143	= .
	.globl	C$main.c$70$2_3$143
;src/main.c:70: wait_vbl_done();
	call	_wait_vbl_done
	jr	00119$
	C$main.c$72$1_3$133	= .
	.globl	C$main.c$72$1_3$133
;src/main.c:72: }
	add	sp, #32
	C$main.c$72$1_3$133	= .
	.globl	C$main.c$72$1_3$133
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
Fmain$__str_0$0_0$0 == .
___str_0:
	.ascii "Hello World !"
	.db 0x00
Fmain$__str_1$0_0$0 == .
___str_1:
	.ascii "task0 !"
	.db 0x00
Fmain$__str_2$0_0$0 == .
___str_2:
	.ascii "task_number !"
	.db 0x00
Fmain$__str_3$0_0$0 == .
___str_3:
	.ascii "task_number 2!"
	.db 0x00
Fmain$__str_4$0_0$0 == .
___str_4:
	.ascii "bunch of task !"
	.db 0x00
Fmain$__str_5$0_0$0 == .
___str_5:
	.ascii "task id : %d"
	.db 0x00
Fmain$__str_6$0_0$0 == .
___str_6:
	.ascii "to much task !"
	.db 0x00
Fmain$__str_7$0_0$0 == .
___str_7:
	.ascii "overwrite task !"
	.db 0x00
Fmain$__str_8$0_0$0 == .
___str_8:
	.ascii "illegal destroy !"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
Fmain$__xinit___EMU_PROFILER_INIT$0_0$0 == .
__xinit____EMU_PROFILER_INIT:
	.dw _EMU_profiler_message
	.area _CABS (ABS)
