#include <stdio.h>

#define RESET       "\033[0m" 
#define BG_BLACK    "\033[40m" 
#define BG_RED      "\033[41m" 
#define BG_GREEN    "\033[42m" 
#define BG_YELLOW   "\033[43m" 
#define BG_BLUE     "\033[44m" 
#define BG_MAGENTA  "\033[45m" 
#define BG_CYAN     "\033[46m" 
#define BG_WHITE    "\033[47m" 

#define MAXSIZE 30

enum color {
    BLACK,
    RED,
    GREEN,
    YELLOW,
    BLUE,
    MAGENTA,
    CYAN,
    WHITE
};

struct image {
    int width;
    int height;
    enum color** colors;
};

void color_print(enum color col){
    switch (col)
    {
    case 0:
        printf("%s %s", BG_BLACK, RESET); 
        break;
    case 1:
        printf("%s %s", BG_RED, RESET); 
        break;
    case 2:
        printf("%s %s", BG_GREEN, RESET); 
        break;
    case 3:
        printf("%s %s", BG_YELLOW, RESET); 
        break;
    case 4:
        printf("%s %s", BG_BLUE, RESET); 
        break;
    case 5:
        printf("%s %s", BG_MAGENTA, RESET); 
        break;
    case 6:
        printf("%s %s", BG_CYAN, RESET); 
        break;
    case 7:
        printf("%s %s", BG_WHITE, RESET); 
        break;
    
    default:
        break;
    }
}

int main(){
    enum color col = BLACK;
    color_print(col);
    return 0;
}