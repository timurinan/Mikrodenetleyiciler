
_main:

;Uygulama7.c,1 :: 		void main() {
;Uygulama7.c,3 :: 		TRISD=0X01; //00000001
	MOVLW      1
	MOVWF      TRISD+0
;Uygulama7.c,4 :: 		TRISB=0X00; //00000000--11110111
	CLRF       TRISB+0
;Uygulama7.c,6 :: 		while(1){
L_main0:
;Uygulama7.c,7 :: 		if(PORTD.F0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;Uygulama7.c,8 :: 		PORTB=0X08; //00001000--PORTB.F3=1
	MOVLW      8
	MOVWF      PORTB+0
;Uygulama7.c,9 :: 		}else{
	GOTO       L_main3
L_main2:
;Uygulama7.c,10 :: 		PORTB.F3=0;
	BCF        PORTB+0, 3
;Uygulama7.c,11 :: 		}
L_main3:
;Uygulama7.c,12 :: 		}
	GOTO       L_main0
;Uygulama7.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
