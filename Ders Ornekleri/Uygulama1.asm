
_main:

;Uygulama1.c,2 :: 		void main() {
;Uygulama1.c,4 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama1.c,6 :: 		while(1){
L_main0:
;Uygulama1.c,8 :: 		PORTB=0Xff;
	MOVLW      255
	MOVWF      PORTB+0
;Uygulama1.c,9 :: 		Delay_ms(1000);
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
;Uygulama1.c,10 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama1.c,11 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Uygulama1.c,13 :: 		}
	GOTO       L_main0
;Uygulama1.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
