#include <8051.h>
#include "preemptive.h"

__data __at (0x20) char mutex;
__data __at (0x21) char full;
__data __at (0x22) char empty;
__data __at (0x23) char read;
__data __at (0x24) char write;
__data __at (0x25) char next_char;
__data __at (0x26) char bounded_buffer[3];

void Producer(void) {
    next_char = 'A';
    while (1) {
        SemaphoreWait(empty); // semaphore dri notes
        SemaphoreWait(mutex);
        
        EA = 0;
        bounded_buffer[write] = next_char;
        if (write == 2) write = 0;
        else write++;
        EA = 1;
        
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);

        if (next_char == 'Z') next_char = 'A';
        else next_char++;
    }       
}

void Consumer(void) 
{
        TMOD |= 0x20;
        TH1 = 0xFA;
        SCON = 0x50;
        TR1 = 1;

        while (1)
        {
                SemaphoreWait(full);
                SemaphoreWait(mutex);

                EA = 0;
                SBUF = bounded_buffer[read];
                if (read == 2) read = 0;
                else read++;
                EA = 1;

                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);
                
                while(TI == 0); 
                TI = 0;
        }
}

void main(void) {
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(full, 0);
        SemaphoreCreate(empty, 3);
        bounded_buffer[0] = ' ';
        bounded_buffer[1] = ' ';
        bounded_buffer[2] = ' ';
        read = 0;

        ThreadCreate(Producer);
        Consumer();
}

void _sdcc_gsinit_startup(void) 
{
        __asm
                LJMP  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1)
{
        __asm
                LJMP _myTimer0Handler
        __endasm;
}