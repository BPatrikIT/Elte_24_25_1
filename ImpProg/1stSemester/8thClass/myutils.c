#include <stdio.h>

#include "myutils.h"

extern char* g;

static int g2 = 11;  // Láthatóság csak ebben a fájlban

void task8(){
    static int counter = 0;
    counter++;
    printf("Static változó: %d\n", counter);
}

void task8b(){
    printf("Globalis valtozo: %s\n", g);
    g="global util";
    printf("Statikus globalis valtozo: %d\n", g2);
}
/*
int* task8c();

void swap( int *, int *);

void bigger( int *, int *);
*/