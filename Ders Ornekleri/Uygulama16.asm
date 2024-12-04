
_main:

;Uygulama16.c,4 :: 		void main() {
;Uygulama16.c,6 :: 		TRISB=0;
	CLRF       TRISB+0
;Uygulama16.c,8 :: 		while(1){
L_main0:
;Uygulama16.c,10 :: 		PORTB=tablo[sayac];
	MOVF       _sayac+0, 0
	ADDLW      _tablo+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Uygulama16.c,11 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Uygulama16.c,12 :: 		sayac=sayac+1;
	INCF       _sayac+0, 1
;Uygulama16.c,13 :: 		if(sayac==10){
	MOVF       _sayac+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Uygulama16.c,14 :: 		sayac=0;
	CLRF       _sayac+0
;Uygulama16.c,15 :: 		}
L_main3:
;Uygulama16.c,17 :: 		}
	GOTO       L_main0
;Uygulama16.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
