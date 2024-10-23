#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama1.c"

void main() {

TRISB=0X00;

while(1){

PORTB=0Xff;
Delay_ms(1000);
PORTB=0X00;
Delay_ms(1000);

}

}
