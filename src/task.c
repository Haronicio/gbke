#include "task.h"

// static uint8_t task_number = 0;

struct task_t tasks[NBTASK];

struct task_t * current_task_p = NULL;
const struct task_t * first_task_p = &tasks[0];
const struct task_t * last_task_p = &tasks[NBTASK];

uint8_t task_number = 0;

struct task_t * create_task(enum task_type_e type,uint8_t period,void(* init)(void),void(* update)(void))
{
    //mode JSF
    /*
    foreach_task()
    {

    }
    */

    //mode fifo
    struct task_t * new_task = &tasks[task_number]; 

    if(new_task >= last_task_p)
    {
        raise_error(ESIZE,0xFF,"cannot create task");
        return NULL;  //should be check
    }
    //normalement impossible car task_numer toujours vrai (sauf ISR)
    if(tasks[task_number].task_id != 0)
    {
        raise_error(ESIZE,0xFF,"cannot overwrite task");
        return NULL;  //should be check
    }

    //vérifier s'il n'est pas utilisé 

    new_task->task_type = type;
    new_task->task_id = task_number;
    new_task->task_period = period;
    new_task->init_task_f = init;
    new_task->update_task_f = update;

    task_number++;

    return new_task;
}

void destroy_task(struct task_t * task)
{
    if(task == current_task_p)
    {
        raise_error(EPERM,current_task_p->task_id,"cannot destroy this task");
        return;
    }

    uint8_t task_id = task->task_id;
    
    memset((void *)task,0,sizeof(struct task_t));
    // memmove((void *)&tasks[task_id],(void *)&tasks[task_id+1],sizeof(struct task_t)); //dépend de l'approche de la mémoire
    //ID identifie aussi la case mémoire ou 

    // task = NULL;

    --task_number;
}