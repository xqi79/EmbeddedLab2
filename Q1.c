/*Q1: Write a c program for the MSP430 for the following
 * specifications. Check your value in the variable, expression,
 * and memory location. Write down your explanation with the
 * appropriate screenshot.
 *
 * a. Will store an integer and increment the value (local variables)
 * b. Will store a float and decrement the value (global variables)
 * c. Will store two unsigned characters with hex values
 * (local variables) and perform two logic operations between them
 */

#include <msp430.h> 

float b = 5.0;

int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    unsigned char c = 0x0f;
    unsigned char d = 0x05;

    unsigned char e = c|d; //declared unsigned or
    unsigned char f = c&d; //declared unsigned and

    int a = 3;

    a+= 1; //increment
    b-= 1; //decrement


    return 0;
}
