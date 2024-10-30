
_main:

;Uygulama4.c,4 :: 		void main() {
;Uygulama4.c,6 :: 		TRISB=0X00;
	CLRF       TRISB+0
;Uygulama4.c,7 :: 		PORTB=0X00;
	CLRF       PORTB+0
;Uygulama4.c,9 :: 		while(1){
L_main0:
;Uygulama4.c,10 :: 		sayi=128;
	MOVLW      128
	MOVWF      _sayi+0
	CLRF       _sayi+1
;Uygulama4.c,11 :: 		for(i=1;i<=8;i*=2){
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
	GOTO       L__main11
	MOVF       _i+0, 0
	SUBLW      8
L__main11:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;Uygulama4.c,12 :: 		PORTB=sayi+i;
	MOVF       _i+0, 0
	ADDWF      _sayi+0, 0
	MOVWF      PORTB+0
;Uygulama4.c,13 :: 		Delay_ms(1000);
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
;Uygulama4.c,14 :: 		sayi/=2;
	RRF        _sayi+1, 1
	RRF        _sayi+0, 1
	BCF        _sayi+1, 7
	BTFSC      _sayi+1, 6
	BSF        _sayi+1, 7
	BTFSS      _sayi+1, 7
	GOTO       L__main12
	BTFSS      STATUS+0, 0
	GOTO       L__main12
	INCF       _sayi+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sayi+1, 1
L__main12:
;Uygulama4.c,11 :: 		for(i=1;i<=8;i*=2){
	RLF        _i+0, 1
	RLF        _i+1, 1
	BCF        _i+0, 0
;Uygulama4.c,15 :: 		}
	GOTO       L_main2
L_main3:
;Uygulama4.c,16 :: 		sayi*=4;
	RLF        _sayi+0, 1
	RLF        _sayi+1, 1
	BCF        _sayi+0, 0
	RLF        _sayi+0, 1
	RLF        _sayi+1, 1
	BCF        _sayi+0, 0
;Uygulama4.c,17 :: 		for(i=4;i>=1;i/=2){
	MOVLW      4
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      1
	SUBWF      _i+0, 0
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;Uygulama4.c,18 :: 		PORTB=sayi+i;
	MOVF       _i+0, 0
	ADDWF      _sayi+0, 0
	MOVWF      PORTB+0
;Uygulama4.c,19 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Uygulama4.c,20 :: 		sayi*=2;
	RLF        _sayi+0, 1
	RLF        _sayi+1, 1
	BCF        _sayi+0, 0
;Uygulama4.c,17 :: 		for(i=4;i>=1;i/=2){
	RRF        _i+1, 1
	RRF        _i+0, 1
	BCF        _i+1, 7
	BTFSC      _i+1, 6
	BSF        _i+1, 7
	BTFSS      _i+1, 7
	GOTO       L__main14
	BTFSS      STATUS+0, 0
	GOTO       L__main14
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
L__main14:
;Uygulama4.c,21 :: 		}
	GOTO       L_main6
L_main7:
;Uygulama4.c,22 :: 		}
	GOTO       L_main0
;Uygulama4.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
