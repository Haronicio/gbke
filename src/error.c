#include "error.h"

/* private error informations */

static uint8_t who_error;
static uint8_t error_num;

void raise_error(uint8_t error,uint8_t who,char * how)
{
    //à optimisé

    who_error = who;
    error_num = error;

    // char buff[255];

    //check <how> to truncate

    //sprintf(buff,"%d raised %d : %s",who,error,how);
    EMU_printf("%d raised %d : %s",who,error,how);
}