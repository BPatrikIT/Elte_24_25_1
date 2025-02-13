#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "myutils.h"

char* g = "global";


void task(){
    char* f = "variable_task-local";
    printf("task: %s\t %s \n", g, f);

    for( int j=0; j<10; ++j){
        int i = rand()%3;
        if(i==2){
            int a = 100;
            printf("%d.: 1. True: %d [%d]\n", j, i, a);
        } else if (i == 1)
        {
            int b = 200;
            printf("%d.: 2. True: %d [%d]\n", j, i, b);
        } else {
            int c = 300;
            printf("%d.: 3. True: %d [%d]\n", j, i, c);
        }
        
    }
}

int task6( int );

int main() {

    srand(time(NULL));

    char* fm = "variable_main-local";
    g = "variable-global";

    printf("main: %s\t %s \n", g, fm);

    task();

/*
    printf("task6: %s\t", task6(5));
    */

    for (size_t i = 0; i < 10; i++)
    {
        task8();
    }

    printf("\ng2: %s\n", g);
    task8b();
    printf("\nmain globális érték: %s\n", g);

    return 0;
}
/*
int task6( int negal){
    -negal;
}
*/
