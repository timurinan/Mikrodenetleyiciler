#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama24.c"
sbit SS1 at RC0_bit;
sbit SS2 at RB0_bit;
sbit SS1_Direction at TRISC0_bit;
sbit SS2_Direction at TRISB0_bit;

void main() {

 SS1=1;
 SS2=1;
 SS1_Direction=0;
 SS2_Direction=0;
 SPI1_Init();
while(1){

 SS1=0;
 SPI1_Write(0x0a);
 SS1=1;

 Delay_ms(2000);

 SS2=0;
 SPI1_Write(0x0b);
 SS2=1;
 Delay_ms(2000);
 }
}
