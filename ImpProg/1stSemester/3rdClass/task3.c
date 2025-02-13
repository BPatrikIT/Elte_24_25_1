#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    printf("Think a number! Please enter the maximum number: ");
    int max;
    scanf("%d", &max);
    _Bool success = 0;
    printf("Did you thing to the number %d? (Y: Yes, H: Too High, L: Too Low): ", max/2);
    char answer;
    scanf(" %c", &answer);
    int min = 0;
    while (!success)
    {
        switch (answer)
        {
        case 'Y':
            success = 1;
            break;
        case 'H':
            max /= 2;
            break;
        case 'L':
            min = max/2;
            break;
        default:
            printf("Invalid input! Please enter a valid input: ");
            scanf(" %c", &answer);
            break;
        }
        printf("Did you thing to the number %d? (Y: Yes, H: Too High, L: Too Low): ", (min+max)/2);
        scanf(" %c", &answer);

    }
    printf("Your number is %d\n", (min+max)/2);
}