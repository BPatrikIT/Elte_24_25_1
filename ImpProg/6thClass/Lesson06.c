#include <stdio.h>

#define BUFFER 10

int arr_sum( int *t, size_t n){
    //int n2 = sizeof*t / sizeof(*t);
    //printf("A tomb ismert merete: %lu, szamolt merete: %d\n", n, n2);
    int sum = 0;
    for (size_t i = 0; i < n; i++){
        sum += t[i];
    }
    return sum;
}

int arr_sum2( int *t, int *end){
    int sum = 0;
    for ( ; t < end; t++){
        sum += *t;
    }
    return sum;
}

int arr_avg( int *t, int *end){
    int avg = 0;
    for ( int *i = t; i < end; i++){
        avg += *i;
    }
    return avg / (end - t);
}

int* local_point(){
    int local = 10;
    int *p = &local;
    return p;

}

int pointer_comparator(int *p1, int *p2){
    return (p1 > p2) - (p1 < p2);
}

    int main() {
        /*
        int* p;
        int * p;
        int *p;

        int *r, *q;
        */
        /*
        int i = 5;
        printf("Az i memoriacime %p es az erteke %d\n", (void*)&i, i); // %p pointer, %d integer

        int *p = &i;
        printf("A p memoriacime %p es az erteke %p\n", (void*)&p, (void*)p);

        i++;
        printf("\nAz i direkt inkrementalasa utan\n");
        printf("Az i memoriacime %p es az erteke %d\n", (void*)&i, i); // %p pointer, %d integer

        (*p)++;
        printf("\nAz i pointerrel inkrementalasa utan\n");
        printf("Az i memoriacime %p es az erteke %d\n", (void*)&i, i); // %p pointer, %d integer
        printf("A p memoriacime %p es az erteke %p\n", (void*)&p, (void*)p);
        */

        /*
        int j = 12;
        int *p1 = &j; // p1 j-re mutat
        int *p2 = p1; // p2 ugyanoda mutat, mint p1
        int **p3 = &p1; // p3 p1-re mutat
        printf("eredeti j = %d\n", j);
        printf("p2 inkrementalja j-t: %d\n", ++(*p2));
        printf("p3 inkrementalja j-t: %d\n", ++(*(*p3)));
        */

        /*
        void *pg = &pg;
        printf("A pg memoriacime %p es az erteke %p\n", (void*)&pg, pg);
        printf("Int pointer: %lu bajt\n", sizeof(int*));
        printf("Char pointer: %lu bajt\n", sizeof(char*));
        printf("Double pointer: %lu bajt\n", sizeof(double*));
        printf("Void pointer: %lu bajt\n", sizeof(void*));
        printf("pg pointer: %lu bajt\n", sizeof(pg));
        */

        int *k = local_point();
        printf("A k memoriacime %p es a mutatott erteke %d\n", (void*)&k, *k);

        int array[BUFFER] = {1, 2, 3, 4, 5, 1, 2, 3, 4, 5};
        int n = sizeof(array) / sizeof(*array);
        printf("A tomb ismert merete: %d, szamolt merete: %d\n", BUFFER, n);
        printf("A tömb összege: %d\n", arr_sum(array, n));
        printf("A tömb összege: %d\n", arr_sum2(array, array + BUFFER));
        printf("A tömb átlaga: %d\n", arr_avg(array, array + BUFFER));

        printf("A k memoriacime %p es a mutatott erteke %d\n", (void*)&k, *k);

        int* pNull = NULL;
        printf("A pNull memoriacime %p es a mutatott erteke %p\n", (void*)&pNull, (void*)pNull);
        //printf("A pNull mutatott erteke: %d\n", *pNull);

        // scanf(const char *format, Object *arg(s))

        int p10[BUFFER];
        int *p20 = p10;
        // p10+=3; // hibas
        p20+=3;
        switch( pointer_comparator(p10, p20)) {
            case -1:
                printf("Az első paraméter a kisebb indexű\n");
                break;
            case 0:
                printf("A két mutató azonos helyre mutat\n");
                break;
            case 1:
                printf("A második paraméter a kisebb indexű\n");
                break;
        }

        return 0;
    }