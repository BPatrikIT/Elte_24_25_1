#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void types(){
    printf("Short int: %lu\n", sizeof(short int));
    printf("Int: %lu\n", sizeof(int));
    printf("Long int: %lu\n", sizeof(long int));
    printf("Long long int: %lu\n", sizeof(long long int));
}

void op_chain(){
    int a, b, c;
    printf("\nOperator == \n");
    a = 1;
    b = 1;
    c = 1;
    printf(" %d == %d == %d is ", a, b, c);
    ( (a == b) && (b == c ) ) ? printf("True\n") : printf("False\n");

    a = 2;
    b = 1;
    c = 0;
    printf(" %d == %d == %d is ", a, b, c);
    ( (a == b) && (b == c ) ) ? printf("True\n") : printf("False\n");

    a = 0;
    b = 5;
    c = 7;
    printf(" %d == %d == %d is ", a, b, c);
    ( (a == b) && (b == c ) ) ? printf("True\n") : printf("False\n");

    a = 0;
    b = 0;
    c = 0;
    printf(" %d == %d == %d is ", a, b, c);
    ( (a == b) && (b == c ) ) ? printf("True\n") : printf("False\n");
}

void decrement();

void leap_year(){
    int year;
    printf("Enter a year: ");
    scanf("%d", &year);

    if(year % 4 == 0){
        if(year % 100 == 0){
            if(year % 400 == 0){
                printf("%d is a leap year\n", year);
            }else{
                printf("%d is not a leap year\n", year);
            }
        }else{
            printf("%d is a leap year\n", year);
        }
    }else{
        printf("%d is not a leap year\n", year);
    }
}

void leap_year_withoutIf(){

    int year;
    printf("Enter a year: ");
    scanf("%d", &year);
    _Bool isLY = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
    printf("%d is %s a leap year\n", year, isLY ? "" : "not");
}


int main(){
    //types();

    //op_chain();

    //decrement();

    //leap_year();
    //leap_year_withoutIf();

    srand(time(NULL));

    for (size_t i = 0; i < 10; i++)
    {
        printf("%d\n", rand() % 6+1);
    }
    

    return 0;
}

void decrement(){
    for(int i = 10; i >= 0; i--){
        printf("%d\n", i);
    }

    for(unsigned int i = 11; i >= 1; i--){
        printf("%u\n", i-1);
    }
}