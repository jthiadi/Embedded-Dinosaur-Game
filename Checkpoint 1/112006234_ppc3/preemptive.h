#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);

#define CNAME(S) _ ## S
#define LABEL(label) label ## $

#define SemaphoreCreate(S, n) S = n; 

#define SemaphoreSignal(S)  \
    __asm                   \
        INC CNAME(S)        \
    __endasm;               \

#define SemaphoreWaitBody(S, label)     \
    __asm                               \
        LABEL(label): MOV A, CNAME(S)   \
                      JZ LABEL(label)   \
                      DEC CNAME(S)      \
    __endasm;                           \
    
#define SemaphoreWait(S)                    \
        SemaphoreWaitBody(S, __COUNTER__)   \

#endif