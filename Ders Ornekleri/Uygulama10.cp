#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama10.c"
sbit yon at TRISC.B0;

void mod1(){
 if(PORTB==0||PORTB==128){
 PORTB=1;
 Delay_ms(1000);
 }else{
 PORTB=PORTB<<1;
 Delay_ms(1000);
 }
}
void mod2(){
 PORTB=0XFF;
 Delay_ms(1000);
 PORTB=0X00;
 Delay_ms(1000);
}
void main() {
TRISB=0X00;
TRISD=0X03;
PORTB=0X00;
 while(1){
 if(PORTD.F0==1){
 yon=0;
 }else if(PORTD.F1==1){
 yon=1;
 }
 if(yon==1){
 mod2();
 }else if(yon==0){
 mod1();
 }
 }
}
