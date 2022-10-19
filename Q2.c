/*Q2: Pick two numbers and calculate their sum in binary
 * arithmetic. Make sure that there is an overflow. Write
 * a c program for the MSP430 for the above specifications
 * using a subfunction and check where the overflow bit
 * is stored.
 */

#include <msp430.h>

int sum(int a,int b);

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    int a = 0b10001000110001000; //binary arithmatic
    int b = 0b10000100000011100; // binary arithmatic

    int d = sum(a,b);

    while(1);

    return 0;
}

int sum(int a,int b)
{
    int d = a+b;

    return d;
}


