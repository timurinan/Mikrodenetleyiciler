#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama16.c"
char sayac=0;
char tablo[]={0x03,0x9f,0x25,0x0d,0x99,0x49,0x41,0x1f,0x01,0x09};

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
