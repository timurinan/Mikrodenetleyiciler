// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

char txt1[] = "LCD";
char txt2[] = "Bu kadar basit";

init(){
 trisb=0;
 portb=0;

 Lcd_Init();                        // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

}

void main() {

 init();
  Lcd_Out(1,1,txt1);
  Lcd_Out(2,1,txt2);
 while(1){

 } // while sonu
} // main sonu
