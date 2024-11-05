#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int charToLowerToUpper(char c) {
    if (c >= 'a' && c <= 'z') {
        return c - 'a' + 'A';
    }
    if (c >= 'A' && c <= 'Z') {
        return c - 'A' + 'a';
    }
    return c;
}

int main() {
    char str[] = "Hello, World!";
    printf("%s\n", str);
    for (int i = 0; i < strlen(str); i++) {
        str[i] = charToLowerToUpper(str[i]);
    }
    printf("%s\n", str);
    
}