/* 
author: jbenet
os x, compile with: gcc -o testo test.c 
linux, compile with: gcc -o testo test.c -lrt
*/

#include <time.h>
#include <sys/time.h>
#include <stdio.h>

#ifdef __MACH__
#include <mach/clock.h>
#include <mach/mach.h>
#endif

void current_utc_tim(struct timespec *ts);