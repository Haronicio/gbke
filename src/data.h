#ifndef _DATA_H
#define _DATA_H

#include <gb/gb.h>
#include <stdint.h>
#include <string.h>
#include <types.h>
#include <stdbool.h>
// #include <stdatomic.h>

#define NBTDATA 32 //how many task data (one per task)
#define DFLTNBDATA 4  //default number of data you can allocate
#define MAXNBDATA 16 //number of data per task max
#define FLAG_T uint_fast16_t

// l'implémentation peut être couteuse (pour les flags) si une tache à moins de 4 datas (par rapport au tableau d'atomic)
//cependant chaque data en plus est gratuite dans la mémoire !
typedef struct data_t
{
    uint8_t * data;
    //on pourrait augmenter la granularité pour économiser (beaucoup) de mémoire cependant
    //il y a un risque d'interblocage 
    // atomic_flag * flags[NBTDATA-1];         /*flag for each data to share for each task*/ 
    FLAG_T * flags[NBTDATA-1];
    struct data_t * shared[NBTDATA-1];      /*One pointer to each task's datas*/
    // uint_fast32_t private_data;
};

extern struct data_t task_datas[NBTDATA];

extern const struct data_t * last_data_p;


inline void init_flags(FLAG_T *flags);
inline void set_flag(FLAG_T *flags, uint8_t index);
inline void clear_flag(FLAG_T *flags, uint8_t index);
inline bool is_flag_set(FLAG_T *flags, uint8_t index);
inline bool is_any_flag_set(FLAG_T *flags);
// inline bool are_all_flags_set(FLAG_T *flags);

struct data_t * _create_data(struct data_t * data,uint8_t index);
struct data_t * _add_shared_data(struct data_t * data,struct data_t * shared_data);
void _destroy_data(struct data_t * data,uint8_t index);

#endif