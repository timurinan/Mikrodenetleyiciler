
_init:

;Uygulama18.c,6 :: 		init(){
;Uygulama18.c,7 :: 		trisb=0;
	CLRF       TRISB+0
;Uygulama18.c,8 :: 		portb=0;
	CLRF       PORTB+0
;Uygulama18.c,9 :: 		trisd=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;Uygulama18.c,10 :: 		}
L_end_init:
	RETURN
; end of _init

_seven_segment_goster:

;Uygulama18.c,12 :: 		seven_segment_goster(){
;Uygulama18.c,13 :: 		onlar=sayac/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sayac+0, 0
	MOVWF      R0+0
	MOVF       _sayac+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__seven_segment_goster+0
	MOVF       R0+1, 0
	MOVWF      FLOC__seven_segment_goster+1
	MOVF       FLOC__seven_segment_goster+0, 0
	MOVWF      _onlar+0
	MOVF       FLOC__seven_segment_goster+1, 0
	MOVWF      _onlar+1
;Uygulama18.c,14 :: 		birler=sayac%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sayac+0, 0
	MOVWF      R0+0
	MOVF       _sayac+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _birler+0
	MOVF       R0+1, 0
	MOVWF      _birler+1
;Uygulama18.c,15 :: 		onlar=onlar*16;
	MOVLW      4
	MOVWF      R4+0
	MOVF       FLOC__seven_segment_goster+0, 0
	MOVWF      R2+0
	MOVF       FLOC__seven_segment_goster+1, 0
	MOVWF      R2+1
	MOVF       R4+0, 0
L__seven_segment_goster10:
	BTFSC      STATUS+0, 2
	GOTO       L__seven_segment_goster11
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__seven_segment_goster10
L__seven_segment_goster11:
	MOVF       R2+0, 0
	MOVWF      _onlar+0
	MOVF       R2+1, 0
	MOVWF      _onlar+1
;Uygulama18.c,16 :: 		veri=onlar^birler;
	MOVF       R2+0, 0
	XORWF      R0+0, 1
	MOVF       R2+1, 0
	XORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _veri+0
	MOVF       R0+1, 0
	MOVWF      _veri+1
;Uygulama18.c,17 :: 		portb=veri;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Uygulama18.c,18 :: 		}
L_end_seven_segment_goster:
	RETURN
; end of _seven_segment_goster

_main:

;Uygulama18.c,20 :: 		void main() {
;Uygulama18.c,21 :: 		init();
	CALL       _init+0
;Uygulama18.c,23 :: 		while(1){
L_main0:
;Uygulama18.c,24 :: 		if(portd.f7==1){
	BTFSS      PORTD+0, 7
	GOTO       L_main2
;Uygulama18.c,25 :: 		delay_ms(500);
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
;Uygulama18.c,26 :: 		sayac=sayac+1;
	INCF       _sayac+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sayac+1, 1
;Uygulama18.c,27 :: 		if(sayac>99)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _sayac+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _sayac+0, 0
	SUBLW      99
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Uygulama18.c,28 :: 		sayac=0;
	CLRF       _sayac+0
	CLRF       _sayac+1
L_main4:
;Uygulama18.c,29 :: 		}
L_main2:
;Uygulama18.c,30 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main5
;Uygulama18.c,31 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Uygulama18.c,32 :: 		sayac=sayac-1;
	MOVLW      1
	SUBWF      _sayac+0, 1
	BTFSS      STATUS+0, 0
	DECF       _sayac+1, 1
;Uygulama18.c,33 :: 		if(sayac<0)
	MOVLW      128
	XORWF      _sayac+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	SUBWF      _sayac+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Uygulama18.c,34 :: 		sayac=99;
	MOVLW      99
	MOVWF      _sayac+0
	MOVLW      0
	MOVWF      _sayac+1
L_main7:
;Uygulama18.c,35 :: 		}
L_main5:
;Uygulama18.c,36 :: 		seven_segment_goster();
	CALL       _seven_segment_goster+0
;Uygulama18.c,37 :: 		}//while son
	GOTO       L_main0
;Uygulama18.c,38 :: 		}// main son
L_end_main:
	GOTO       $+0
; end of _main
