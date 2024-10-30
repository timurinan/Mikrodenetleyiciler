
void main() {
TRISB=0X00;
PORTB=0X00;

PORTB=0X07;//7

while(1){
 Delay_ms(600);
 PORTB=PORTB<<1;
 if(PORTB==128){
  Delay_ms(600);
   PORTB=0X07;//7
 }

}

}