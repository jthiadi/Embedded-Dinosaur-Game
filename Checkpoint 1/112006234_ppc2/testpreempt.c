 #include <8051.h>
 #include "preemptive.h"
 
  __data __at (0x21) char full;
  __data __at (0x25) char next_char;
  __data __at (0x27) char shared_buffer;

 void Producer(void)
 {
    next_char = 'A';
    while (1)
     {
         while(full);
         EA = 0;                
         shared_buffer = next_char;
         full = 1;
         EA = 1;
         
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
     while (1) {
         while (full == 0);
         EA = 0;
         SBUF = shared_buffer;
         full = 0;
         EA = 1;          
         
         while(TI == 0); 
         TI = 0;
     }
 }
 
 void main(void)
 {
      shared_buffer = '\0';
      next_char = 'A';
      full = 0;
      ThreadCreate(Producer);
      Consumer();
 }
 
 void _sdcc_gsinit_startup(void) {
     __asm
        LJMP  _Bootstrap
     __endasm;
 }
 
 void _mcs51_genRAMCLEAR(void) {}
 void _mcs51_genXINIT(void) {}
 void _mcs51_genXRAMCLEAR(void) {}
 
 void timer0_ISR(void) __interrupt(1) {
     __asm
        LJMP _myTimer0Handler
     __endasm;
 }	
         