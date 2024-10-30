
_main:

;Uygulama9.c,1 :: 		void main() {
;Uygulama9.c,3 :: 		TRISD=0X03; //00000011
	MOVLW      3
	MOVWF      TRISD+0
;Uygulama9.c,4 :: 		TRISB=0X00; //00000000
	CLRF       TRISB+0
;Uygulama9.c,5 :: 		PORTD=0;
	CLRF       PORTD+0
;Uygulama9.c,6 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama9.c,7 :: 		while(1){
L_main0:
;Uygulama9.c,8 :: 		if(PORTD.F0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;Uygulama9.c,9 :: 		PORTB=0XFF;
	MOVLW      255
	MOVWF      PORTB+0
;Uygulama9.c,10 :: 		}
	GOTO       L_main3
L_main2:
;Uygulama9.c,11 :: 		else if(PORTD.F1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_main4
;Uygulama9.c,12 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama9.c,13 :: 		}
L_main4:
L_main3:
;Uygulama9.c,14 :: 		}
	GOTO       L_main0
;Uygulama9.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
