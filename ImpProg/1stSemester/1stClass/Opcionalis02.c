#include <stdio.h>
#include <stdbool.h>

int main(){
    printf("Which task will be executed?\n");
    int task;
    scanf("%d", &task);

        // Variables before the switch, does not work in the switch!!
        char FirstName[] = "Patrik";
        char LastName[] = "Bartok";
        int case2Number1;
        int case2Number2;
        int case2Number3;
        float case3Float1;
        float case3Float2;
        float case3Float3;
        int case3Int1;
        int case3Int2;
        int case3Int3;
        int a;
        int b;
        int r;
        int circleK;
        int circleT;
        int squareK;
        int squareT;
        float pi = 3.1415;

    switch(task){
        case 1: // This is the first optional task
            printf("My name is: %s %s\n", FirstName, LastName);
            break;
        case 2: // This is the second optional task
            printf("Write the value of 3 numbers:\n");
            printf("Number 1: ");
            scanf("%d", &case2Number1);
            printf("Number 2: ");
            scanf("%d", &case2Number2);
            printf("Number 3: ");
            scanf("%d", &case2Number3);
            printf("The Product of the numbers is: %d\n", case2Number1*case2Number2*case2Number3);
            break;
        case 3: // This is the third optional task
            printf("Do you want to use float numbers? (y/n)\n");
            char answer;
            do
            {
                scanf(" %c", &answer);
                if (answer != 'y' && answer != 'n')
                {
                    printf("Please write y or n!\n");
                }                
            } while (answer != 'y' && answer != 'n');
            
            if (answer == 'y')
            {
                printf("Write the value of 2 numbers:\n");
                printf("a: ");
                scanf("%f", &case3Float1);
                printf("b: ");
                scanf("%f", &case3Float2);
                case3Float3 = case3Float1/case3Float2;
                printf("The division of the numbers is: %.2f\n", case3Float3);
            }else
            {
                bool isFloat;
                do
                {
                    printf("Write the value of 2 numbers:\n");
                    printf("Number 1: ");
                    if (scanf("%d", &case3Int2) != 1) { // Check if the input is an integer - convert the input to integer (if it starts with a number)
                        printf("Invalid input! Please enter integer numbers.\n");
                        isFloat = false;
                        case3Int1 = 0;
                        case3Int2 = 0;
                        while ((getchar()) != '\n'); // Clear input buffer
                        continue; // Skip the rest of the loop and start again
                    } else {
                        while (getchar() != '\n'); // Clear input buffer
                        printf("Number 2: ");
                        if (scanf("%d", &case3Int2) != 1) { // Check if the input is an integer - convert the input to integer (if it starts with a number)
                            printf("Invalid input! Please enter integer numbers.\n");
                            isFloat = false;
                            case3Int1 = 0;
                            case3Int2 = 0;
                            while ((getchar()) != '\n'); // Clear input buffer
                            continue; // Skip the rest of the loop and start again
                        } else {    
                            case3Int3 = case3Int1/case3Int2;
                            printf("The division of the numbers is: %d\n", case3Int3);
                            isFloat = true;
                        }
                    }
                    printf("case3Int1: %d\n", case3Int1);
                } while (isFloat == false);
            }
            break;
        case 4: // This is the fourth optional task
            printf("Wirte the a side of the square (cm):\n");
            scanf("%d", &a);
            printf("Write the b side of the square (cm):\n");
            scanf("%d", &b);
            squareK = 2*(a+b);
            squareT = a*b;
            printf("Write the radius of the circle (cm):\n");
            scanf("%d", &r);
            circleK = 2*pi*r;
            circleT = pi*r*r;
            printf("The perimeter of the square is: %d\n cm", squareK);
            printf("The area of the square is: %d\n cm2", squareT);
            printf("The perimeter of the circle is: %d\n cm", circleK);
            printf("The area of the circle is: %d\n cm2", circleT);
            break;
        case 5:
            printf("Hello %s %s\n", FirstName, LastName);
            break;
        default:
            printf("Default\n");
    }
}