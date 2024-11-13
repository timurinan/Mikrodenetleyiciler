#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulamal12.c"
unsigned int adc_cikis,cikis2;

void interrupt(){

 adc_cikis=ADRESH;
 cikis2=ADRESL;
 PIR1.ADIF=0;
 ADCON0.GO=1;
}


void main() {
 ADCON1=0X4E;
 ADCON0=0X45;

 PIR1.ADIF=0;
 PIE1.ADIE=1;
 INTCON.PEIE=1;
 INTCON.GIE=1;

 TRISD=0;
 PORTD=0;

 TRISA=1;
 TRISB=0;
 PORTB=0;

 while(1){
 PORTB=adc_cikis;
 PORTD=cikis2;
 }
}
