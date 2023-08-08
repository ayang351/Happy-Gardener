#ifndef GAME_H
#define GAME_H

#include "gba.h"

#define MAPWIDTH 256
#define MAPHEIGHT 256


typedef struct {
    int x;
    int y;
    int width;
    int height;
    int veggietype;
    int highlight;
} VEGGIE;

typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int active;
    int direction;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int shadowIndex;
    int row;
    int column;
} ENEMY;

typedef struct {
    int x1;
    int y1;
    int x2;
    int y2;
    int xp;
    int pixelWidth;
    int row;
    int column;
    int yp;
    int pixelHeight;
    int planted;
    int vegType;
    int active;
} PLOT;

typedef struct {
    int x1;
    int width;
    int y1;
    int height;
    int horizontal;
    int vertical;
    int active;
    int shadowIndex;
} FENCE;




#define VEGGIENUM 4
#define PLOTNUM 24
#define FENCENUM 16
#define ENEMYNUM 14
VEGGIE veggies[VEGGIENUM];
PLOT plotArea[PLOTNUM];
FENCE fences[FENCENUM];
ENEMY enemies[ENEMYNUM];

extern int index[PLOTNUM];
extern int second;
extern int minute;


extern int totalPlanted;

extern int metRequirement;
extern int modified;


#endif