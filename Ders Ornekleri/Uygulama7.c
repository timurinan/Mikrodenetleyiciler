void main() {

TRISD=0X01; //00000001
TRISB=0X00; //00000000--11110111

while(1){
 if(PORTD.F0==1){
  PORTB=0X08; //00001000--PORTB.F3=1
 }else{
  PORTB.F3=0;
 }
}

}