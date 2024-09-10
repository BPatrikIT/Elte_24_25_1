#include <stdio.h>

int main() {
    printf("Hello World\n");

    int a = 10;
    int b = 20;
    int c = a + b;
    int d = a - b;
    int e = a * b;
    int f = a / b;

    printf("%d\n" , 3+4); // %d is format specifier for integer

    printf("Sum is %d\n" , c);
    printf("Difference is %d\n" , d);
    printf("Product is %d\n" , e);
    printf("Division is %d\n" , f);

    printf("%d + %d = %d\n" , a, b, c); // %a, %b, %c are format specifiers for integer

    return 0;
    
    // return 0; // This is optional

    /*
    Multi line comment
    */
}