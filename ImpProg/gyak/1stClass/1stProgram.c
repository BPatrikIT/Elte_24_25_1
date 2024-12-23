#include <stdio.h> //Input-Output
#include <stdbool.h> //Bool
#include <string.h> //String operations

int main() {
    //Comment
    /*
    Multiline Comment
    */
    printf("Hello World!\n");
    int a = 2;
    int b = 3;
    printf("%i\n", a + b);

    // Create variables
    int myNum = 15;            // Integer (whole number)
    float myFloatNum = 5.99;   // Floating point number
    char myLetter = 'D';       // Character

    // Print variables
    printf("%i\n", myNum);
    printf("%f\n", myFloatNum);
    printf("%c\n", myLetter);

    /*
    ASCI
    A-Z ~ 65-90
    a-z ~ 97-122

    Implicit Conversion (automatically)
    Explicit Conversion (manually)
    */

    printf("Bartok Patrik\n");
    printf("%i\n", 3*2*5);
    printf("%.1f\n", (float) 3/2);

    /*
    ternary operator
    int time = 20;
    if (time < 18) {
        printf("Good day.");
    } else {
        printf("Good evening.");
    }

    ==

    int time = 20;
    (time < 18) ? printf("Good day.") : printf("Good evening.");
    */

    /*
    Data type sizes:
    Int: 2-4 byte
    char: 1 byte
    bool: 1 byte
    float: 4 byte
    double: 8 byte

    int length = sizeof(myNumbers) / sizeof(myNumbers[0]);

    int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };
    */

    /*
    String operations

    strlen() - Number of characters
    strcat() - Add 2 stings together
    strcpy() - Copy a string to another
    strcmp() - It gives 0 if the 2 string are equal
    */

    /*
    scannf() - User input
    scanf("%d", &myNum);

    printf("Type your full name: \n"); - It reads only a word
    fgets(fullName, sizeof(fullName), stdin); - For strings. It reads a line

    */

    /*
    Memmory adresses

    int myAge = 43;
    printf("%p", &myAge); // Outputs 0x7ffe5367e044
    
    */

    /*
    Read a file
    
    FILE *fptr;

    fptr = fopen("filename.txt", "r");

    fgets(myString, 100, fptr);

    // Close the file
    fclose(fptr);
    */


    return 0;
}