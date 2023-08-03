;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module task
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _raise_error
	.globl _memset
	.globl _task_number
	.globl _last_task_p
	.globl _first_task_p
	.globl _current_task_p
	.globl _tasks
	.globl _create_task
	.globl _destroy_task
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$tasks$0_0$0==.
_tasks::
	.ds 224
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
Ftask$__EMU_PROFILER_INIT$0_0$0==.
___EMU_PROFILER_INIT:
	.ds 2
G$current_task_p$0_0$0==.
_current_task_p::
	.ds 2
G$first_task_p$0_0$0==.
_first_task_p::
	.ds 2
G$last_task_p$0_0$0==.
_last_task_p::
	.ds 2
G$task_number$0_0$0==.
_task_number::
	.ds 1
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
	G$create_task$0$0	= .
	.globl	G$create_task$0$0
	C$task.c$13$0_0$131	= .
	.globl	C$task.c$13$0_0$131
;src/task.c:13: struct task_t * create_task(enum task_type_e type,uint8_t period,void(* init)(void),void(* update)(void))
;	---------------------------------
; Function create_task
; ---------------------------------
_create_task::
	add	sp, #-4
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	C$task.c$24$1_0$131	= .
	.globl	C$task.c$24$1_0$131
;src/task.c:24: struct task_t * new_task = &tasks[task_number]; 
	ld	hl, #_task_number
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_tasks
	add	hl,bc
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
	C$task.c$26$1_0$131	= .
	.globl	C$task.c$26$1_0$131
;src/task.c:26: if(new_task >= last_task_p)
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ld	hl, #_last_task_p
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00102$
	C$task.c$28$2_0$132	= .
	.globl	C$task.c$28$2_0$132
;src/task.c:28: raise_error(ESIZE,0xFF,"cannot create task");
	ld	de, #___str_0
	push	de
	ld	e, #0xff
	ld	a, #0x02
	call	_raise_error
	C$task.c$29$2_0$132	= .
	.globl	C$task.c$29$2_0$132
;src/task.c:29: return NULL;  //should be check
	ld	bc, #0x0000
	jr	00105$
00102$:
	C$task.c$32$1_0$131	= .
	.globl	C$task.c$32$1_0$131
;src/task.c:32: if(tasks[task_number].task_id != 0)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	or	a, a
	jr	Z, 00104$
	C$task.c$34$2_0$133	= .
	.globl	C$task.c$34$2_0$133
;src/task.c:34: raise_error(ESIZE,0xFF,"cannot overwrite task");
	ld	de, #___str_1
	push	de
	ld	e, #0xff
	ld	a, #0x02
	call	_raise_error
	C$task.c$35$2_0$133	= .
	.globl	C$task.c$35$2_0$133
;src/task.c:35: return NULL;  //should be check
	ld	bc, #0x0000
	jr	00105$
00104$:
	C$task.c$38$1_0$131	= .
	.globl	C$task.c$38$1_0$131
;src/task.c:38: new_task->task_type = type;
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
	C$task.c$39$1_0$131	= .
	.globl	C$task.c$39$1_0$131
;src/task.c:39: new_task->task_id = task_number;
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (#_task_number)
	ld	(bc), a
	C$task.c$40$1_0$131	= .
	.globl	C$task.c$40$1_0$131
;src/task.c:40: new_task->task_period = period;
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
	C$task.c$41$1_0$131	= .
	.globl	C$task.c$41$1_0$131
;src/task.c:41: new_task->init_task_f = init;
	pop	de
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(de), a
	inc	de
	C$task.c$42$1_0$131	= .
	.globl	C$task.c$42$1_0$131
;src/task.c:42: new_task->update_task_f = update;
	ld	a, (hl+)
	ld	(de), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$task.c$44$1_0$131	= .
	.globl	C$task.c$44$1_0$131
;src/task.c:44: task_number++;
	ld	hl, #_task_number
	inc	(hl)
	C$task.c$46$1_0$131	= .
	.globl	C$task.c$46$1_0$131
;src/task.c:46: return new_task;
	pop	bc
	push	bc
00105$:
	C$task.c$47$1_0$131	= .
	.globl	C$task.c$47$1_0$131
;src/task.c:47: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
Ftask$__str_0$0_0$0 == .
___str_0:
	.ascii "cannot create task"
	.db 0x00
Ftask$__str_1$0_0$0 == .
___str_1:
	.ascii "cannot overwrite task"
	.db 0x00
	G$destroy_task$0$0	= .
	.globl	G$destroy_task$0$0
	C$task.c$49$1_0$135	= .
	.globl	C$task.c$49$1_0$135
;src/task.c:49: void destroy_task(struct task_t * task)
;	---------------------------------
; Function destroy_task
; ---------------------------------
_destroy_task::
	C$task.c$51$1_0$135	= .
	.globl	C$task.c$51$1_0$135
;src/task.c:51: if(task == current_task_p)
	ld	hl, #_current_task_p
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00102$
	C$task.c$53$2_0$136	= .
	.globl	C$task.c$53$2_0$136
;src/task.c:53: raise_error(EPERM,current_task_p->task_id,"cannot destroy this task");
	ld	bc, #___str_2+0
	ld	hl, #_current_task_p
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, (hl)
	push	bc
	ld	a, #0x03
	call	_raise_error
	C$task.c$54$2_0$136	= .
	.globl	C$task.c$54$2_0$136
;src/task.c:54: return;
	ret
00102$:
	C$task.c$59$1_1$137	= .
	.globl	C$task.c$59$1_1$137
;src/task.c:59: memset((void *)task,0,sizeof(struct task_t));
	ld	bc, #0x0007
	push	bc
	ld	bc, #0x0000
	push	bc
	push	de
	call	_memset
	add	sp, #6
	C$task.c$65$1_1$137	= .
	.globl	C$task.c$65$1_1$137
;src/task.c:65: --task_number;
	ld	hl, #_task_number
	dec	(hl)
	C$task.c$66$1_1$135	= .
	.globl	C$task.c$66$1_1$135
;src/task.c:66: }
	C$task.c$66$1_1$135	= .
	.globl	C$task.c$66$1_1$135
	XG$destroy_task$0$0	= .
	.globl	XG$destroy_task$0$0
	ret
Ftask$__str_2$0_0$0 == .
___str_2:
	.ascii "cannot destroy this task"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
Ftask$__xinit___EMU_PROFILER_INIT$0_0$0 == .
__xinit____EMU_PROFILER_INIT:
	.dw _EMU_profiler_message
Ftask$__xinit_current_task_p$0_0$0 == .
__xinit__current_task_p:
	.dw #0x0000
Ftask$__xinit_first_task_p$0_0$0 == .
__xinit__first_task_p:
	.dw (_tasks + 0)
Ftask$__xinit_last_task_p$0_0$0 == .
__xinit__last_task_p:
	.dw (_tasks + 224)
Ftask$__xinit_task_number$0_0$0 == .
__xinit__task_number:
	.db #0x00	; 0
	.area _CABS (ABS)
