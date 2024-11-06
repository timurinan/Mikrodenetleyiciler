#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama11.c"
 void interrupt(){
 PORTB.F0=~PORTB.F0;
 TMR0=216;
 INTCON.TMR0IF=0;
 }

void main() {
 TRISB=0;
 PORTB=0;
 TMR0=216;
 OPTION_REG=0;
 INTCON=0XA0;

 while(1){

 }
}
