#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama17.c"
char sayac=0;
char tablo[]={0xfc,0x60,0xda,0xf2,0x66,0xb6,0xbe,0xe0,0xfe,0xf6};

void main() {

TRISB=0;

while(1){

 PORTB=tablo[sayac];
 Delay_ms(1000);
 sayac=sayac+1;
 if(sayac==10){
 sayac=0;
 }

}
}
