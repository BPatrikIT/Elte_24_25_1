#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int generateNumber(int max){
    srand(time(0));
    return rand() % max + 1;
}

void success(int guesses, char gameMode){

    int block1;
    int block2;
    int block3;
    int block4;
    int block5;

    if (gameMode == 'e')
    {
        block1 = 1;
        block2 = 2;
        block3 = 4;
        block4 = 7;
        block5 = 9;
    }else if (gameMode == 'm') {
        block1 = 2;
        block2 = 10;
        block3 = 25;
        block4 = 50;
        block5 = 75;
    }else if (gameMode == 'h')
    {
        block1 = 10;
        block2 = 100;
        block3 = 500;
        block4 = 1000;
        block5 = 5000;
    }

    if (guesses <= block1)
    {
        printf("Did you cheat? You guessed the number in %d guess\n", guesses);
    }else if (guesses <= block2)
    {
        printf("You are a wizard! You guessed the number in %d guesses\n", guesses);
    }else if (guesses <= block3)
    {
        printf("You are a good guesser! You guessed the number in %d guesses\n", guesses);
    }else if (guesses <= block4)
    {
        printf("That was slow, better luck next time. You guessed the number in %d guesses\n", guesses);
    } else if (guesses <= block5)
    {
        printf("You are not very good at this. You guessed the number in %d guesses\n", guesses);
    }else{
        printf("You are terrible at this. You guessed the number in %d guesses\n", guesses);
    }
    
    
}

void game(char gameMode){
    srand(time(0));
    int guesses = 0;
    int number;
    if (gameMode == 'e'){
        printf("Easy mode\n");
        printf("Guess the number between 1 and 10\n");
        number = generateNumber(10);
    }else if (gameMode == 'm'){
        printf("Medium mode\n");
        printf("Guess the number between 1 and 100\n");
        number = generateNumber(100);
    }else if (gameMode == 'h'){
        printf("Hard mode\n");
        printf("Guess the number between 1 and 10000\n");
        number = generateNumber(10000);
    }

    int guess;
    do{
        printf("Enter your guess: ");
        scanf("%d", &guess);
        guesses++;
        if(guess > number){
            printf("Too high\n");
        }else if(guess < number){
            printf("Too low\n");
        }
    }while(guess != number);

    success(guesses, gameMode);    
}

int main(){
    char gameMode;
    printf("Choose game mode (e = easy, m = medium, h = hard): ");
    scanf("%c", &gameMode);

    game(gameMode);
    
}