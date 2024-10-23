
_main:

;Uygulama3.c,2 :: 		void main() {
;Uygulama3.c,4 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama3.c,5 :: 		PORTB=0X01;
	MOVLW      1
	MOVWF      PORTB+0
;Uygulama3.c,6 :: 		yon_bit=0;
	BCF        TRISC+0, 0
;Uygulama3.c,7 :: 		while(1){
L_main0:
;Uygulama3.c,9 :: 		if(yon_bit==0){
	BTFSC      TRISC+0, 0
	GOTO       L_main2
;Uygulama3.c,10 :: 		PORTB=PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Uygulama3.c,11 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Uygulama3.c,12 :: 		}else{
	GOTO       L_main4
L_main2:
;Uygulama3.c,13 :: 		PORTB=PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Uygulama3.c,14 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Uygulama3.c,15 :: 		}
L_main4:
;Uygulama3.c,17 :: 		if(PORTB==128){
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Uygulama3.c,18 :: 		yon_bit=1;
	BSF        TRISC+0, 0
;Uygulama3.c,19 :: 		}else if(PORTB==1){
	GOTO       L_main7
L_main6:
	MOVF       PORTB+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Uygulama3.c,20 :: 		yon_bit=0;
	BCF        TRISC+0, 0
;Uygulama3.c,21 :: 		}
L_main8:
L_main7:
;Uygulama3.c,22 :: 		}
	GOTO       L_main0
;Uygulama3.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
