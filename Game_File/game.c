#include "sprites.h"
#include "mode0.h"
#include "game.h"
#include "print.h"

//import collision map
#include "collisionmap.h"

//sound
#include "sound.h"
#include "play.h"

//color at a certain bitmap location
inline unsigned char colorAt(int x, int y);

//pointer to collision map palette
unsigned char* collisionMap; 

OBJ_ATTR shadowOAM[128];

int hOff;
int vOff;
int h1Off;
int v1Off;

int minute;
int second;

//player sprite
SPRITE player;

//stores the number of each seedling planted
int carrotCount; //carrot
int cornCount;   //corn
int tomatoCount;    //tomato
int eggplantCount;  //eggplant

//tracks the number of seeds planted
int totalPlanted;

//stores a true/false value of whether all seedlings have been planted
int metRequirement;

//number of vertical fences
int verticalFences;

//numner of horizontal fences
int horizontalFences;

//number of fences available to be used for level 1
int level1FenceNum;
//number of enemies for level 1
int level1EnemyNum;

//number of fences available to be used for level 2
int level2FenceNum;
//number of enemies for level 2
int level2EnemyNum;

//number of fences available to be used for level 2
int level3FenceNum;
//number of enemies for level 2
int level3EnemyNum;

//tracks wether the tilemap was modified in the current level
int modified;

//saves a list of screenblock indexes where the tilemap was modified
int index[PLOTNUM];

//veggie requirement
int carrotR;
int tomatoR;
int eggplantR;
int cornR;


//tracks the current palette spritesheet is using
int paletteNum;

//tracks the number of fences set
int fenceNum;

//function prototypes
void initGame1();
void initLevel1();
void updateGame1();
void initGame2();
void initLevel2();
void updateGame2();
void initGame3();
void initLevel3();
void updateGame3();
int canMoveLeft();
int canMoveRight();
int canMoveUp();
int canMoveDown();
void LevelRequirement();
void updatePlayer();
void updateFence(int num);
void updateInventory();
void updatePlot();
void updateFenceLimit(int limit);
void updateEnemy(int num);
void LevelRequirement();
void updateRequirements();
void stopTimer();
void startTimer();
void incrementVeggieType(int plotIndex);
void decrementVeggieReq(int plotIndex);

void saveTilemapModData(int index);

typedef enum {DOWN, UP, RIGHT, LEFT} PLAYERDIR;
typedef enum {L, R, D, U} ENEMYDIR;
typedef enum {CARROT=1, CORN=2, EGGPLANT=3, TOMATO=4} veg;
int selectVeggie;


//collision check
inline unsigned char colorAt(int x, int y){
    return collisionMap[OFFSET(x, y, MAPWIDTH)];

}

//Player Movements

//Left Movement
int canMoveLeft() {

    //determines where the 4 corners are
    int left = player.x;
    int top = player.y;
    int bottom = player.y + player.height - 1;

    return colorAt(left - player.dx, top) && colorAt(left - player.dx, bottom);
}

//Right Movement
int canMoveRight() {
    int right = player.x + player.width - 1;
    int top = player.y;
    int bottom = player.y + player.height - 1;
    return colorAt(right + player.dx , bottom) && colorAt(right + player.dx, top);
}

//Up movement
int canMoveUp() {
    int left = player.x;
    int right = player.x + player.width - 1;
    int top = player.y;
    return colorAt(left, top - player.dy) && colorAt(right, top - player.dy);
}

//Down movement
int canMoveDown() {
    int left = player.x;
    int right = player.x + player.width - 1;
    int bottom = player.y + player.height - 1;
    return colorAt(left, bottom + player.dy) && colorAt(right, bottom + player.dy);

}

//initialize level 1
void initGame1() {
    collisionMap = (unsigned char*) collisionmapBitmap;

    hOff = 0;
    vOff = 0;
    h1Off = 0;
    v1Off = 0;
    selectVeggie = 1;

    for (int i = 0; i < PLOTNUM; i++) {
        index[i] = 0;
    }


    carrotCount = 0;
    cornCount = 0;
    tomatoCount = 0;
    eggplantCount = 0;

    metRequirement = 0;
    modified = 0;
    paletteNum = 0;
    fenceNum = 0;
    second = 0;
    minute = 0;
    totalPlanted = 0;

   initLevel1();
}

//initialize level 1 functions
initLevel1() {
    level1FenceNum = FENCENUM - 5;
    level1EnemyNum = ENEMYNUM - 10; 

    carrotR = 3;
    eggplantR = 3;
    cornR = 3;
    tomatoR = 3;

    initPlayer();
    initEnemy();
    initInventory();
    initPlot();
    initFences();
}

//initialize level 2
void initGame2() {
    collisionMap = (unsigned char*) collisionmapBitmap;

    hOff = 0;
    vOff = 0;
    h1Off = 0;
    v1Off = 0;
    selectVeggie = 1;

    for (int i = 0; i < PLOTNUM; i++) {
        index[i] = 0;
    }


    //counts the number of veggies planted
    carrotCount = 0;
    cornCount = 0;
    tomatoCount = 0;
    eggplantCount = 0;

    metRequirement = 0;
    modified = 0;
    paletteNum = 1;
    fenceNum = 0;
    second = 0;
    minute = 0;
    totalPlanted = 0;


   initLevel2();
}

//initialize level 2 functions
initLevel2() {
    level2FenceNum = FENCENUM - 8;
    level2EnemyNum = ENEMYNUM - 6; 

    carrotR = 5;
    eggplantR = 4;
    cornR = 5;
    tomatoR = 3;

    initPlayer();
    initEnemy();
    initInventory();
    initPlot();
    initFences();
}

//initialize level 3
void initGame3() {
    collisionMap = (unsigned char*) collisionmapBitmap;
    hOff = 0;
    vOff = 0;
    h1Off = 0;
    v1Off = 0;
    selectVeggie = 1;

    for (int i = 0; i < PLOTNUM; i++) {
        index[i] = 0;
    }

    //counts the number of veggies planted
    carrotCount = 0;
    cornCount = 0;
    tomatoCount = 0;
    eggplantCount = 0;
    modified = 0;
    metRequirement = 0;
    paletteNum = 2;
    fenceNum = 0;

    second = 0;
    minute = 0;
    totalPlanted = 0;

   initLevel3();
}
//initialize level 3 functions
initLevel3() {
    level3FenceNum = FENCENUM - 10;
    level3EnemyNum = ENEMYNUM - 3; 

    carrotR = 4;
    eggplantR = 3;
    cornR = 5;
    tomatoR = 6;

    initPlayer();
    initEnemy();
    initInventory();
    initPlot();
    initFences();
}

//checks whether the level requirements are met
void LevelRequirement() {
    if ((carrotCount >= carrotR) && (tomatoCount >= tomatoR) && (eggplantCount >= eggplantR) && (cornCount >= cornR)) {
        metRequirement = 1;
    }
}

//initialize player sprite
void initPlayer() {
    player.width = 24;
    player.height = 24;

    //starting position
    player.x = (240 / 2) - player.width; 
    player.y = ((160 / 2) + 8) - player.height;

    //number of frames
    player.numOfFrames = 3;

    //tracks the current frame
    player.frame = 0;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.dx = 1;
    player.dy = 1;

    //tracks whether the player is moving
    player.isMoving = 1;
}

//initialize inventory
void initInventory() {
    //init carrot + box
    for (int i = 0; i < VEGGIENUM; i++) {
        veggies[i].x = 3;
        veggies[i].width = 24;
        veggies[i].height = 24;
    }
    //carrot
    veggies[0].y = 20;
    veggies[0].veggietype = CARROT;

    //corn
    veggies[1].y = 20 + veggies[1].height;
    veggies[1].veggietype = CORN;

    //eggplant
    veggies[2].y = 20 + veggies[1].height * 2;
    veggies[2].veggietype = EGGPLANT;

    //tomato
    veggies[3].y = 20 + veggies[1].height * 3;
    veggies[3].veggietype = TOMATO;

}
//Stores all plantable sections inside an array
void initPlot() {
    for (int i = 0; i < PLOTNUM; i++) {
        plotArea[i].planted = 0;
        plotArea[i].pixelHeight = 16;
        plotArea[i].pixelWidth = 16;
    }

    //first row
    int initial = 10;
    int column = 1;
    for (int i = 0; i < 8; i++) {
        plotArea[i].x1 = initial;
        plotArea[i].x2 = plotArea[i].x1 + 1;
        plotArea[i].y1 = 14;
        plotArea[i].y2 = 15;
        plotArea[i].xp = (plotArea[i].x1 * 8);
        plotArea[i].yp = (plotArea[i].y1 * 8);
        plotArea[i].row = 1;
        plotArea[i].column = column;
        initial+=2;
        column++;
    }

    //second row
    initial = 10;
    column = 1;

    for (int i = 8; i < 16; i++) {
        plotArea[i].x1 = initial;
        plotArea[i].x2 = plotArea[i].x1 + 1;
        plotArea[i].y1 = 19;
        plotArea[i].y2 = 20;
        plotArea[i].xp = (plotArea[i].x1 * 8);
        plotArea[i].yp = (plotArea[i].y1 * 8);
        plotArea[i].row = 2;
        plotArea[i].column = column;
        initial+=2;
        column++;
    }

    //third row
    initial = 10;
    column = 1;

    for (int i = 16; i < 24; i++) {
        plotArea[i].x1 = initial;
        plotArea[i].x2 = plotArea[i].x1 + 1;
        plotArea[i].y1 = 24;
        plotArea[i].y2 = 25;
        plotArea[i].xp = (plotArea[i].x1 * 8);
        plotArea[i].yp = (plotArea[i].y1 * 8);
        plotArea[i].row = 3;
        plotArea[i].column = column;
        initial+=2;
        column++;
    }

}

void initFences() {
    horizontalFences = 10;
    verticalFences = 6;
    int bottomX = 64;
    int initialY = 104;
    int gap = 0;
    int gap1 = 0;

//DOWN
for (int i = 0; i < horizontalFences / 2; i++) {
        fences[i].y1 = 224;
        fences[i].height = 24;
        fences[i].x1 = bottomX + gap1;
        fences[i].width = 32;
        fences[i].active = 0;
        fences[i].horizontal = 1;
        fences[i].shadowIndex = 110 + i;
        gap1 += 32;
    }

gap1 = 0;

//UP
for (int i = horizontalFences / 2; i < horizontalFences; i++) {
        fences[i].y1 = 68;
        fences[i].height = 24;
        fences[i].x1 = bottomX + gap1;
        fences[i].width = 32;
        fences[i].active = 0;
        fences[i].horizontal = 1;
        fences[i].shadowIndex = 110 + i;
        gap1 += 32;
    }
    // LEFT
    for (int i = horizontalFences; i < horizontalFences + 3; i++) {
        fences[i].y1 = initialY + gap;
        fences[i].height = 32;
        fences[i].x1 = 48;
        fences[i].width = 16;
        fences[i].active = 0;
        fences[i].vertical = 1;
        fences[i].shadowIndex = 110 + i;
        gap += 40;
    }
    gap = 0;
    // RIGHT
    for (int i = horizontalFences + 3; i < horizontalFences + 6; i++) {
        fences[i].y1 = initialY + gap;
        fences[i].height = 32;
        fences[i].x1 = 224;
        fences[i].width = 16;
        fences[i].active = 0;
        fences[i].vertical = 1;
        fences[i].shadowIndex = 110 + i;
        gap += 40;
    }
}

//initialize goats (enemies)
void initEnemy() {
    for (int i = 0; i < ENEMYNUM; i++) {
        enemies[i].height = 24;
        enemies[i].width = 24;
        enemies[i].active = 1;
        enemies[i].numOfFrames = 3;
        enemies[i].timeUntilNextFrame = 10;
        enemies[i].dx = 1;
        enemies[i].dy = 1;
        enemies[i].frame = 0;
    }
 
    //LEFT ENEMIES

    //1
    enemies[0].direction = R;
    enemies[0].shadowIndex = 80;
    enemies[0].x = 0;
    enemies[0].y = 104;
    enemies[0].row = 1;

    //2
    enemies[3].direction = R;
    enemies[3].shadowIndex = 81;
    enemies[3].x = 0;
    enemies[3].y = 144;
    enemies[3].row = 2;

    //3
    enemies[6].direction = R;
    enemies[6].shadowIndex = 82;
    enemies[6].x = 0;
    enemies[6].y = 184;
    enemies[6].row = 3;

    //UP Enemies

    //1
    enemies[1].direction = U;
    enemies[1].shadowIndex = 83;
    enemies[1].x = 80;
    enemies[1].y =  224;
    enemies[1].column = 1;

    //2
    enemies[4].direction = U;
    enemies[4].shadowIndex = 84;
    enemies[4].x = 96;
    enemies[4].y = 224;
    enemies[4].column = 2;


    //3
    enemies[13].direction = U;
    enemies[13].shadowIndex = 85;
    enemies[13].x = 112;
    enemies[13].y = 224;
    enemies[13].column = 3;


    //4
    enemies[7].direction = U;
    enemies[7].shadowIndex = 86;
    enemies[7].x = 128;
    enemies[7].y = 224;
    enemies[7].column = 4;


    //5
    enemies[8].direction = U;
    enemies[8].shadowIndex = 87;
    enemies[8].x = 144;
    enemies[8].y = 210;
    enemies[8].column = 5;


    //6
    enemies[2].direction = U;
    enemies[2].shadowIndex = 91;
    enemies[2].x = 160;
    enemies[2].y = 210;
    enemies[2].column = 6;


    //7
    enemies[12].direction = U;
    enemies[12].shadowIndex = 92;
    enemies[12].x = 176;
    enemies[12].y = 224;
    enemies[12].column = 7;


    //8
    enemies[11].direction = U;
    enemies[11].shadowIndex = 93;
    enemies[11].x = 192;
    enemies[11].y = 220;
    enemies[11].column = 8;


    //RIGHT ENEMIES

    //1
    enemies[5].direction = L;
    enemies[5].shadowIndex = 88;
    enemies[5].x = 224;
    enemies[5].y = 104;
    enemies[5].column = 1;


    //2
    enemies[9].direction = L;
    enemies[9].shadowIndex = 89;
    enemies[9].x = 224;
    enemies[9].y = 144;
    enemies[9].column = 2;


    //3
    enemies[10].direction = L;
    enemies[10].shadowIndex = 90;
    enemies[10].x = 224;
    enemies[10].y = 184;
    enemies[10].column = 3;

}

//update level 1
void updateGame1() {
    updatePlayer();
    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        level1FenceNum = FENCENUM;
    }
    updateFence(level1FenceNum);
    updateInventory();
    updatePlot();
    updateFenceLimit(level1FenceNum);
    //deploys the enemies after 6 sec of gameplay
    if (second >= 6) {
        updateEnemy(level1EnemyNum);

    }
    LevelRequirement();
    updateRequirements();
}

//update level 2
void updateGame2() {
    updatePlayer();
    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        level2FenceNum = FENCENUM;
    }
    updateFence(level2FenceNum);
    updateInventory();
    updatePlot();
    updateFenceLimit(level2FenceNum);
    //deploys the enemies after 6 sec of gameplay
    if (second >= 4) {
        updateEnemy(level2EnemyNum);

    }
    LevelRequirement();
    updateRequirements();

}

//update level 3
void updateGame3() {
    updatePlayer();
    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        level3FenceNum = FENCENUM;
    }
    updateFence(level3FenceNum);
    updateInventory();
    updatePlot();
    //deploys the enemies after 5 sec of gameplay
    if (second >= 4) {
        updateEnemy(level3EnemyNum);

    }
    updateFenceLimit(level3FenceNum);
    LevelRequirement();
    updateRequirements();

}

//update enemey
void updateEnemy(int num) {

for (int i = 0; i < num; i++) {
    if (enemies[i].active) {
         if (enemies[i].direction == R) {
        if (enemies[i].x + enemies[i].width > MAPWIDTH) {
            enemies[i].direction = L;
        }
    } else if (enemies[i].direction == L) {
        if (enemies[i].x < 0) {
            enemies[i].direction = R;
        }
    } else if (enemies[i].direction == U) {
        if (enemies[i].y < 0) {
            enemies[i].direction = D;
        }
    } else if (enemies[i].direction == D) {
        if (enemies[i].y + enemies[i].height > MAPHEIGHT) {
            enemies[i].direction = U;
        }
    }
    }
   
}


for (int i = 0; i < num; i++) {
        if (enemies[i].direction == U) {
            enemies[i].y -= enemies[i].dy;
        }

        if (enemies[i].direction == D) {
            enemies[i].y += enemies[i].dy;
        }

        if (enemies[i].direction == L) {
            enemies[i].x -= enemies[i].dx;
        }

        if (enemies[i].direction == R) {
            enemies[i].x += enemies[i].dx;
        }

        if (enemies[i].timeUntilNextFrame == 0) {
            enemies[i].frame++;
            enemies[i].frame = enemies[i].frame % enemies[i].numOfFrames;
            enemies[i].timeUntilNextFrame = 10;
        } else {
            enemies[i].timeUntilNextFrame--;
        }
    }

//draws enemey sprites
for (int i = 0; i < num; i++) {
        if (enemies[i].active == 1) {
            shadowOAM[enemies[i].shadowIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(enemies[i].y - vOff);
            shadowOAM[enemies[i].shadowIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(enemies[i].x - hOff);
            shadowOAM[enemies[i].shadowIndex].attr2 = ATTR2_TILEID((enemies[i].direction * 4) + 16, enemies[i].frame * 4) | ATTR2_PRIORITY(3);
        } else {
            shadowOAM[enemies[i].shadowIndex].attr0 = ATTR0_HIDE;
        }
    }

    //if sprites collide with a planted area it will delete your planted crop + deletes the enemy sprite
     for (int i = 0; i < num; i++) {
        for (int j = 0; j < PLOTNUM; j++) {
            if (plotArea[j].planted) {
                if (collision(plotArea[j].xp, plotArea[j].yp, plotArea[j].pixelWidth, plotArea[j].pixelHeight, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                plotArea[j].planted = 0;
                totalPlanted--;
                decrementVeggieReq(j);
                for (int k = 0; k < PLOTNUM; k++) {
                    if (index[k] == j) {
                        index[k] = 0;
                    }
                }
                SCREENBLOCK[31].tilemap[OFFSET(plotArea[j].x1, plotArea[j].y1, 32)] = TMAP_ENTRY_TILEID(0);
                SCREENBLOCK[31].tilemap[OFFSET(plotArea[j].x2, plotArea[j].y1, 32)] = TMAP_ENTRY_TILEID(1);
                SCREENBLOCK[31].tilemap[OFFSET(plotArea[j].x1, plotArea[j].y2, 32)] = TMAP_ENTRY_TILEID(17);
                SCREENBLOCK[31].tilemap[OFFSET(plotArea[j].x2, plotArea[j].y2, 32)] = TMAP_ENTRY_TILEID(18);
                //return the tilemap to original after pausing
                for (int k = 0; k < PLOTNUM; k++) {
                    if ((index[k] == PLOTNUM) && (j == 0)) {
                        index[k] = 0; //delete mod
                    } else if (index[k] == j) {
                        index[k] = 0; //delete mod
                    }
                }
            }
            }
        }
    }
    //enemy sprites disappear after colliding with fence
    for (int i = 0; i < num; i++) {
        for (int j = 0; j < FENCENUM; j++) {
            if (fences[j].active) {
                if (collision(fences[j].x1, fences[j].y1, fences[j].width, fences[j].height, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                enemies[i].active = 0;
            }
        }
        }
    }

}

//update inventory
void updateInventory() {
    //carrot Box
    shadowOAM[70].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[0].y - v1Off);
    shadowOAM[70].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[0].x - h1Off);
    shadowOAM[70].attr2 = ATTR2_TILEID(1, 15) | ATTR2_PRIORITY(1);
    //carrot
    shadowOAM[66].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[0].y - v1Off);
    shadowOAM[66].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[0].x - h1Off);
    shadowOAM[66].attr2 = ATTR2_TILEID(0, 19) | ATTR2_PRIORITY(1);

    //corn Box
    shadowOAM[69].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[1].y - v1Off);
    shadowOAM[69].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[1].x - h1Off);
    shadowOAM[69].attr2 = ATTR2_TILEID(1, 15) | ATTR2_PRIORITY(1);
    //corn
    shadowOAM[65].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[1].y - v1Off);
    shadowOAM[65].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[1].x - h1Off);
    shadowOAM[65].attr2 = ATTR2_TILEID(4, 19) | ATTR2_PRIORITY(1);

    //eggplant Box
    shadowOAM[68].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[2].y - v1Off);
    shadowOAM[68].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[2].x - h1Off);
    shadowOAM[68].attr2 = ATTR2_TILEID(1, 15) | ATTR2_PRIORITY(1);

    //eggplant
    shadowOAM[64].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[2].y - v1Off);
    shadowOAM[64].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[2].x - h1Off);
    shadowOAM[64].attr2 = ATTR2_TILEID(8, 19) | ATTR2_PRIORITY(1);

    //Tomato Box
    shadowOAM[67].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[3].y - v1Off);
    shadowOAM[67].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[3].x - h1Off);
    shadowOAM[67].attr2 = ATTR2_TILEID(1, 15) | ATTR2_PRIORITY(1);

    //tomato
    shadowOAM[63].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[3].y - v1Off);
    shadowOAM[63].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[3].x - h1Off);
    shadowOAM[63].attr2 = ATTR2_TILEID(12, 19) | ATTR2_PRIORITY(1);

    //removes all highlights
    for (int i = 0; i < VEGGIENUM; i++) {
        veggies[i].highlight = 0;
    }

    //go down the inventory
    if (BUTTON_PRESSED(BUTTON_A)) {
        selectVeggie++;
        if (selectVeggie > 4) {
            selectVeggie = 1;
        }
    }
    //go up the inventory
    if (BUTTON_PRESSED(BUTTON_B)) {
        selectVeggie--;
        if (selectVeggie < 1) {
            selectVeggie = 4;
        }
    }


    //highlights the veggie box
    for (int i = 0; i < VEGGIENUM; i++) {
        if (veggies[i].veggietype == selectVeggie) {
            veggies[i].highlight = 1;
        }
    }
    for (int i = 0; i < VEGGIENUM; i++) {
        if (veggies[i].highlight == 1) {
            shadowOAM[62].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(veggies[i].y - v1Off);
            shadowOAM[62].attr1 = ATTR1_MEDIUM| ATTR1_X(veggies[i].x - h1Off);
            shadowOAM[62].attr2 = ATTR2_TILEID(6, 15) | ATTR2_PRIORITY(0) | ATTR2_PALROW(0);

        }
    }
}

//update player
void updatePlayer() {
    player.isMoving = 0;
    
    // travels in the direction player faces
    if (BUTTON_HELD(BUTTON_UP) && canMoveUp()) {
      
        player.isMoving = 1;
        player.direction = UP;
        player.y-=player.dy;
    }
    if (BUTTON_HELD(BUTTON_DOWN) && canMoveDown()) {
        
        player.isMoving = 1;
        player.direction = DOWN;
        player.y+=player.dy;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && canMoveRight()) {
     
        player.isMoving = 1;
        player.direction = RIGHT;
        player.x+=player.dx;
    }
    if (BUTTON_HELD(BUTTON_LEFT) && canMoveLeft()) {
        player.isMoving = 1;
        player.direction = LEFT;
        player.x-=player.dx;
    }

    if (player.isMoving) {
         if (player.timeUntilNextFrame == 0){
            player.frame++;
            player.frame = player.frame % player.numOfFrames;
            player.timeUntilNextFrame = 10;
        } else {
            player.timeUntilNextFrame--;
        }
        
    } else {
        player.frame = 0;
        player.timeUntilNextFrame = 10;
        
    }


    //screen follows player: 

    if (player.x < SCREENWIDTH / 2){
        hOff = 0; 
    } else if (player.x > MAPWIDTH - SCREENWIDTH / 2){
        hOff = MAPWIDTH - SCREENWIDTH;
    } else {
        hOff = player.x - SCREENWIDTH / 2;
    }

    if (player.y < SCREENHEIGHT / 2){
        vOff = 0; 
    } else if (player.y > MAPHEIGHT - SCREENHEIGHT/2){
        vOff = MAPHEIGHT - SCREENHEIGHT;
    } else {
        vOff = player.y - SCREENHEIGHT / 2;
    }

    //ensures that the player stays within the bounds
    if (player.x < 0) {
        player.x = 0;
    } 
    if (player.y < 0) {
        player.y = 0;
    } 
    if (player.x > MAPWIDTH - player.width) {
        player.x = MAPWIDTH - player.width;   
    } 
    if (player.y > MAPHEIGHT - player.height)  {
        player.y = MAPHEIGHT - player.height;
    }
    if (!BUTTON_HELD(BUTTON_START)) {
        shadowOAM[126].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
        shadowOAM[126].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
        shadowOAM[126].attr2 = ATTR2_TILEID(player.direction * 4, player.frame * 4) | ATTR2_PRIORITY(3) | ATTR2_PALROW(paletteNum);
    } 
}

//update plantable area
void updatePlot() {
    if (BUTTON_HELD(BUTTON_SELECT)) {
        for (int i = 0; i < PLOTNUM; i++) {
            if (!plotArea[i].planted) {
            if (collision(player.x, player.y, player.width / 3, player.height, plotArea[i].xp, plotArea[i].yp, plotArea[i].pixelWidth / 2, plotArea[i].pixelHeight / 2)) {
                    plotArea[i].planted = 1;
                    playPlantSound();
                    SCREENBLOCK[31].tilemap[OFFSET(plotArea[i].x1, plotArea[i].y1, 32)] = TMAP_ENTRY_TILEID(34);
                    SCREENBLOCK[31].tilemap[OFFSET(plotArea[i].x2, plotArea[i].y1, 32)] = TMAP_ENTRY_TILEID(35);
                    SCREENBLOCK[31].tilemap[OFFSET(plotArea[i].x1, plotArea[i].y2, 32)] = TMAP_ENTRY_TILEID(51);
                    SCREENBLOCK[31].tilemap[OFFSET(plotArea[i].x2, plotArea[i].y2, 32)] = TMAP_ENTRY_TILEID(52);
                    modified = 1;
                    incrementVeggieType(i);
                    totalPlanted++;
                    int j = 0;
                    while ((index[j] != 0) && (j < PLOTNUM)) {
                        j++;
                    }
                    if ((index[j] == 0) && (i == 0)) {
                        index[j] = PLOTNUM;
                    } else {
                        index[j] = i;
                    }
                }
            }
        }
    }

}

//increments the number of veggies planted
void incrementVeggieType(int plotIndex) {
    switch(selectVeggie) {
            case 1:

                plotArea[plotIndex].vegType = CARROT;
                //increment carrotCount
                carrotCount++;
                break;
            case 2:

                plotArea[plotIndex].vegType = CORN;
                //increment cornCount
                cornCount++;
                break;
            case 3:
                
                plotArea[plotIndex].vegType = EGGPLANT;
                //increment eggplantCount
                eggplantCount++;
                break;
            case 4:

                plotArea[plotIndex].vegType = TOMATO;
                //increment tomatoCount
                tomatoCount++;
                break;
        }
}

//decrements the number of veggies planted
void decrementVeggieReq(int plotIndex) {
    switch(plotArea[plotIndex].vegType) {
        case CARROT:
            plotArea[plotIndex].vegType = 0;
            carrotCount--;
            break;
        case CORN:
            plotArea[plotIndex].vegType = 0;
            cornCount--;
            break;
        case EGGPLANT:
            plotArea[plotIndex].vegType = 0;
            eggplantCount--;
            break;
        case TOMATO:
            plotArea[plotIndex].vegType = 0;
            tomatoCount--;
            break;
    }
}

//update fences
void updateFence(int limit) {
    for (int i = 0; i < FENCENUM; i++) {
        if (fences[i].active) {
            if (fences[i].vertical) {
                shadowOAM[fences[i].shadowIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(fences[i].y1) - vOff;
                shadowOAM[fences[i].shadowIndex].attr1 = ATTR1_MEDIUM| ATTR1_X(fences[i].x1) - hOff;
                shadowOAM[fences[i].shadowIndex].attr2 = ATTR2_TILEID(5, 24) | ATTR2_PRIORITY(3) | ATTR2_PALROW(0);
            } else if (fences[i].horizontal) {
                shadowOAM[fences[i].shadowIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(fences[i].y1) - vOff;
                shadowOAM[fences[i].shadowIndex].attr1 = ATTR1_MEDIUM| ATTR1_X(fences[i].x1) - hOff;
                shadowOAM[fences[i].shadowIndex].attr2 = ATTR2_TILEID(0, 24) | ATTR2_PRIORITY(3) | ATTR2_PALROW(0);
            }
        }
    }
    //sets fences when button pressed and player sprite collides with valid fence area
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        for (int i = 0; i < FENCENUM; i++) {
            if (collision(player.x, player.y, player.width, player.height, fences[i].x1, fences[i].y1, fences[i].width, fences[i].height)) {
                if ((fences[i].active == 0) && (fenceNum < limit)) {
                    fences[i].active = 1;
                    fenceNum++;
                }
             }
        }
        
    }
}

//update requirements
void updateRequirements() {
    
    //carrot
    shadowOAM[59].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(10 - v1Off);
    shadowOAM[59].attr1 = ATTR1_MEDIUM| ATTR1_X(200 - h1Off);
    shadowOAM[59].attr2 = ATTR2_TILEID(1, 19) | ATTR2_PRIORITY(1);

    //x
    shadowOAM[60].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(18 - v1Off);
    shadowOAM[60].attr1 = ATTR1_TINY| ATTR1_X(220 - h1Off);
    shadowOAM[60].attr2 = ATTR2_TILEID(20, 15) | ATTR2_PRIORITY(1);

    shadowOAM[61].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(18 - v1Off);
    shadowOAM[61].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
    shadowOAM[61].attr2 = ATTR2_TILEID(10 + carrotR, 15) | ATTR2_PRIORITY(1);
    
    for (int i = carrotR; i > carrotR - carrotCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[61].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(18 - v1Off);
        shadowOAM[61].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
        shadowOAM[61].attr2 = ATTR2_TILEID(9 + i, 15) | ATTR2_PRIORITY(1);
    }

     //corn
    shadowOAM[56].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(29 - v1Off);
    shadowOAM[56].attr1 = ATTR1_MEDIUM| ATTR1_X(192 - h1Off);
    shadowOAM[56].attr2 = ATTR2_TILEID(4, 19) | ATTR2_PRIORITY(1);

    //x
    shadowOAM[57].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(37 - v1Off);
    shadowOAM[57].attr1 = ATTR1_TINY| ATTR1_X(220 - h1Off);
    shadowOAM[57].attr2 = ATTR2_TILEID(20, 15) | ATTR2_PRIORITY(1);

    //corn Num
    shadowOAM[58].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(37 - v1Off);
    shadowOAM[58].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
    shadowOAM[58].attr2 = ATTR2_TILEID(10 + cornR, 15) | ATTR2_PRIORITY(1);

    for (int i = cornR; i > cornR - cornCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[58].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(37 - v1Off);
        shadowOAM[58].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
        shadowOAM[58].attr2 = ATTR2_TILEID(9 + i, 15) | ATTR2_PRIORITY(1);
    }


    //eggplant
    shadowOAM[53].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(48 - v1Off);
    shadowOAM[53].attr1 = ATTR1_MEDIUM| ATTR1_X(192 - h1Off);
    shadowOAM[53].attr2 = ATTR2_TILEID(8, 19) | ATTR2_PRIORITY(1);

    //x
    shadowOAM[54].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(56 - v1Off);
    shadowOAM[54].attr1 = ATTR1_TINY| ATTR1_X(220 - h1Off);
    shadowOAM[54].attr2 = ATTR2_TILEID(20, 15) | ATTR2_PRIORITY(1);

    //eggplant Num
    shadowOAM[55].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(56 - v1Off);
    shadowOAM[55].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
    shadowOAM[55].attr2 = ATTR2_TILEID(10 + eggplantR, 15) | ATTR2_PRIORITY(1);

    for (int i = eggplantR - 1; i > eggplantR - eggplantCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[55].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(56 - v1Off);
        shadowOAM[55].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
        shadowOAM[55].attr2 = ATTR2_TILEID(9 + i, 15) | ATTR2_PRIORITY(1);
    }

    //tomato
    shadowOAM[50].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(67 - v1Off);
    shadowOAM[50].attr1 = ATTR1_MEDIUM| ATTR1_X(192 - h1Off);
    shadowOAM[50].attr2 = ATTR2_TILEID(12, 19) | ATTR2_PRIORITY(1);

    //x
    shadowOAM[51].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(75 - v1Off);
    shadowOAM[51].attr1 = ATTR1_TINY| ATTR1_X(220 - h1Off);
    shadowOAM[51].attr2 = ATTR2_TILEID(20, 15) | ATTR2_PRIORITY(1);
   
    //tomato Num
    shadowOAM[52].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(75 - v1Off);
    shadowOAM[52].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
    shadowOAM[52].attr2 = ATTR2_TILEID(10 + tomatoR, 15) | ATTR2_PRIORITY(1);

    for (int i = tomatoR - 1; i > tomatoR - tomatoCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[52].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(75 - v1Off);
        shadowOAM[52].attr1 = ATTR1_TINY| ATTR1_X(228 - h1Off);
        shadowOAM[52].attr2 = ATTR2_TILEID(9 + i, 15) | ATTR2_PRIORITY(1);
    }

}

//saves all tilemap modification data when pausing
void saveTilemapModData(int index) {
    if (index == PLOTNUM) {
        index = 0;
    }
    SCREENBLOCK[31].tilemap[OFFSET(plotArea[index].x1, plotArea[index].y1, 32)] = TMAP_ENTRY_TILEID(34);
    SCREENBLOCK[31].tilemap[OFFSET(plotArea[index].x2, plotArea[index].y1, 32)] = TMAP_ENTRY_TILEID(35);
    SCREENBLOCK[31].tilemap[OFFSET(plotArea[index].x1, plotArea[index].y2, 32)] = TMAP_ENTRY_TILEID(51);
    SCREENBLOCK[31].tilemap[OFFSET(plotArea[index].x2, plotArea[index].y2, 32)] = TMAP_ENTRY_TILEID(52);
    
}

//updates number of fences allowed
void updateFenceLimit(int num) {

    //fence
    shadowOAM[20].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y((SCREENHEIGHT - 26) - v1Off);
    shadowOAM[20].attr1 = ATTR1_MEDIUM| ATTR1_X((SCREENWIDTH - 50) - h1Off);
    shadowOAM[20].attr2 = ATTR2_TILEID(0, 24) | ATTR2_PRIORITY(1) | ATTR2_PALROW(0);

    //x
    shadowOAM[19].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y((SCREENHEIGHT - 18) - v1Off);
    shadowOAM[19].attr1 = ATTR1_MEDIUM| ATTR1_X(220 - h1Off);
    shadowOAM[19].attr2 = ATTR2_TILEID(20, 15) | ATTR2_PRIORITY(1) | ATTR2_PALROW(0);

     
    //Fence Num 
    if ((num - fenceNum) < 10) {
        shadowOAM[18].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y((SCREENHEIGHT - 18) - v1Off);
        shadowOAM[18].attr1 = ATTR1_TINY| ATTR1_X(230 - h1Off);
        shadowOAM[18].attr2 = ATTR2_TILEID(10 + ((num - fenceNum) % 10), 15) | ATTR2_PRIORITY(1);
        shadowOAM[17].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[18].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y((SCREENHEIGHT - 18) - v1Off);
        shadowOAM[18].attr1 = ATTR1_TINY| ATTR1_X(230 - h1Off);
        shadowOAM[18].attr2 = ATTR2_TILEID(10 + ((num - fenceNum) % 10), 15) | ATTR2_PRIORITY(1);
        shadowOAM[17].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y((SCREENHEIGHT - 18) - v1Off);
        shadowOAM[17].attr1 = ATTR1_TINY| ATTR1_X(225 - h1Off);
        shadowOAM[17].attr2 = ATTR2_TILEID(11, 15) | ATTR2_PRIORITY(1);
    }

   
}

//stops timer
void stopTimer() {
    REG_TM2CNT = 0;
    REG_TM3CNT = 0;
}

//start timer
void startTimer() {
    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
}
