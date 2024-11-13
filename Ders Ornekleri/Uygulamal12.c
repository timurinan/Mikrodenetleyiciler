unsigned int adc_cikis,cikis2;

void interrupt(){

 adc_cikis=ADRESH;
 cikis2=ADRESL;
 PIR1.ADIF=0;
 ADCON0.GO=1;
}


void main() {
    ADCON1=0X4E;// 0100 1110 ADFM=0 (ADC �IKI�I SOLA YASLI-ADRESH), ADCS2=1 PCFG3:0 (A PORTUNUN 0 NOLU P�N� ANALOG D��ERLER� D�J�TAL)
    ADCON0=0X45;// ADCS1=0, ADCS0=1, AN0 I SE�MEK ���N CHS2:0 ARASINI 000 YAPTIK, GO/DONE=1, ADON=1;
    
    PIR1.ADIF=0;//ADC N�N �RETECE�� KESME BAYRA�INI SIFIRLAMA
    PIE1.ADIE=1;//ADC N�N KESME �RETMES�N� ENABLE ETMEK.
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