 void interrupt(){
  PORTB.F0=~PORTB.F0;
  TMR0=216;
  INTCON.TMR0IF=0;
 }

void main() {
     TRISB=0;
     PORTB=0;
     TMR0=216;//216 KERE SAYACAK
     OPTION_REG=0; //Prescale 2
     INTCON=0XA0;    //0XA0 YA DA 64
     
     while(1){
     
     }
}
