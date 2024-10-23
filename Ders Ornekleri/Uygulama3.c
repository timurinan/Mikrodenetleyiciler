sbit yon_bit at TRISC.B0;
void main() {

 TRISB=0X00;
 PORTB=0X01;
 yon_bit=0;
 while(1){
 
 if(yon_bit==0){
      PORTB=PORTB<<1;
      Delay_ms(500);
 }else{
       PORTB=PORTB>>1;
      Delay_ms(500);
 }
 
 if(PORTB==128){
  yon_bit=1;
 }else if(PORTB==1){
  yon_bit=0;
 }
 }

}