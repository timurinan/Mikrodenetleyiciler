
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Uygulamal12.c,3 :: 		void interrupt(){
;Uygulamal12.c,5 :: 		adc_cikis=ADRESH;
	MOVF       ADRESH+0, 0
	MOVWF      _adc_cikis+0
	CLRF       _adc_cikis+1
;Uygulamal12.c,6 :: 		cikis2=ADRESL;
	MOVF       ADRESL+0, 0
	MOVWF      _cikis2+0
	CLRF       _cikis2+1
;Uygulamal12.c,7 :: 		PIR1.ADIF=0;
	BCF        PIR1+0, 6
;Uygulamal12.c,8 :: 		ADCON0.GO=1;
	BSF        ADCON0+0, 2
;Uygulamal12.c,9 :: 		}
L_end_interrupt:
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Uygulamal12.c,12 :: 		void main() {
;Uygulamal12.c,13 :: 		ADCON1=0X4E;// 0100 1110 ADFM=0 (ADC ÇIKIÞI SOLA YASLI-ADRESH), ADCS2=1 PCFG3:0 (A PORTUNUN 0 NOLU PÝNÝ ANALOG DÝÐERLERÝ DÝJÝTAL)
	MOVLW      78
	MOVWF      ADCON1+0
;Uygulamal12.c,14 :: 		ADCON0=0X45;// ADCS1=0, ADCS0=1, AN0 I SEÇMEK ÝÇÝN CHS2:0 ARASINI 000 YAPTIK, GO/DONE=1, ADON=1;
	MOVLW      69
	MOVWF      ADCON0+0
;Uygulamal12.c,16 :: 		PIR1.ADIF=0;//ADC NÝN ÜRETECEÐÝ KESME BAYRAÐINI SIFIRLAMA
	BCF        PIR1+0, 6
;Uygulamal12.c,17 :: 		PIE1.ADIE=1;//ADC NÝN KESME ÜRETMESÝNÝ ENABLE ETMEK.
	BSF        PIE1+0, 6
;Uygulamal12.c,18 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;Uygulamal12.c,19 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;Uygulamal12.c,21 :: 		TRISD=0;
	CLRF       TRISD+0
;Uygulamal12.c,22 :: 		PORTD=0;
	CLRF       PORTD+0
;Uygulamal12.c,24 :: 		TRISA=1;
	MOVLW      1
	MOVWF      TRISA+0
;Uygulamal12.c,25 :: 		TRISB=0;
	CLRF       TRISB+0
;Uygulamal12.c,26 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulamal12.c,28 :: 		while(1){
L_main0:
;Uygulamal12.c,29 :: 		PORTB=adc_cikis;
	MOVF       _adc_cikis+0, 0
	MOVWF      PORTB+0
;Uygulamal12.c,30 :: 		PORTD=cikis2;
	MOVF       _cikis2+0, 0
	MOVWF      PORTD+0
;Uygulamal12.c,31 :: 		}
	GOTO       L_main0
;Uygulamal12.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
