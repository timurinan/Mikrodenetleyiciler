
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Uygulama11.c,1 :: 		void interrupt(){
;Uygulama11.c,2 :: 		PORTB.F0=~PORTB.F0;
	MOVLW      1
	XORWF      PORTB+0, 1
;Uygulama11.c,3 :: 		TMR0=216;
	MOVLW      216
	MOVWF      TMR0+0
;Uygulama11.c,4 :: 		INTCON.TMR0IF=0;
	BCF        INTCON+0, 2
;Uygulama11.c,5 :: 		}
L_end_interrupt:
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Uygulama11.c,7 :: 		void main() {
;Uygulama11.c,8 :: 		TRISB=0;
	CLRF       TRISB+0
;Uygulama11.c,9 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama11.c,10 :: 		TMR0=216;//250 KERE SAYACAK
	MOVLW      216
	MOVWF      TMR0+0
;Uygulama11.c,11 :: 		OPTION_REG=0; //0X01 YA DA 1
	CLRF       OPTION_REG+0
;Uygulama11.c,12 :: 		INTCON=0XA0;    //0XA0 YA DA 64
	MOVLW      160
	MOVWF      INTCON+0
;Uygulama11.c,14 :: 		while(1){
L_main0:
;Uygulama11.c,16 :: 		}
	GOTO       L_main0
;Uygulama11.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
