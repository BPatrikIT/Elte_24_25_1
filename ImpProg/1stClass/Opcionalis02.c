#include <stdio.h>

int main(){
    printf("Which task will be executed?\n");
    int task;
    scanf("%d", &task);

        // Variables before the switch, does not work in the switch!!
        char FirstName[] = "Patrik";
        char LastName[] = "Bartok";
        int a;
        int b;
        int c;

    switch(task){
        case 1: // This is the first optional task
            printf("My name is: %s %s\n", FirstName, LastName);
            break;
        case 2: // This is the second optional task
            printf("Write the value of 3 numbers:\n");
            printf("a: ");
            scanf("%d", &a);
            printf("b: ");
            scanf("%d", &b);
            printf("c: ");
            scanf("%d", &c);
            printf("The Product of the numbers is: %d\n", a*b*c);
            break;
        case 3:
            printf("Case 3\n");
            break;
        default:
            printf("Default\n");
    }
}