#ifndef _ERROR_H
#define _ERROR_H

#include <gb/gb.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <gbdk/emu_debug.h>

/*
* error is a collection of debug msg basic function, that keep information from last error raised.
* this exist beacause GB should not stop on a error but you need to see where is the prblm.
* stdio.h so does not include in the final ROM build (only for sprintf)
*/

/* define error values */

#define ENONE 0x0       /*No Error*/
#define EVALUE 0x1      /*Wrong excepted value*/
#define ESIZE 0x2       /*Not enoug space*/
#define EPERM 0x3       /*Operation not permitted*/
#define EASSERT 0xF     /*Assert fail*/


//who value
//error global value
//set error irq ????

// void init_error

/**
 * @brief display in debug console "<who> raised <error> : <how>
 * 
 * @param error error number will be raised
 * @param who   where in the code or in wich task the error occure
 * @param how   complementary information about error
 */
void raise_error(uint8_t error,uint8_t who,/*const*/ char * how);

/* Translate error infomrations */
//plus tard quand il y aura plsuieurs processus jouant sur plusieurs taches

#endif // _ERROR_H
