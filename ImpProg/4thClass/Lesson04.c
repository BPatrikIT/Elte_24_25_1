#include <stdio.h>
#include <ctype.h>
#include <math.h>

#ifndef M_PI
    #define M_PI 3.14159265358979323846
#endif

void operator( void );
void littleBig( void );
void littleBig2( void );
void basic_math( int, int );
int pow2( int, int );
void circle( double );
void dateConvert( int );
void aritmeticVariableChange( int, int );
void bitChange( int );

int main(){

    //operator();
    //operator(42);
    //littleBig();
    //littleBig2();
    //basic_math(3, 4);
    /*
    int a, b;
    printf("Enter two numbers: ");
    int units = scanf("%d %d", &a, &b);
    printf("Successfully read %d numbers\n", units);
    basic_math(a, b);
    */

    /*
    double r;
    printf("Enter the radius of teh circle:");
    scanf("%lf", &r);
    circle(r);
    */

    /*
    int date;
    printf("Enter a date in the format YYYYMMDD: ");
    scanf("%d", &date);
    dateConvert(date);
    */

    /*
    int a, b;
    printf("Enter two numbers: ");
    scanf("%d %d", &a, &b);
    aritmeticVariableChange(a, b);
    */

    int a;
    printf("Enter a number: ");
    scanf("%d", &a);
    bitChange(a);

    return 0;
}

void operator( void ){
    int i = 3;
    int j = ++i;
    printf("i: %d, j: %d\n", i, j);
    i = 3;
    j = i++;
    printf("i: %d, j: %d\n", i, j);
}

void littleBig( void ){
    char c;
    printf("Enter a word: ");
    do {
        scanf("%c", &c);

        /*
        int i;
        scanf("%d", &i); // egy szám beolvasása
        scanf(" %d", &i); // egy szám beolvasása és a whitespace karakterek kihagyása
        scanf("%d ", &i); // egy szám beolvasása, addig amíg nem talál whitespace karaktert
        */

        if (isalpha(c)) {
            if (isupper(c)) printf("%c", tolower(c));
            if (islower(c)) printf("%c", toupper(c)); 
        }
    } while (c != '\n');
    printf("\n");
}

void littleBig2( void ){
    char c;
    int in;
    printf("Enter a word: ");
    do {
        c = getchar();
        in = c;

        if (isalpha(c)) {
            if (isupper(c)) printf("%c", tolower(c));
            if (islower(c)) printf("%c", toupper(c)); 
        }
    } while (in != EOF);
    printf("\n");
}

int pow2 ( int a, int b ){
    for (int i = 1; i < b; i++)
    {
        a *= a;
    }

    return a;
}

void basic_math( int a, int b ){
    printf("Sum: %d\n", a + b);
    printf("Difference: %d\n", a - b);
    printf("Product: %d\n", a * b);
    printf("Quotient: %d\n", a / b);
    printf("Remainder: %d\n", a % b);
    printf("Power: %d\n", pow2(a, b));
}

void circle( double r ){
    printf("Radius: %.2f\n", r);
    printf("Diameter: %.2f\n", 2 * r);
    printf("Circumference: %.2f\n", 2 * M_PI * r);
    printf("Area: %.2f\n", M_PI * r * r);
}

void dateConvert( int date ){
    int year = date / 10000;
    int month = (date % 10000) / 100;
    int day = date % 100;
    printf("Year: %d, Month: %d, Day: %d\n", year, month, day);
}

void aritmeticVariableChange( int a, int b ){
    a = a + b;
    b = a - b;
    a = a - b;
    printf("a: %d, b: %d\n", a, b);
}

void bitChange( int a ){
    int b = ~a;
    printf("a: %d, bits: %d\n", a);
    
}