#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAP_SIZE 10

typedef struct {
    char *name;
    int x;
    int y;
} BusStop;

BusStop *busStops = NULL;
int busStopCount = 0;

void show_map();
void print_bus_stop();
void create_bus_stop();
void delete_bus_stop();
void save_list();
void load_list();
void fastest_road();
void free_memory();

int main() {
    int choice;
    printf("Welcome to the Bus Stop Manager!\n");
    printf("This program helps you manage bus stops in a small city.\n");

    while (1) {
        printf("\nMenu:\n");
        printf("1) Show Map\n");
        printf("2) List Bus Stops\n");
        printf("3) Create New Bus Stop\n");
        printf("4) Delete Bus Stop\n");
        printf("5) Save Bus Stops\n");
        printf("6) Load Bus Stops\n");
        printf("7) Draw Route\n");
        printf("8) Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                show_map();
                break;
            case 2:
                print_bus_stop();
                break;
            case 3:
                create_bus_stop();
                break;
            case 4:
                delete_bus_stop();
                break;
            case 5:
                save_list();
                break;
            case 6:
                load_list();
                break;
            case 7:
                fastest_road();
                break;
            case 8:
                free_memory();
                printf("Exiting the program.\n");
                return 0;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
}

void show_map() {
    char map[MAP_SIZE][MAP_SIZE];
    memset(map, ' ', sizeof(map));

    for (int i = 0; i < busStopCount; i++) {
        map[busStops[i].y - 1][busStops[i].x - 1] = 'B';
    }

    printf("  1 2 3 4 5 6 7 8 9 10\n");
    for (int i = 0; i < MAP_SIZE; i++) {
        printf("%c ", 'a' + i);
        for (int j = 0; j < MAP_SIZE; j++) {
            printf("%c ", map[i][j]);
        }
        printf("\n");
    }
}

void print_bus_stop() {
    if (busStopCount == 0) {
        printf("No bus stops available.\n");
        return;
    }

    for (int i = 0; i < busStopCount; i++) {
        printf("%d. %s (%d, %d)\n", i + 1, busStops[i].name, busStops[i].x, busStops[i].y);
    }
}

void create_bus_stop() {
    char name[100];
    int x, y;

    printf("Enter bus stop name: ");
    scanf("%s", name);
    printf("Enter coordinates (x y): ");
    scanf("%d %d", &x, &y);

    if (x < 1 || x > 10 || y < 1 || y > 10) {
        printf("Invalid coordinates. Please try again.\n");
        return;
    }

    busStops = realloc(busStops, (busStopCount + 1) * sizeof(BusStop));
    busStops[busStopCount].name = strdup(name);
    busStops[busStopCount].x = x;
    busStops[busStopCount].y = y;
    busStopCount++;
}

void delete_bus_stop() {
    int index;
    print_bus_stop();
    printf("Enter the number of the bus stop to delete: ");
    scanf("%d", &index);

    if (index < 1 || index > busStopCount) {
        printf("Invalid index. Please try again.\n");
        return;
    }

    free(busStops[index - 1].name);
    for (int i = index - 1; i < busStopCount - 1; i++) {
        busStops[i] = busStops[i + 1];
    }
    busStopCount--;
    busStops = realloc(busStops, busStopCount * sizeof(BusStop));
}

void save_list() {
    char filename[100];
    printf("Enter filename to save: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "w");
    if (!file) {
        printf("Error opening file.\n");
        return;
    }

    for (int i = 0; i < busStopCount; i++) {
        fprintf(file, "%s\n%d %d\n", busStops[i].name, busStops[i].x, busStops[i].y);
    }

    fclose(file);
    printf("Bus stops saved successfully.\n");
}

void load_list() {
    char filename[100];
    printf("Enter filename to load: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "r");
    if (!file) {
        printf("Error opening file.\n");
        return;
    }

    free_memory();
    busStopCount = 0;

    char name[100];
    int x, y;
    while (fscanf(file, "%s %d %d", name, &x, &y) == 3) {
        if (x < 1 || x > 10 || y < 1 || y > 10) {
            continue;
        }
        busStops = realloc(busStops, (busStopCount + 1) * sizeof(BusStop));
        busStops[busStopCount].name = strdup(name);
        busStops[busStopCount].x = x;
        busStops[busStopCount].y = y;
        busStopCount++;
    }

    fclose(file);
    printf("Bus stops loaded successfully.\n");
}

void fastest_road() {
    // Implementation of the fastest road drawing function
}

void free_memory() {
    for (int i = 0; i < busStopCount; i++) {
        free(busStops[i].name);
    }
    free(busStops);
    busStops = NULL;
    busStopCount = 0;
}