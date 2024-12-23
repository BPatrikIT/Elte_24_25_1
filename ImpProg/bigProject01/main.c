#include <stdio.h>
#include <stdlib.h>
//#include <unistd.h>

    #define SIZE 30

    typedef enum {
            FEKETE,
            PIROS,
            ZOLD,
            SARGA,
            KEK,
            MAGENTA,
            CIAN,
            FEHER
        } color;

    #define RESET "\033[0m"
    #define BG_BLACK "\033[40m"
    #define BG_RED "\033[41m"
    #define BG_GREEN "\033[42m"
    #define BG_YELLOW "\033[43m"
    #define BG_BLUE "\033[44m"
    #define BG_MAGENTA "\033[45m"
    #define BG_CYAN "\033[46m"
    #define BG_WHITE "\033[47m"

    #define TERMINAL_CLEAR "\033[2J"
    #define TERMINAL_HOME "\033[H"

color colorConvert(char input) {
    if (input == 0) {
        return FEKETE;
    } else if (input == 1) {
        return PIROS;
    } else if (input == 2) {
        return ZOLD;
    } else if (input == 3) {
        return SARGA;
    } else if (input == 4) {
        return KEK;
    } else if (input == 5) {
        return MAGENTA;
    } else if (input == 6) {
        return CIAN;
    } else if (input == 7) {
        return FEHER;
    } else {
        return -1;
    }
}

void color_print(color c) {
    switch (c) {
        case FEKETE:
            printf("%s %s", BG_BLACK, RESET);
            break;
        case PIROS:
            printf("%s %s", BG_RED, RESET);
            break;
        case ZOLD:
            printf("%s %s", BG_GREEN, RESET);
            break;
        case SARGA:
            printf("%s %s", BG_YELLOW, RESET);
            break;
        case KEK:
            printf("%s %s", BG_BLUE, RESET);
            break;
        case MAGENTA:
            printf("%s %s", BG_MAGENTA, RESET);
            break;
        case CIAN:
            printf("%s %s", BG_CYAN, RESET);
            break;
        case FEHER:
            printf("%s %s", BG_WHITE, RESET);
            break;
        default:
            printf("Invalid color");
            break;
    }
}


typedef struct {
    int width;
    int height;
    color matrix[SIZE][SIZE];
} image;

image* load_image(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        perror("Failed to open file");
        return NULL;
    }

    image* img = (image*)malloc(sizeof(image));
    if (!img) {
        perror("Failed to allocate memory for image");
        fclose(file);
        return NULL;
    }

    fscanf(file, "%d", &img->width);
    fscanf(file, "%d", &img->height);

    for (int i = 0; i < img->height; i++) {
        for (int j = 0; j < img->width; j++) {
            int color_name = 0;
            fscanf(file, "%d", &color_name);
            img->matrix[i][j] = colorConvert(color_name);
        }
    }

    fclose(file);
    return img;
}

void image_print(image* img) {
    for (int i = 0; i < img->height; i++) {
        for (int j = 0; j < img->width; j++) {
            color_print(img->matrix[i][j]);
        }
        printf("\n");
    }
}

void free_image(image* img) {
    free(img);
}

typedef struct {
    image* frames[10];
} gif;

gif* load_gif(const char* filename) {
    gif* g = (gif*)malloc(sizeof(gif));
    if (!g) {
        perror("Failed to allocate memory for gif");
        return NULL;
    }

    char filepath[256];
    for (int i = 0; i < 10; i++) {
        snprintf(filepath, sizeof(filepath), "%s.bg%d", filename, i);
        g->frames[i] = load_image(filepath);
        if (!g->frames[i]) {
            for (int j = 0; j < i; j++) {
                free_image(g->frames[j]);
            }
            free(g);
            return NULL;
        }
    }
    return g;
}

void print_gif(gif* g) {
    for (int i = 0; i < 10; i++) {
        printf(TERMINAL_CLEAR);
        printf(TERMINAL_HOME);
        image_print(g->frames[i]);
        sleep(1);
    }
}

void free_gif(gif* g) {
    for (int i = 0; i < 10; i++) {
        free_image(g->frames[i]);
    }
    free(g);
}

int main()
{
    image_print(load_image("input.txt"));
    free_image(load_image("input.txt"));
    char filename[256];
    printf("\nType the name of the gif file: ");
    scanf("%s", filename);
    gif* g = load_gif(filename);
    if (g) {
        print_gif(g);
        free_gif(g);
    }
}