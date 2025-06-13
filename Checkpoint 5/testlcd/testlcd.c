#include <8051.h>
#include "preemptive.h"
#include "buttonlib.h"
#include "keylib.h"
#include "lcdlib.h"

__data __at (0x20) char mutex;
__data __at (0x21) char full;
__data __at (0x22) char empty;
__data __at (0x23) char read;
__data __at (0x24) char write;
__data __at (0x25) char button_in;
__data __at (0x26) char key_in;
__data __at (0x27) char bounded_buffer[3];
__data __at (0x2B) char output_char;
__data __at (0x38) char dir;

void Producer1(void)
{
        button_in = 0;
        while(1) {
            while(AnyButtonPressed() == 0);
            EA = 0;
            button_in = ButtonToChar();
            EA = 1;

            SemaphoreWait(empty);
            SemaphoreWait(mutex);

            bounded_buffer[write] = button_in;
            if (write == 2) write = 0;
            else write++;

            SemaphoreSignal(mutex);
            SemaphoreSignal(full);
            while (AnyButtonPressed());
        }
}

void Producer2(void)
{
        key_in = 0;
        while (1)
        {
            while (AnyKeyPressed() == 0);
            EA = 0;
            key_in = KeyToChar();
            EA = 1;

            SemaphoreWait(empty);
            SemaphoreWait(mutex);

            bounded_buffer[write] = key_in;
            if (write == 2) write = 0;
            else write++;

            SemaphoreSignal(mutex);
            SemaphoreSignal(full);
            while (AnyKeyPressed());
        }
}

void Consumer(void)
{
        while (1)
        {
            SemaphoreWait(full);
            SemaphoreWait(mutex);

            output_char = bounded_buffer[read];

            SemaphoreSignal(mutex);
            SemaphoreSignal(empty);
            
            if (read == 2) read = 0;
            else read++;
            
            LCD_write_char(output_char);
            while (LCD_ready() == 0);
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

        Init_Keypad();
        LCD_Init();

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