
_main:

;Uygulama6.c,2 :: 		void main() {
;Uygulama6.c,3 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama6.c,4 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama6.c,6 :: 		PORTB=0X07;//7
	MOVLW      7
	MOVWF      PORTB+0
;Uygulama6.c,8 :: 		while(1){
L_main0:
;Uygulama6.c,9 :: 		Delay_ms(600);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Uygulama6.c,10 :: 		PORTB=PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Uygulama6.c,11 :: 		if(PORTB==128){
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Uygulama6.c,12 :: 		Delay_ms(600);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;Uygulama6.c,13 :: 		PORTB=0X07;//7
	MOVLW      7
	MOVWF      PORTB+0
;Uygulama6.c,14 :: 		}
L_main3:
;Uygulama6.c,16 :: 		}
	GOTO       L_main0
;Uygulama6.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
