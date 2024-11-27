float adc_degeri absolute 0x22;
unsigned  adc_val absolute 0x20;
float  carpan;
char dc_val[16];
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
init(){
 ADCON1=0X4E;// ADFM=0(LEFT JUSTIFIED),ADCS2=1,
                //PCFG3:PCFG0=1110 AN0 ANALOG  D��ERLER� SAYISAL
 ADCON0=0X45;//ADCS1=0,ADCS1=1,16 tOSC SE��LD�.,CHS2:CHS0=0 KANAL aN0 SE��LD�
 trisb=0;
 portb=0;
 trisd=0;
 Lcd_Init();                        // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
 Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

}
void main() {
 init();
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 while(1){

  adc_val= ADC_Read(0);
  portd=adc_val;// test ama�l� D portuna g�nderilmi�tir
  carpan=5000.0/1023.0;// bir bite kar��l�k gelen gerilim de�eri

  adc_degeri=adc_val*carpan;

  FloatToStr(adc_degeri, dc_val);// //float de�i�kenin stringe �evrilmesi
  strcat(dc_val," mV"); // strcat komutu ile iki string birle�tiriliyor.
  Lcd_Out(1,1,dc_val);// LCD nin 1 sat�r 1. s�tunundan itibaren yazd�r.
  Delay_ms(100);
  Lcd_Cmd(_LCD_CLEAR);
 }
}
