
_main:

;Uygulama23.c,3 :: 		void main() {
;Uygulama23.c,5 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Uygulama23.c,6 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;Uygulama23.c,8 :: 		UART1_Write_Text("Basla");
	MOVLW      ?lstr1_Uygulama23+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Uygulama23.c,9 :: 		UART1_Write(10);//line feed ascii
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Uygulama23.c,10 :: 		UART1_Write(13);//Carriage Return
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Uygulama23.c,12 :: 		while (1) {                     // Endless loop
L_main1:
;Uygulama23.c,13 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Uygulama23.c,14 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;Uygulama23.c,16 :: 		UART1_Write(uart_rd);       // and send data via USART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Uygulama23.c,17 :: 		}
L_main3:
;Uygulama23.c,18 :: 		}
	GOTO       L_main1
;Uygulama23.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
