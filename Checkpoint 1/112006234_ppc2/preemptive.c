#include <8051.h>
#include "preemptive.h"

__data __at (0x30) char saved_SP[MAXTHREADS];
__data __at (0x34) ThreadID current_thread;
__data __at (0x35) char valid_thread;
__data __at (0x36) ThreadID new_thread;
__data __at (0x37) char old_SP;

#define SAVESTATE    \
   {                 \
      __asm          \
         PUSH ACC    \
         PUSH B      \
         PUSH DPL    \
         PUSH DPH    \
         PUSH PSW    \
      __endasm;      \
      saved_SP[current_thread] = SP; \
   }                 

#define RESTORESTATE    \
   {                    \
      SP = saved_SP[current_thread]; \
      __asm             \
         POP PSW        \
         POP DPH        \
         POP DPL        \
         POP B          \
         POP ACC        \
      __endasm;         \
   }                    \


extern void main(void);

void Bootstrap(void)
{
	TMOD = 0;  		// timer 0 mode 0
	IE = 0x82;  	// enable timer 0 interrupt; keep consumer polling
				 	   // EA  -  ET2  ES  ET1  EX1  ET0  EX0
	TR0 = 1; 		// set bit TR0 to start running timer 0

   valid_thread = 0x00;

   current_thread = ThreadCreate(main);
   RESTORESTATE;
}

ThreadID ThreadCreate(FunctionPtr fp)
{
   EA = 0;
   if (valid_thread == 0xF) return -1; 

   new_thread = 3; 
   for (int i = 0; i < MAXTHREADS; i++) {
      if (!(valid_thread & (1 << i))) {
         new_thread = i;
         break;
      }
   }

   valid_thread |= (1 << new_thread);
   
   old_SP = SP;
   SP = (0x3A) + (new_thread * 8);

   __asm
      PUSH DPL
      PUSH DPH
      CLR A
      PUSH ACC
      PUSH ACC
      PUSH ACC
      PUSH ACC
   __endasm;
   
   PSW = (new_thread << 3);

   __asm
      PUSH PSW      
   __endasm;

   saved_SP[new_thread] = SP;
   SP = old_SP;

   EA = 1;
   return new_thread;
}

void ThreadYield(void)
{
   EA = 0;
   SAVESTATE;
   do {
      current_thread = (current_thread + 1) & 3;

      if ((current_thread == 0 && (valid_thread & 0x01)) ||
         (current_thread == 1 && (valid_thread & 0x02)) ||
         (current_thread == 2 && (valid_thread & 0x04)) ||
         (current_thread == 3 && (valid_thread & 0x08))) {
         goto found;
      }
   } while (1);  

found:
    RESTORESTATE;
    EA = 1;
}

void ThreadExit(void)
{
   __critical{
		valid_thread &= ~(1 << current_thread);

		do {
			if (current_thread == 3) current_thread = 0;
			else current_thread += 1;
		} while (!(valid_thread & (1 << current_thread)));

		RESTORESTATE;
	}
}

void myTimer0Handler(void)
{
   EA = 0;
   SAVESTATE;

   do {
      current_thread = (current_thread + 1) & 3;

      if ((current_thread == 0 && (valid_thread & 0x01)) ||
         (current_thread == 1 && (valid_thread & 0x02)) ||
         (current_thread == 2 && (valid_thread & 0x04)) ||
         (current_thread == 3 && (valid_thread & 0x08))) {
         goto found;
      }
   } while (1);

   found:
      RESTORESTATE;
      EA = 1;

      __asm
         RETI
      __endasm;
}