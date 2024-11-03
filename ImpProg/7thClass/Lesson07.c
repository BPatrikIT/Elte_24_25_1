#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*
int** szorzoTablaMatrix(int n){
    int** matrix = (int**)malloc(n * sizeof(int*));
    for (int i = 0; i < n; i++) {
        matrix[i] = (int*)malloc(n * sizeof(int));
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            matrix[i][j] = (i + 1) * (j + 1);
        }
    }
    return matrix;
}

int sum(int n){
    int sum = 0;
    for (int i = 1; i <= n; i++) {
        sum += i;
    }
    return sum;
}
*/

int pow2 (int a, int k){
    int x = 1;
    for (int i = 0; i < k; i++) {
        x *= a;
    }
    return x;
}

int* hatvanyLista(int a, int k){
    int* hatvanyok = (int*)malloc(k * sizeof(int));
    for (int i = 0; i < k; i++) {
        double x = pow2(a, (i+1));
        hatvanyok[i] = (int)x;
    }

    int* p = hatvanyok;

    return p;
}

int szamjegyCsere(char a[]){
    int n = sizeof(a) / sizeof(a[0]);
    char temp = a[0];
    a[0] = a[n-1];
    a[n-1] = temp;

    return a;
}

int main(){
    //int numbers[200];
    //int current = 0;
    
    //while (scanf("%d", &numbers[current]) != EOF)
    //{
    //    current++;
    //}

    /*
    printf("Adja meg a mátrix méretét: ");
    int n;
    scanf("%d", &n);
    int** matrix = szorzoTablaMatrix(n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d * %d = %d \t", i+1, j+1, matrix[i][j]);
        }
        printf("\n");
    }

    printf("\n");
    printf("Adja meg a sorozat hosszát: ");
    int m;
    scanf("%d", &m);
    printf("Az első %d természetes szám összege: %d\n", m, sum(m));

    */

    /*
    printf("\n");
    printf("Adja meg a maximális hatvány kitevőt: ");
    int k;
    scanf("%d", &k);
    printf("\n");
    printf("Adja meg a hatvány alapot: ");
    int a;
    scanf("%d", &a);

    int* hatvanyok = hatvanyLista(a, k);
    for (int i = 0; i < k; i++) {
        printf("%d^%d = %d\n", a, i+1, hatvanyok[i]);
    }
    */

    printf("\n");
    printf("Adjon meg egy számot: ");
    char b[100];
    scanf("%s", b);
    printf("A számjegyek cseréje után a szám: %d\n", szamjegyCsere(b));

}