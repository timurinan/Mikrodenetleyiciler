
_init:

;Uygulama14.c,19 :: 		init(){
;Uygulama14.c,20 :: 		ADCON1=0X4E;// ADFM=0(LEFT JUSTIFIED),ADCS2=1,
	MOVLW      78
	MOVWF      ADCON1+0
;Uygulama14.c,22 :: 		ADCON0=0X45;//ADCS1=0,ADCS1=1,16 tOSC SE��LD�.,CHS2:CHS0=0 KANAL aN0 SE��LD�
	MOVLW      69
	MOVWF      ADCON0+0
;Uygulama14.c,23 :: 		trisb=0;
	CLRF       TRISB+0
;Uygulama14.c,24 :: 		portb=0;
	CLRF       PORTB+0
;Uygulama14.c,25 :: 		trisd=0;
	CLRF       TRISD+0
;Uygulama14.c,26 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;Uygulama14.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Uygulama14.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Uygulama14.c,30 :: 		}
L_end_init:
	RETURN
; end of _init

_main:

;Uygulama14.c,31 :: 		void main() {
;Uygulama14.c,32 :: 		init();
	CALL       _init+0
;Uygulama14.c,33 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;Uygulama14.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Uygulama14.c,35 :: 		while(1){
L_main1:
;Uygulama14.c,37 :: 		adc_val= ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      32
	MOVF       R0+1, 0
	MOVWF      33
;Uygulama14.c,38 :: 		portd=adc_val;// test ama�l� D portuna g�nderilmi�tir
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;Uygulama14.c,39 :: 		carpan=5000.0/1023.0;// bir bite kar��l�k gelen gerilim de�eri
	MOVLW      26
	MOVWF      _carpan+0
	MOVLW      103
	MOVWF      _carpan+1
	MOVLW      28
	MOVWF      _carpan+2
	MOVLW      129
	MOVWF      _carpan+3
;Uygulama14.c,41 :: 		adc_degeri=adc_val*carpan;
	CALL       _word2double+0
	MOVLW      26
	MOVWF      R4+0
	MOVLW      103
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      34
	MOVF       R0+1, 0
	MOVWF      35
	MOVF       R0+2, 0
	MOVWF      36
	MOVF       R0+3, 0
	MOVWF      37
;Uygulama14.c,43 :: 		FloatToStr(adc_degeri, dc_val);// //float de�i�kenin stringe �evrilmesi
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _dc_val+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;Uygulama14.c,44 :: 		strcat(dc_val," mV"); // strcat komutu ile iki string birle�tiriliyor.
	MOVLW      _dc_val+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr1_Uygulama14+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
;Uygulama14.c,45 :: 		Lcd_Out(1,1,dc_val);// LCD nin 1 sat�r 1. s�tunundan itibaren yazd�r.
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _dc_val+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Uygulama14.c,46 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Uygulama14.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Uygulama14.c,48 :: 		}
	GOTO       L_main1
;Uygulama14.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
