#include "data.h"

struct data_t task_datas[NBTDATA];

const struct data_t * last_data_p = &task_datas[NBTDATA];

#define MAX_DATA_SIZE 32

// Initialisation des flags
inline void init_flags(FLAG_T *flags) {
    *flags = 0;
}

// Définition d'un flag à l'indice spécifié
inline void set_flag(FLAG_T *flags, uint8_t index) {
    *flags |= (1 << index);
}

// Suppression du flag à l'indice spécifié
inline void clear_flag(FLAG_T *flags, uint8_t index) {
    *flags &= ~(1 << index);
}

// Vérification si le flag à l'indice spécifié est défini
inline _Bool is_flag_set(FLAG_T *flags, uint8_t index) {
    return (*flags & (1 << index)) != 0;
}

// Vérification si au moins un flag est défini
inline _Bool is_any_flag_set(FLAG_T *flags) {
    return (*flags != 0);
}

// Vérification si tous les flags sont définis
// inline _Bool are_all_flags_set(FLAG_T *flags) {
//     return (*flags == ((1 << MAXNBDATA) - 1));
// }

struct data_t * _create_data(struct data_t * data,uint8_t index)
{

    //mode FiFo

    //vérifier l'index

}
