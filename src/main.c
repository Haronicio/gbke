#include <gb/gb.h>
#include <gb/cgb.h>
#include <gbdk/emu_debug.h>
#include <stdint.h>
#include <stdio.h>

#include "task.h"
#include "error.h"

void main(void)
{
    raise_error(ENONE,0xFF,"Hello World !");
    // printf("Hello World !\n");
    // EMU_printf("Hello World ! bitch");

    /*simple task test*/

    //create task and free
    struct task_t * task_0 = create_task(Event,0,NULL,NULL);

    if(!task_0)
        raise_error(EASSERT,0xFF,"task0 !");
    if(task_number != 1)
        raise_error(EASSERT,0xFF,"task_number !");
    destroy_task(task_0);
    if(task_number != 0)
        raise_error(EASSERT,0xFF,"task_number 2!");

    //create a bunch of task
    struct task_t * t;
    uint8_t i = 0;
    foreach_task(t)
    {
        if(!create_task(Event,0,NULL,NULL))
            raise_error(EASSERT,0xFF,"bunch of task !");
    }
    char buff[32];
    foreach_task(t)
    {
        sprintf(buff,"task id : %d",t->task_id);
        raise_error(ENONE,0xFF,buff);
    }
    //test to much task
    if(create_task(Event,0,NULL,NULL))
            raise_error(EASSERT,0xFF,"to much task !");
    //test illegal task creation 
    task_number--;
    if(create_task(Event,0,NULL,NULL))
            raise_error(EASSERT,0xFF,"overwrite task !");
    task_number++;
    //test illegal destroy
    current_task_p = &tasks[0];
    destroy_task(current_task_p);
    if(task_number != 32)
        raise_error(EASSERT,0xFF,"illegal destroy !");

    foreach_task(t)
    {
        destroy_task(t);
    }

    // Loop forever
    
    while(1) {

		// Game main loop processing goes here


		// Done processing, yield CPU and wait for start of next frame
        wait_vbl_done();
    }
}
