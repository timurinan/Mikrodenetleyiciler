#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama5.c"



void main() {
TRISB=0X00;
PORTB=0X00;

PORTB=0XC0;

while(1){
 Delay_ms(1000);
 PORTB=PORTB>>1;
 if(PORTB==3){
 Delay_ms(1000);
 PORTB=0XC0;
 }

}

}
