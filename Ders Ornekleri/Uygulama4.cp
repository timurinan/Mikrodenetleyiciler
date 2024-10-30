#line 1 "C:/Users/PC/Desktop/Ders Ornekleri/Uygulama4.c"

int sayi,i;

void main() {

TRISB=0X00;
PORTB=0X00;

while(1){
 sayi=128;
 for(i=1;i<=8;i*=2){
 PORTB=sayi+i;
 Delay_ms(1000);
 sayi/=2;
 }
 sayi*=4;
 for(i=4;i>=1;i/=2){
 PORTB=sayi+i;
 Delay_ms(1000);
 sayi*=2;
 }
}

}
