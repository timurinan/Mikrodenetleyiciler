#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama14.c"
float adc_degeri absolute 0x22;
unsigned adc_val absolute 0x20;
float carpan;
char dc_val[16];

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
init(){
 ADCON1=0X4E;

 ADCON0=0X45;
 trisb=0;
 portb=0;
 trisd=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

}
void main() {
 init();
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 while(1){

 adc_val= ADC_Read(0);
 portd=adc_val;
 carpan=5000.0/1023.0;

 adc_degeri=adc_val*carpan;

 FloatToStr(adc_degeri, dc_val);
 strcat(dc_val," mV");
 Lcd_Out(1,1,dc_val);
 Delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 }
}
