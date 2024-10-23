
_main:

;Uygulama2.c,4 :: 		void main() {
;Uygulama2.c,6 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama2.c,7 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama2.c,9 :: 		while(1){
L_main0:
;Uygulama2.c,11 :: 		for(i=1;i<=128;i*=2){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       _i+0, 0
	SUBLW      128
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;Uygulama2.c,13 :: 		PORTB=PORTB+i;
	MOVF       _i+0, 0
	ADDWF      PORTB+0, 1
;Uygulama2.c,14 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Uygulama2.c,11 :: 		for(i=1;i<=128;i*=2){
	RLF        _i+0, 1
	RLF        _i+1, 1
	BCF        _i+0, 0
;Uygulama2.c,15 :: 		}
	GOTO       L_main2
L_main3:
;Uygulama2.c,16 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama2.c,17 :: 		}
	GOTO       L_main0
;Uygulama2.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
