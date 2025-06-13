#
# makefile for testing cooperative multithreading
#
# This assumes you have SDCC installed and this targets EdSim51.
# The generated .hex file should be one that can be loaded and run
# directly.
#
# Author: Pai Chou
# CS 3423 Fall 2018
#

CC = sdcc
CFLAGS = -c --model-small
LDFLAGS = 
OBJ = preemptive.rel lcdlib.rel buttonlib.rel keylib.rel

# @@@ substitute the following recepe into `all: testlcd.hex dino.hex` when you are doing part 2 of this checkpoint
all: testlcd.hex

testlcd.hex: testlcd.rel $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $<

%.rel: %.c preemptive.h Makefile
	$(CC) $(CFLAGS) $<

clean:
	rm -f *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym
