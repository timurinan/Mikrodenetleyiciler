
_main:

;Uygulama8.c,1 :: 		void main() {
;Uygulama8.c,3 :: 		TRISD=0X01; //00000001
	MOVLW      1
	MOVWF      TRISD+0
;Uygulama8.c,4 :: 		TRISB=0X00; //00000000--11110111
	CLRF       TRISB+0
;Uygulama8.c,6 :: 		while(1){
L_main0:
;Uygulama8.c,7 :: 		if(PORTD.F0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;Uygulama8.c,8 :: 		PORTB=0XFF;
	MOVLW      255
	MOVWF      PORTB+0
;Uygulama8.c,9 :: 		}else{
	GOTO       L_main3
L_main2:
;Uygulama8.c,10 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama8.c,11 :: 		}
L_main3:
;Uygulama8.c,12 :: 		}
	GOTO       L_main0
;Uygulama8.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
