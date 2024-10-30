
_main:

;Uygulama5.c,4 :: 		void main() {
;Uygulama5.c,5 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama5.c,6 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama5.c,8 :: 		PORTB=0XC0;//192
	MOVLW      192
	MOVWF      PORTB+0
;Uygulama5.c,10 :: 		while(1){
L_main0:
;Uygulama5.c,11 :: 		Delay_ms(1000);
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
;Uygulama5.c,12 :: 		PORTB=PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Uygulama5.c,13 :: 		if(PORTB==3){
	MOVF       PORTB+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Uygulama5.c,14 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Uygulama5.c,15 :: 		PORTB=0XC0;//192
	MOVLW      192
	MOVWF      PORTB+0
;Uygulama5.c,16 :: 		}
L_main3:
;Uygulama5.c,18 :: 		}
	GOTO       L_main0
;Uygulama5.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
