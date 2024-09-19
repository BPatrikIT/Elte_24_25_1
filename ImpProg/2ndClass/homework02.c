#include <stdio.h>
#include <stdbool.h>
#include <math.h>

int main(){

    //1st task
    int number1 = 0;
    printf("Please enter a number: ");
    scanf("%d", &number1);

    if (number1 == 0)
    {
        printf("The number is 0\n");
    }
    else if (number1 > 0)
    {
        printf("The number is positive\n");
    }
    else
    {
        printf("The number is negative\n");
    }

    //2nd task
    printf("Options: 1: Celsious to Fahrenheit, 2: Fahrenheit to Celsious\n");
    int cToF;
    scanf("%d", &cToF);
    do
    {
        if (cToF == 1)
        {
            float celsious;
            printf("Please enter the temperature in Celsious: ");
            scanf("%f", &celsious);
            float fahrenheit = celsious * 9/5 + 32;
            printf("The temperature in Fahrenheit: %.2f\n", fahrenheit);
        }
        else if (cToF == 2)
        {
            float fahrenheit;
            printf("Please enter the temperature in Fahrenheit: ");
            scanf("%f", &fahrenheit);
            float celsious = (fahrenheit - 32) * 5/9;
            printf("The temperature in Celsious: %.2f\n", celsious);
        }
        else
        {
            printf("Invalid input! Please enter 1 or 2!\n");
        }
    } while (cToF != 1 && cToF != 2);

    for (int i = -20; i <= 200; i+=10)
    {
        float fahrenheit;
            fahrenheit = i;
            float celsious = (fahrenheit - 32) * 5/9;
            printf("The temperature in Fahrenheit: %f - Celsious: %.2f\n", fahrenheit, celsious);
    }    
}