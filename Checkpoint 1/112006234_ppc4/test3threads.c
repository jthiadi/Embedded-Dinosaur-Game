#include <8051.h>
#include "preemptive.h"

__data __at (0x20) char mutex;
__data __at (0x21) char full;
__data __at (0x22) char empty;
__data __at (0x23) char read;
__data __at (0x24) char write;
__data __at (0x25) char next_char1;
__data __at (0x26) char next_char2;
__data __at (0x27) char bounded_buffer[3];
__data __at (0x38) char dir;

void Producer1(void) 
{
        next_char1 = 'A';
        while(1) {
                SemaphoreWait(empty);
                SemaphoreWait(mutex);

                EA = 0;
                bounded_buffer[write] = next_char1;
                if (write == 2) write = 0;
                else write++;
                EA = 1;

                SemaphoreSignal(mutex);
                SemaphoreSignal(full);

                if (next_char1 == 'Z') next_char1 = 'A';
                else next_char1++;
        }
}

void Producer2(void)
{
        next_char2 = '0';
        while(1)
        {
                SemaphoreWait(empty);
                SemaphoreWait(mutex);
                
                EA = 0;
                bounded_buffer[write] = next_char2;
                if (write == 2) write = 0;
                else write++;
                EA = 1;
        
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                
                if (next_char2 == '9') next_char2 = '0';
                else next_char2++;
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

void main(void)
{       
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(full, 0);
        SemaphoreCreate(empty, 3);
        write = 0;
        read = 0;
        dir = 1;

        ThreadCreate(Producer1);
        ThreadCreate(Producer2);
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