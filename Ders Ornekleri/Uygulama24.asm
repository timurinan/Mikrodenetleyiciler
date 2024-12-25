
_main:

;Uygulama24.c,6 :: 		void main() {
;Uygulama24.c,8 :: 		SS1=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;Uygulama24.c,9 :: 		SS2=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Uygulama24.c,10 :: 		SS1_Direction=0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;Uygulama24.c,11 :: 		SS2_Direction=0;
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;Uygulama24.c,12 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;Uygulama24.c,13 :: 		while(1){
L_main0:
;Uygulama24.c,15 :: 		SS1=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;Uygulama24.c,16 :: 		SPI1_Write(0x0a);
	MOVLW      10
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;Uygulama24.c,17 :: 		SS1=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;Uygulama24.c,19 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Uygulama24.c,21 :: 		SS2=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Uygulama24.c,22 :: 		SPI1_Write(0x0b);
	MOVLW      11
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;Uygulama24.c,23 :: 		SS2=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Uygulama24.c,24 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Uygulama24.c,25 :: 		}
	GOTO       L_main0
;Uygulama24.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
