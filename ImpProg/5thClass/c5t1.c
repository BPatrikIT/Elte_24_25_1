#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define N 5
#define DIM 10
#define BUFFER 256

void arr_wsum( int arr[], size_t n);
void arr_wavg( int arr[], int w[], size_t n);
void arr_switch( int arr[], size_t n);
void lineCounter();


int main(){
/*
    int arr1[N];
    int arr2[N] = {0,0,0,0,0};
    int arr3[N] = {0};
    int arr4[N] = {1};
    int arr5[N] = {2,3}; 
    for (int i = 0; i < N; i++)
    {
        printf("%d \t %d \t %d \t %d \t %d \t %d \n", arr2[i], arr3[i], arr4[i], arr5[i], arr1[i], i+1);
    }
    
    int arr2D[2][3] = {{1,2,3},{4,5,6}};
    for (int i = 0; i < 2; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            printf("%d ", arr2D[i][j]);
        }
        printf("\n");
    }
    
    int arr[] = {8,6,4,2,0,9,7,5,3,1};
    size_t n = sizeof(arr)/sizeof(arr[0]);
    printf("Size of arr: %lu\n", n);
    
    int sum = 0;
    for (size_t i = 0; i < n; i++)
    {
        sum += arr[i];
    }
    printf("Sum of arr: %d\n", sum);
    
    arr_wsum(arr, n);
    int w[] = {1,1,1,2,2,2,3,3,3,4};
    arr_wavg(arr, w, n);
    */

   /*
    char word1[] = "kombajn";
    char word2[] = "kombinatorika";

    size_t s1 = sizeof(word1)/sizeof(word1[0]);
    size_t s2 = sizeof(word2)/sizeof(word2[0]);
    printf("%s: %lu\n%s: %lu\n\n", word1, s1, word2, s2);

    for (size_t i = 0; i < ((s1<s2)?s1:s2); i++)
    {
        if (tolower(word1[i]) < tolower(word2[i]))
        {
            printf("%s is before: %s\n", word1, word2);
            break;
        }
        else if (tolower(word1[i]) > tolower(word2[i]))
        {
            printf("%s is before: %s\n", word2, word1);
            break;
        }
    }

    if (strcmp (tolower(word1), tolower(word2)) == 0)
    {
        printf("The words are equal\n");
    }
    else if (strcmp (tolower(word1), tolower(word2)) < 0)
    {
        printf("%s is before: %s\n", word1, word2);
    }
    else
    {
        printf("%s is before: %s\n", word2, word1);
    }
    */

   /*
    //char word[BUFFER+1];
    char word[DIM+1];
    printf("Enter a word: ");
    fgets(word, DIM+1, stdin);
    //scanf("%s", word);

    printf("The word is: %s\n", word);
    size_t strs = strlen(word);
    printf("The length of the word is: %lu\n", strs);
    */

    int arr[] = {8,6,4,2,0,9,7,5,3,1};
    size_t n = sizeof(arr)/sizeof(arr[0]);
    //arr_switch(arr, n);
    lineCounter();
    

    return 0;
}

void arr_wsum( int arr[], size_t n){
    int weight[DIM] = {1,1,1,2,2,2,3,3,3,4};
    int sums = 0;
    for (size_t i = 0; i < n; i++)
    {
        sums += arr[i] * weight[i];
    }
    printf("Weighted sum of arr: %d\n", sums);
}

void arr_wavg( int arr[], int w[], size_t n){
    int sums = 0;
    for (size_t i = 0; i < n; i++)
    {
        sums += arr[i] * w[i];
    }
    printf("Weighted average of arr: %.2f\n", (float)sums/n);
}

void arr_switch( int arr[], size_t n){
    int min = arr[0];
    int max = arr[0];
    int min_i = 0;
    int max_i = 0;
    for (size_t i = 1; i < n; i++){
        if (arr[i] < min) {
            min = arr[i];
            min_i = i;
        }
        if (arr[i] > max) {
            max = arr[i];
            max_i = i;
        }
    }

    arr[min_i] = max;
    arr[max_i] = min;

    printf("The new array is: \n");

    for (size_t i = 0; i < n; i++)
    {
        printf("%d \n", arr[i]);
    }
}

void lineCounter(){
    printf("Enter a text, type exit to exit: \n");
    _Bool exit = 0;
    int lines = 0;
    //do
    //{
    //char line[BUFFER+1];
    //fgets(line, BUFFER+1, stdin);
    //size_t len = strlen(line);
    
    //} while (/* condition */);
   
}