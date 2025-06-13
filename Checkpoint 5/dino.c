#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "lcdlib.h"

__data __at (0x20) char pressed_key;
__data __at (0x21) char dino_position;
__data __at (0x22) unsigned char game_start;
__data __at (0x23) unsigned char game_over;
__data __at (0x24) unsigned char score;
__data __at (0x25) unsigned char map_top[2];
__data __at (0x27) unsigned char map_btm[2];
__data __at (0x29) unsigned char time;
__data __at (0x2A) unsigned char carry_bit;
__data __at (0x2B) unsigned char mask;
__data __at (0x2C) unsigned char game_speed;
__data __at (0x2D) unsigned char cactus_timer;
__data __at (0x2E) unsigned char last_cactus_row;

const char dinosaur[] = {0x07, 0x05, 0x06, 0x07, 0x14, 0x17, 0x0E, 0x0A};
const char cactus[] = {0x04, 0x05, 0x15, 0x15, 0x16, 0x0C, 0x04, 0x04};

const unsigned char cactus_patterns[] = {
    1,  // top
    0,  
    2,  // btm
    0,  
    1,  
    0,  
    2,  
};

void keypad_ctrl(void)
{
    while (1){
        while (AnyKeyPressed() == 0);
        EA = 0;
        pressed_key = KeyToChar();
        EA = 1;

        if (pressed_key == '2') {
        EA = 0;                           
            if(dino_position == 1) {
                if(map_top[0] & 0x80) {
                    game_over = 1;
                    ThreadYield();
                }
                
                dino_position = 0;
                LCD_cursorGoTo(1, 0);
                LCD_write_char(' ');
                LCD_cursorGoTo(0, 0);
                LCD_write_char('\1');               
            }
        }
        EA = 1;

        if(pressed_key == '8'){
        EA = 0;
            if(dino_position == 0){
                if(map_btm[0] & 0x80){
                    game_over = 1;
                    ThreadYield();
                }
            
                dino_position = 1;
                LCD_cursorGoTo(0, 0);
                LCD_write_char(' ');
                LCD_cursorGoTo(1, 0);
                LCD_write_char('\1'); 
            }
        }
        EA = 1;
        
        while (AnyKeyPressed());
    }
}

void render_task(void){
    while(1){
        EA = 0;

        if (game_over) ThreadYield();

        if ((dino_position == 0 && (map_top[0] & 0x40)) ||
            (dino_position == 1 && (map_btm[0] & 0x40))) {
            game_over = 1;
            ThreadYield();
        }
        
        carry_bit = (map_top[0] & 0x80) ? 1 : 0;
        map_top[0] <<= 1;
        if (map_top[1] & 0x80) map_top[0]++;
        map_top[1] <<= 1;
        if (carry_bit) { 
            score++; 
            map_top[1]++; 
        }

        carry_bit = (map_btm[0] & 0x80) ? 1 : 0;
        map_btm[0] <<= 1;
        if (map_btm[1] & 0x80) map_btm[0]++;
        map_btm[1] <<= 1;
        if (carry_bit) { 
            score++; 
            map_btm[1]++; 
        }

        LCD_cursorGoTo(0, 0);
        for(mask = 0x80; mask; mask >>= 1){ 
            LCD_write_char((map_top[0] & mask) ? '\2' : ' '); 
        }

        for(mask = 0x80; mask != 1; mask >>= 1){
            LCD_write_char((map_top[1] & mask) ? '\2' : ' ');
        }

        LCD_cursorGoTo(1, 0);
        for(mask = 0x80; mask; mask >>= 1){
            LCD_write_char((map_btm[0] & mask) ? '\2' : ' ');
        }
        for(mask = 0x80; mask != 1; mask >>= 1){
            LCD_write_char((map_btm[1] & mask) ? '\2' : ' ');
        }

        LCD_cursorGoTo(dino_position, 0);
        LCD_write_char('\1');

        EA = 1;
        ThreadYield();
    }
}

void game_ctrl(void)
{
    while (1){
        if(game_over){
            EA = 0;
            LCD_cursorGoTo(0, 0);
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char('G');
            LCD_write_char('A');
            LCD_write_char('M');
            LCD_write_char('E');
            LCD_write_char(' ');
            LCD_write_char('O');
            LCD_write_char('V');
            LCD_write_char('E');
            LCD_write_char('R');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_cursorGoTo(1, 0);
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char('S');
            LCD_write_char('C');
            LCD_write_char('O');
            LCD_write_char('R');
            LCD_write_char('E');
            LCD_write_char(':');
            LCD_write_char(' ');
            LCD_write_char(score/10 + '0');
            LCD_write_char(score%10 + '0');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            return;
        }
        
        cactus_timer++;
        if (cactus_timer >= (10 - game_speed)) {  
            cactus_timer = 0;
            
            unsigned char pattern = cactus_patterns[(score + last_cactus_row) % 8];
            
            if (pattern == 1) {
                map_top[1] |= 0x01;  
                last_cactus_row = 1;
            } else if (pattern == 2) {
                map_btm[1] |= 0x01;  
                last_cactus_row = 2;
            } else {
                last_cactus_row = 0;  
            }
        }
        
        unsigned char i;
        for (i = 0; i < game_speed; i++) {
            ThreadYield();
        }
    }
}

unsigned char difficulty_input(void);
int rand(void);

unsigned char difficulty_input() {
    unsigned char input_time = 0;
    char key;
    while (1) {
        while (!AnyKeyPressed());
        key = KeyToChar();
        while (AnyKeyPressed());

        if (key == '#') {
            if (input_time == 0)
                continue;
            else
                break;
        }

        if (key == '*') {
            continue;
        }

        if (key >= '1' && key <= '9') {
            input_time = (key - '0');
        }
    }
    return input_time;
}

/*const unsigned char map_patterns[][4] = { 
    {0x80, 0x02, 0x08, 0x20}, // top 10000000 00000010 btm 00001000 00100000
    {0x1C, 0x00, 0x00, 0xE0}, // top 00011100 00000000 btm 00000000 11100000
    {0x82, 0x08, 0x20, 0x41}, // top 10000010 00001000 btm 00100000 01000001
    {0x0E, 0x00, 0x00, 0x70}, // top 00001110 00000000 btm 00000000 01110000

};*/

void main(void)
{
    Init_Keypad();
    LCD_Init();
	LCD_set_symbol('\10', dinosaur); 
    LCD_set_symbol('\20', cactus);   

    map_top[0] = 0x1C; 
    map_top[1] = 0x00;
    map_btm[0] = 0x00;
    map_btm[1] = 0xE0;
 
    time = 0;
    game_over = 0;
    score = 0;
    dino_position = 0;
    cactus_timer = 0;
    last_cactus_row = 0;
    
    game_speed = difficulty_input();
    if (game_speed > 9) game_speed = 9;  
    if (game_speed < 1) game_speed = 1;  
    
    ThreadCreate(render_task);
    ThreadCreate(keypad_ctrl);
    game_ctrl();
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