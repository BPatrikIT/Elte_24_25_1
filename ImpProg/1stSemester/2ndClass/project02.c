#include <stdio.h>
#include <stdbool.h>

int main(){
    /*
    //1st task
    int num = 0;
    printf("The start value of the number: %d\n", num);

    printf("Please enter a number: ");
    scanf("%d", &num);
    if (num % 2 == 0)
    {
        printf("The %d is even\n", num);
    }
    else
    {
        printf("The %d is odd\n", num);
    }

    ( num%2 == 0 ) ? printf("The %d is even\n", num) : printf("The %d is odd\n", num);
    //*/

    int num2 = 0;
    printf("Please enter an even number: ");
    scanf("%d", &num2);
    while (num2 % 2 != 0)
    {
        printf("The number is not even, please enter an even number: ");
        scanf("%d", &num2);
    }
    printf("The %d is even\n", num2);

    int num3 = "123kkk";
    printf("The value of num3: %d\n", num3);

    int num4;
    scanf("%d", &num4);
    printf("The value of num4: %d\n", num4);
}