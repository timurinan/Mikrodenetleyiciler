void main() {

TRISD=0X03; //00000011
TRISB=0X00; //00000000
PORTD=0;
PORTB=0;
while(1){
 if(PORTD.F0==1){
  PORTB=0XFF;
 }
 else if(PORTD.F1==1){
  PORTB=0;
 }
}

}