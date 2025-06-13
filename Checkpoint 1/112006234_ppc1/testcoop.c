/*
 * file: testcoop.c
 */
 #include <8051.h>
 #include "cooperative.h"
 
 /*
  * [TODO]
  * declare your global variables here, for the shared buffer
  * between the producer and consumer.
  * Hint: you may want to manually designate the location for the
  * variable.  you can use
  *        __data __at (0x30) type var;
  * to declare a variable var of the type
  */
  __data __at (0x25) char next_char;
  __data __at (0x27) char shared_buffer;

 /* [TODO] for this function
  * the producer in this test program generates one characters at a
  * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
  * must be empty in order for the Producer to write.
  */
 void Producer(void)
 {
      // [todo] initialize producer data structure, then enter infinite loop
    next_char = 'A';
    while (1)
     {
          // [todo] wait for buffer to be available  (pas buffer ga kosong yield ke customer)
          do {
            ThreadYield(); 
          } while (shared_buffer != '\0');
                
          // [todo] write new data into buffer (pas buffer kosong write data)
          shared_buffer = next_char;
          if (next_char == 'Z') next_char = 'A';
          else next_char++;          
     }
 }
 
 /* [TODO for this function]
  * the consumer in this test program gets the next item from
  * the queue and consume it and writes it to the serial port.
  * The Consumer also does not return.
  */
 void Consumer(void)
 {
     /*
      * [TODO]
      * initialize Tx for polling
      */
      TMOD = 0x20;
      TH1 = 0xFA;
      SCON = 0x50;
      TR1 = 1;
     while (1)
     {
 
         /*
          * [TODO]
          * write data to serial port Tx,
          * poll for Tx to finish writing (TI),
          * then clear the flag
          */
        
          // [todo] wait for new data from producer (pas buffer kosong kasi yield ke producer buat write)
          do {
            ThreadYield(); 
          } while (shared_buffer == '\0');
          
          // [todo] write data to serial port Tx, poll for TX to finish writing (TI), then clear flag (pas ga kosong baca data trus didisplay)
          SBUF = shared_buffer; // ini mulai transmission
          shared_buffer = '\0'; // kosongin buffer biar producer bisa write next char
          
          while(TI == 0) ThreadYield(); // 8051 bkl set TI = 1 pas kelar transmission, jdi yield ke producer selama belom
          TI = 0;
     }
 }
 
 /* [TODO for this function]
  * main() is started by the thread bootstrapper as thread-0.
  * It can create more thread(s) as needed:
  * one thread can act as producer and another as consumer.
  */
 void main(void)
 {
      // [todo] initialize globals
      shared_buffer = '\0';
      next_char = 'A';
      // [todo] set up producer and consumer
      ThreadCreate(Producer);
      Consumer();
 }
 
 void _sdcc_gsinit_startup(void)
 {
     __asm
         LJMP _Bootstrap
     __endasm;
 }
 
 void _mcs51_genRAMCLEAR(void) {}
 void _mcs51_genXINIT(void) {}
 void _mcs51_genXRAMCLEAR(void) {}