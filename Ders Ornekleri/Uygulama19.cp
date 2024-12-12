#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama19.c"
char birler=0;
char onlar=0;
char yuzler=0;
char binler=0;
char tablo[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};

void arttir(){
 birler=birler+1;
 if(birler==10){
 onlar=onlar+1;
 birler=0;
 if(onlar==10){
 yuzler=yuzler+1;
 onlar=0;
 if(yuzler==10){
 binler=binler+1;
 yuzler=0;
 if(binler==10){
 {
 binler=0;
 yuzler=0;
 onlar=0;
 birler=0;
 }
 }
 }
 }
 }
}

void sayilarigoster(){

 PORTB=0;
 PORTD.F0=0;
 PORTD.F1=1;
 PORTD.F2=1;
 PORTD.F3=1;
 PORTB=tablo[binler];
 Delay_ms(10);

 PORTD.F0=1;
 PORTD.F1=0;
 PORTD.F2=1;
 PORTD.F3=1;
 PORTB=tablo[yuzler];
 Delay_ms(10);

 PORTD.F0=1;
 PORTD.F1=1;
 PORTD.F2=0;
 PORTD.F3=1;
 PORTB=tablo[onlar];
 Delay_ms(10);

 PORTD.F0=1;
 PORTD.F1=1;
 PORTD.F2=1;
 PORTD.F3=0;
 PORTB=tablo[birler];
 Delay_ms(10);

}

void main() {

 TRISB=0;
 PORTB=0;
 TRISD=0Xf0;
 PORTD=0x00;
 while(1){
 if (PORTD.F4==1){
 arttir();
 Delay_ms(500);
 }
 sayilarigoster();
 }



 }
