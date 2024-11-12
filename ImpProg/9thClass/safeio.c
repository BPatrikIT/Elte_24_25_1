#include <stdio.h>
#include <string.h>

#include "shared.h"

// Bemeneti stream kiürítő
void clear_stream(){
    int c;
    while((c=getchar()) != EOF && c != '\n');
}

// Biztonságos string beolvasó
char* read_string(char text[]){
    char* fgets(text, BUFFER, stdin);
    if (c == NULL) return c;

    if (strchr(text, '\n') != NULL)
    {
        *strchr(text, '\n')[0] = '\0';
    } else {
        clear_stream();
    }
    

    return c;
}