#ifndef _TASK_H 
#define _TASK_H

#include <gb/gb.h>
#include <stdint.h>
#include <string.h>

#include "error.h"
#include "data.h"

#define NBTASK 32

#define TS_STOP 0x0
#define TS_RUN 0x1
#define TS_ZOMBIE 0x2

#define Bits_state(taskid) taskid >> 6

//peut être pas nécessaire de faire une enum : prend de la place supplémentaire en mémoire
/**
 * @brief   task type enumeration indicate a kind of task assosciate to is priority :
 *              Event : scripting event (such as periodic event or variables survey)
 *              GBObject : GB Harware ressources manipulation (such as sprites)
 *              Input :  input (such as joypad)
 *              Ouput : output (such as audio or serial)
 */
enum task_type_e
{
    Event,GBObject,Input,Output
};

/**
 * @brief   structure and tab of tasks : software representation of routines executed
 *          in a process
 * 
 */
typedef struct task_t
{
    void(* init_task_f)(void);  /*task init function*/
    void(* update_task_f)(void);/*task update routine*/
    uint8_t task_id;             /*bit 7-6 task state bit 5-O id in table tasks*/
    uint8_t task_period;
    uint8_t data_len;

    enum task_type_e task_type;
};

extern struct task_t tasks[NBTASK];

extern uint8_t task_number;

extern struct task_t * current_task_p;
extern const struct task_t * first_task_p;
extern const struct task_t * last_task_p;
 

#define foreach_task(tmp_task_p) for(tmp_task_p = &tasks[0]; tmp_task_p < last_task_p ; ++tmp_task_p)

//pour le moment on part du principe que une tache ne peut ni créé ni détruire une autre, le processus a le controle
//(sinon changer raise, la manière dont une tache voit les autres en mémoire ...)
struct task_t * create_task(enum task_type_e type,uint8_t period,void(*init)(void),void(*update)(void));
void destroy_task(struct task_t *);


// inline uint8_t get_task_id(struct task_t * task)
// {
//     return task->task_id;
// }



#endif // _TASK_H

