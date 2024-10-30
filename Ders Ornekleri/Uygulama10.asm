
_mod1:

;Uygulama10.c,3 :: 		void mod1(){
;Uygulama10.c,4 :: 		if(PORTB==0||PORTB==128){
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__mod116
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSC      STATUS+0, 2
	GOTO       L__mod116
	GOTO       L_mod12
L__mod116:
;Uygulama10.c,5 :: 		PORTB=1;
	MOVLW      1
	MOVWF      PORTB+0
;Uygulama10.c,6 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_mod13:
	DECFSZ     R13+0, 1
	GOTO       L_mod13
	DECFSZ     R12+0, 1
	GOTO       L_mod13
	DECFSZ     R11+0, 1
	GOTO       L_mod13
	NOP
	NOP
;Uygulama10.c,7 :: 		}else{
	GOTO       L_mod14
L_mod12:
;Uygulama10.c,8 :: 		PORTB=PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Uygulama10.c,9 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_mod15:
	DECFSZ     R13+0, 1
	GOTO       L_mod15
	DECFSZ     R12+0, 1
	GOTO       L_mod15
	DECFSZ     R11+0, 1
	GOTO       L_mod15
	NOP
	NOP
;Uygulama10.c,10 :: 		}
L_mod14:
;Uygulama10.c,11 :: 		}
L_end_mod1:
	RETURN
; end of _mod1

_mod2:

;Uygulama10.c,12 :: 		void mod2(){
;Uygulama10.c,13 :: 		PORTB=0XFF;
	MOVLW      255
	MOVWF      PORTB+0
;Uygulama10.c,14 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_mod26:
	DECFSZ     R13+0, 1
	GOTO       L_mod26
	DECFSZ     R12+0, 1
	GOTO       L_mod26
	DECFSZ     R11+0, 1
	GOTO       L_mod26
	NOP
	NOP
;Uygulama10.c,15 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama10.c,16 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_mod27:
	DECFSZ     R13+0, 1
	GOTO       L_mod27
	DECFSZ     R12+0, 1
	GOTO       L_mod27
	DECFSZ     R11+0, 1
	GOTO       L_mod27
	NOP
	NOP
;Uygulama10.c,17 :: 		}
L_end_mod2:
	RETURN
; end of _mod2

_main:

;Uygulama10.c,18 :: 		void main() {
;Uygulama10.c,19 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama10.c,20 :: 		TRISD=0X03;
	MOVLW      3
	MOVWF      TRISD+0
;Uygulama10.c,21 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama10.c,22 :: 		while(1){
L_main8:
;Uygulama10.c,23 :: 		if(PORTD.F0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main10
;Uygulama10.c,24 :: 		yon=0;
	BCF        TRISC+0, 0
;Uygulama10.c,25 :: 		}else if(PORTD.F1==1){
	GOTO       L_main11
L_main10:
	BTFSS      PORTD+0, 1
	GOTO       L_main12
;Uygulama10.c,26 :: 		yon=1;
	BSF        TRISC+0, 0
;Uygulama10.c,27 :: 		}
L_main12:
L_main11:
;Uygulama10.c,28 :: 		if(yon==1){
	BTFSS      TRISC+0, 0
	GOTO       L_main13
;Uygulama10.c,29 :: 		mod2();
	CALL       _mod2+0
;Uygulama10.c,30 :: 		}else if(yon==0){
	GOTO       L_main14
L_main13:
	BTFSC      TRISC+0, 0
	GOTO       L_main15
;Uygulama10.c,31 :: 		mod1();
	CALL       _mod1+0
;Uygulama10.c,32 :: 		}
L_main15:
L_main14:
;Uygulama10.c,33 :: 		}
	GOTO       L_main8
;Uygulama10.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
