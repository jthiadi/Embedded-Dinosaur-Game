#include <8051.h>
#include "cooperative.h"

/*
 * [TODO]
 * declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */

__data __at (0x30) char saved_SP[MAXTHREADS];
__data __at (0x34) ThreadID current_thread;
__data __at (0x35) char valid_thread;
__data __at (0x36) ThreadID new_thread;
__data __at (0x37) char old_SP;

/*
 * [TODO]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
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

/*
 * [TODO]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
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
   }     

/*
 * we declare main() as an extern so we can reference its symbol
 * when creating a thread for it.
 */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void)
{
   // [todo] initialize data structures for threads
	valid_thread = 0x00; // initialize: gaada yg aktif awalnya threadnya

   // [todo] create thread for main, current thread is set to thread ID so that it runs in main()
	 current_thread = ThreadCreate(main);  // bkin thread buat main, kasi thread ID (dia setup stack buat main, jadi thread bs jump ke main)
	 RESTORESTATE;                         // restore the context
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp)
{
   // [todo] return -1 (not valid thread ID) if we have reached the max threads
   if (valid_thread == 0xF) return -1; 

   // [todo] find thread id that is not in use, grab it (can check bit mask for threads)
      /*
         a. update the bit mask
         (and increment thread count, if you use a thread count,
         but it is optional)
         b. calculate the starting stack location for new thread
         set SP to the starting location for the new thread
      */
   new_thread = 3; 
   for (int i = 0; i < MAXTHREADS; i++) {
      if (!(valid_thread & (1 << i))) {
         new_thread = i;
         break;
      }
   }

   valid_thread |= (1 << new_thread);


   // [todo] save the current SP in a temporary
   old_SP = SP;
   SP = (0x3A) + (new_thread * 8);

      /*        d. push the return address fp (2-byte parameter to
            ThreadCreate) onto stack so it can be the return
            address to resume the thread. Note that in SDCC
            convention, 2-byte ptr is passed in DPTR.  but
            push instruction can only push it as two separate
            registers, DPL and DPH.
         e. we want to initialize the registers to 0, so we
            assign a register to 0 and push it four times
            for ACC, B, DPL, DPH.  Note: push #0 will not work
            because push takes only direct address as its operand,
            but it does not take an immediate (literal) operand.*/

      // [todo]
   __asm
      PUSH DPL    // push DPL sm DPH biar return fp
      PUSH DPH
      MOV A, #0   // set A ke 0 trus push biar registers semua jdi 0
      PUSH A      // ACC
      PUSH A      // B
      PUSH A      // DPL
      PUSH A      // DPH
   __endasm;

      /*
            f. finally, we need to push PSW (processor status word)
            register, which consist of bits
            CY AC F0 RS1 RS0 OV UD P
            all bits can be initialized to zero, except <RS1:RS0>
            which selects the register bank.
            Thread 0 uses bank 0, Thread 1 uses bank 1, etc.
            Setting the bits to 00B, 01B, 10B, 11B will select
            the register bank so no need to push/pop registers
            R0-R7.  So, set PSW to
            00000000B for thread 0, 00001000B for thread 1,
            00010000B for thread 2, 00011000B for thread 3.*/

   // 00000000B for thread 0 (0 << 3)
   // 00001000B for thread 1 (1 << 3)
   // 00010000B for thread 2 (2 << 3)
   // 00011000B for thread 3 (3 << 3)
   PSW = (new_thread << 3);

   __asm
      PUSH PSW      
   __endasm;
         
   saved_SP[new_thread] = SP; // [todo] write current stack pointer to saved stack for newly created thread id
   SP = old_SP;               // [todo] set SP to saved SP
   return new_thread;         // [todo] return newly created thread ID
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void)
{
   SAVESTATE;
    do
    {
        /*
         * [TODO]
         * do round-robin policy for now.
         * find the next thread that can run and
         * set the current thread ID to it,
         * so that it can be restored (by the last line of
         * this function).
         * there should be at least one thread, so this loop
         * will always terminate.
         */
		
      // check next thread until ktemu yg valid   
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
}

/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void)
{
    /*
     * clear the bit for the current thread from the
     * bit mask, decrement thread count (if any),
     * and set current thread to another valid ID.
     * Q: What happens if there are no more valid threads?
     */
	
   valid_thread &= ~(1 << current_thread);   // mark current thread as inactive 

   do {
      // move to next thread round robin policy
	   if (current_thread == 3) current_thread = 0;
		else current_thread += 1;
  } while (!(valid_thread & (1 << current_thread))); // keep looping until valid thread is found
     
   RESTORESTATE;
}
