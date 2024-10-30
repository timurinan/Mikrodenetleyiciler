void main() {

TRISD=0X01; //00000001
TRISB=0X00; //00000000--11110111

while(1){
 if(PORTD.F0==1){
  PORTB=0XFF;
 }else{
  PORTB=0;
 }
}

}