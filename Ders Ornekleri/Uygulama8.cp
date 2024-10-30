#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama8.c"
void main() {

TRISD=0X01;
TRISB=0X00;

while(1){
 if(PORTD.F0==1){
 PORTB=0XFF;
 }else{
 PORTB=0;
 }
}

}
