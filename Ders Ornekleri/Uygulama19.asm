
_arttir:

;Uygulama19.c,7 :: 		void arttir(){
;Uygulama19.c,8 :: 		birler=birler+1;
	INCF       _birler+0, 1
;Uygulama19.c,9 :: 		if(birler==10){
	MOVF       _birler+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_arttir0
;Uygulama19.c,10 :: 		onlar=onlar+1;
	INCF       _onlar+0, 1
;Uygulama19.c,11 :: 		birler=0;
	CLRF       _birler+0
;Uygulama19.c,12 :: 		if(onlar==10){
	MOVF       _onlar+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_arttir1
;Uygulama19.c,13 :: 		yuzler=yuzler+1;
	INCF       _yuzler+0, 1
;Uygulama19.c,14 :: 		onlar=0;
	CLRF       _onlar+0
;Uygulama19.c,15 :: 		if(yuzler==10){
	MOVF       _yuzler+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_arttir2
;Uygulama19.c,16 :: 		binler=binler+1;
	INCF       _binler+0, 1
;Uygulama19.c,17 :: 		yuzler=0;
	CLRF       _yuzler+0
;Uygulama19.c,18 :: 		if(binler==10){
	MOVF       _binler+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_arttir3
;Uygulama19.c,20 :: 		binler=0;
	CLRF       _binler+0
;Uygulama19.c,21 :: 		yuzler=0;
	CLRF       _yuzler+0
;Uygulama19.c,22 :: 		onlar=0;
	CLRF       _onlar+0
;Uygulama19.c,23 :: 		birler=0;
	CLRF       _birler+0
;Uygulama19.c,25 :: 		}
L_arttir3:
;Uygulama19.c,26 :: 		}
L_arttir2:
;Uygulama19.c,27 :: 		}
L_arttir1:
;Uygulama19.c,28 :: 		}
L_arttir0:
;Uygulama19.c,29 :: 		}
L_end_arttir:
	RETURN
; end of _arttir

_sayilarigoster:

;Uygulama19.c,31 :: 		void sayilarigoster(){
;Uygulama19.c,33 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama19.c,34 :: 		PORTD.F0=0;
	BCF        PORTD+0, 0
;Uygulama19.c,35 :: 		PORTD.F1=1;
	BSF        PORTD+0, 1
;Uygulama19.c,36 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;Uygulama19.c,37 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;Uygulama19.c,38 :: 		PORTB=tablo[binler];
	MOVF       _binler+0, 0
	ADDLW      _tablo+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Uygulama19.c,39 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_sayilarigoster4:
	DECFSZ     R13+0, 1
	GOTO       L_sayilarigoster4
	DECFSZ     R12+0, 1
	GOTO       L_sayilarigoster4
	NOP
;Uygulama19.c,41 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;Uygulama19.c,42 :: 		PORTD.F1=0;
	BCF        PORTD+0, 1
;Uygulama19.c,43 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;Uygulama19.c,44 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;Uygulama19.c,45 :: 		PORTB=tablo[yuzler];
	MOVF       _yuzler+0, 0
	ADDLW      _tablo+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Uygulama19.c,46 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_sayilarigoster5:
	DECFSZ     R13+0, 1
	GOTO       L_sayilarigoster5
	DECFSZ     R12+0, 1
	GOTO       L_sayilarigoster5
	NOP
;Uygulama19.c,48 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;Uygulama19.c,49 :: 		PORTD.F1=1;
	BSF        PORTD+0, 1
;Uygulama19.c,50 :: 		PORTD.F2=0;
	BCF        PORTD+0, 2
;Uygulama19.c,51 :: 		PORTD.F3=1;
	BSF        PORTD+0, 3
;Uygulama19.c,52 :: 		PORTB=tablo[onlar];
	MOVF       _onlar+0, 0
	ADDLW      _tablo+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Uygulama19.c,53 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_sayilarigoster6:
	DECFSZ     R13+0, 1
	GOTO       L_sayilarigoster6
	DECFSZ     R12+0, 1
	GOTO       L_sayilarigoster6
	NOP
;Uygulama19.c,55 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;Uygulama19.c,56 :: 		PORTD.F1=1;
	BSF        PORTD+0, 1
;Uygulama19.c,57 :: 		PORTD.F2=1;
	BSF        PORTD+0, 2
;Uygulama19.c,58 :: 		PORTD.F3=0;
	BCF        PORTD+0, 3
;Uygulama19.c,59 :: 		PORTB=tablo[birler];
	MOVF       _birler+0, 0
	ADDLW      _tablo+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Uygulama19.c,60 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_sayilarigoster7:
	DECFSZ     R13+0, 1
	GOTO       L_sayilarigoster7
	DECFSZ     R12+0, 1
	GOTO       L_sayilarigoster7
	NOP
;Uygulama19.c,62 :: 		}
L_end_sayilarigoster:
	RETURN
; end of _sayilarigoster

_main:

;Uygulama19.c,64 :: 		void main() {
;Uygulama19.c,66 :: 		TRISB=0;
	CLRF       TRISB+0
;Uygulama19.c,67 :: 		PORTB=0;
	CLRF       PORTB+0
;Uygulama19.c,68 :: 		TRISD=0Xf0;
	MOVLW      240
	MOVWF      TRISD+0
;Uygulama19.c,69 :: 		PORTD=0x00;
	CLRF       PORTD+0
;Uygulama19.c,70 :: 		while(1){
L_main8:
;Uygulama19.c,71 :: 		if (PORTD.F4==1){
	BTFSS      PORTD+0, 4
	GOTO       L_main10
;Uygulama19.c,72 :: 		arttir();
	CALL       _arttir+0
;Uygulama19.c,73 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;Uygulama19.c,74 :: 		}
L_main10:
;Uygulama19.c,75 :: 		sayilarigoster();
	CALL       _sayilarigoster+0
;Uygulama19.c,76 :: 		}
	GOTO       L_main8
;Uygulama19.c,80 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
