
int i;

void main() {

TRISB=0X00;
PORTB=0X00;

while(1){

 for(i=1;i<=128;i*=2){

 PORTB=PORTB+i;
 Delay_ms(1000);
 }
 PORTB=0;
}

}