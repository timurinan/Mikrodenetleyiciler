#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama9.c"
void main() {

TRISD=0X03;
TRISB=0X00;
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
