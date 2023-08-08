# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "sprites.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;


typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 42 "gba.h"
void waitForVBlank();
# 59 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 75 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 107 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 5 "sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
} SPRITE;
# 2 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "game.c" 2
# 1 "game.h" 1
# 10 "game.h"
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
# 70 "game.h"
VEGGIE veggies[4];
PLOT plotArea[24];
FENCE fences[16];
ENEMY enemies[14];

extern int index[24];
extern int second;
extern int minute;


extern int totalPlanted;

extern int metRequirement;
extern int modified;
# 4 "game.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "game.c" 2


# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[32768];


extern const unsigned short collisionmapPal[256];
# 8 "game.c" 2


# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 11 "game.c" 2
# 1 "play.h" 1





typedef struct {

    char* title;
    unsigned int sampleRate;
    unsigned int length;
    signed char* data;
    int looping;

} SONG;

SONG songs[6];

void startGameSong();
void playSong(int);


extern int paused;
extern int currentSong;
# 12 "game.c" 2


inline unsigned char colorAt(int x, int y);


unsigned char* collisionMap;

OBJ_ATTR shadowOAM[128];

int hOff;
int vOff;
int h1Off;
int v1Off;

int minute;
int second;


SPRITE player;


int carrotCount;
int cornCount;
int tomatoCount;
int eggplantCount;


int totalPlanted;


int metRequirement;


int verticalFences;


int horizontalFences;


int level1FenceNum;

int level1EnemyNum;


int level2FenceNum;

int level2EnemyNum;


int level3FenceNum;

int level3EnemyNum;


int modified;


int index[24];


int carrotR;
int tomatoR;
int eggplantR;
int cornR;



int paletteNum;


int fenceNum;


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



inline unsigned char colorAt(int x, int y){
    return collisionMap[((y) * (256) + (x))];

}




int canMoveLeft() {


    int left = player.x;
    int top = player.y;
    int bottom = player.y + player.height - 1;

    return colorAt(left - player.dx, top) && colorAt(left - player.dx, bottom);
}


int canMoveRight() {
    int right = player.x + player.width - 1;
    int top = player.y;
    int bottom = player.y + player.height - 1;
    return colorAt(right + player.dx , bottom) && colorAt(right + player.dx, top);
}


int canMoveUp() {
    int left = player.x;
    int right = player.x + player.width - 1;
    int top = player.y;
    return colorAt(left, top - player.dy) && colorAt(right, top - player.dy);
}


int canMoveDown() {
    int left = player.x;
    int right = player.x + player.width - 1;
    int bottom = player.y + player.height - 1;
    return colorAt(left, bottom + player.dy) && colorAt(right, bottom + player.dy);

}


void initGame1() {
    collisionMap = (unsigned char*) collisionmapBitmap;

    hOff = 0;
    vOff = 0;
    h1Off = 0;
    v1Off = 0;
    selectVeggie = 1;

    for (int i = 0; i < 24; i++) {
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


initLevel1() {
    level1FenceNum = 16 - 5;
    level1EnemyNum = 14 - 10;

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


void initGame2() {
    collisionMap = (unsigned char*) collisionmapBitmap;

    hOff = 0;
    vOff = 0;
    h1Off = 0;
    v1Off = 0;
    selectVeggie = 1;

    for (int i = 0; i < 24; i++) {
        index[i] = 0;
    }



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


initLevel2() {
    level2FenceNum = 16 - 8;
    level2EnemyNum = 14 - 6;

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


void initGame3() {
    collisionMap = (unsigned char*) collisionmapBitmap;
    hOff = 0;
    vOff = 0;
    h1Off = 0;
    v1Off = 0;
    selectVeggie = 1;

    for (int i = 0; i < 24; i++) {
        index[i] = 0;
    }


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

initLevel3() {
    level3FenceNum = 16 - 10;
    level3EnemyNum = 14 - 3;

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


void LevelRequirement() {
    if ((carrotCount >= carrotR) && (tomatoCount >= tomatoR) && (eggplantCount >= eggplantR) && (cornCount >= cornR)) {
        metRequirement = 1;
    }
}


void initPlayer() {
    player.width = 24;
    player.height = 24;


    player.x = (240 / 2) - player.width;
    player.y = ((160 / 2) + 8) - player.height;


    player.numOfFrames = 3;


    player.frame = 0;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.dx = 1;
    player.dy = 1;


    player.isMoving = 1;
}


void initInventory() {

    for (int i = 0; i < 4; i++) {
        veggies[i].x = 3;
        veggies[i].width = 24;
        veggies[i].height = 24;
    }

    veggies[0].y = 20;
    veggies[0].veggietype = CARROT;


    veggies[1].y = 20 + veggies[1].height;
    veggies[1].veggietype = CORN;


    veggies[2].y = 20 + veggies[1].height * 2;
    veggies[2].veggietype = EGGPLANT;


    veggies[3].y = 20 + veggies[1].height * 3;
    veggies[3].veggietype = TOMATO;

}

void initPlot() {
    for (int i = 0; i < 24; i++) {
        plotArea[i].planted = 0;
        plotArea[i].pixelHeight = 16;
        plotArea[i].pixelWidth = 16;
    }


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


void initEnemy() {
    for (int i = 0; i < 14; i++) {
        enemies[i].height = 24;
        enemies[i].width = 24;
        enemies[i].active = 1;
        enemies[i].numOfFrames = 3;
        enemies[i].timeUntilNextFrame = 10;
        enemies[i].dx = 1;
        enemies[i].dy = 1;
        enemies[i].frame = 0;
    }




    enemies[0].direction = R;
    enemies[0].shadowIndex = 80;
    enemies[0].x = 0;
    enemies[0].y = 104;
    enemies[0].row = 1;


    enemies[3].direction = R;
    enemies[3].shadowIndex = 81;
    enemies[3].x = 0;
    enemies[3].y = 144;
    enemies[3].row = 2;


    enemies[6].direction = R;
    enemies[6].shadowIndex = 82;
    enemies[6].x = 0;
    enemies[6].y = 184;
    enemies[6].row = 3;




    enemies[1].direction = U;
    enemies[1].shadowIndex = 83;
    enemies[1].x = 80;
    enemies[1].y = 224;
    enemies[1].column = 1;


    enemies[4].direction = U;
    enemies[4].shadowIndex = 84;
    enemies[4].x = 96;
    enemies[4].y = 224;
    enemies[4].column = 2;



    enemies[13].direction = U;
    enemies[13].shadowIndex = 85;
    enemies[13].x = 112;
    enemies[13].y = 224;
    enemies[13].column = 3;



    enemies[7].direction = U;
    enemies[7].shadowIndex = 86;
    enemies[7].x = 128;
    enemies[7].y = 224;
    enemies[7].column = 4;



    enemies[8].direction = U;
    enemies[8].shadowIndex = 87;
    enemies[8].x = 144;
    enemies[8].y = 210;
    enemies[8].column = 5;



    enemies[2].direction = U;
    enemies[2].shadowIndex = 91;
    enemies[2].x = 160;
    enemies[2].y = 210;
    enemies[2].column = 6;



    enemies[12].direction = U;
    enemies[12].shadowIndex = 92;
    enemies[12].x = 176;
    enemies[12].y = 224;
    enemies[12].column = 7;



    enemies[11].direction = U;
    enemies[11].shadowIndex = 93;
    enemies[11].x = 192;
    enemies[11].y = 220;
    enemies[11].column = 8;





    enemies[5].direction = L;
    enemies[5].shadowIndex = 88;
    enemies[5].x = 224;
    enemies[5].y = 104;
    enemies[5].column = 1;



    enemies[9].direction = L;
    enemies[9].shadowIndex = 89;
    enemies[9].x = 224;
    enemies[9].y = 144;
    enemies[9].column = 2;



    enemies[10].direction = L;
    enemies[10].shadowIndex = 90;
    enemies[10].x = 224;
    enemies[10].y = 184;
    enemies[10].column = 3;

}


void updateGame1() {
    updatePlayer();
    if ((!(~(oldButtons) & ((1<<8))) && (~(buttons) & ((1<<8))))) {
        level1FenceNum = 16;
    }
    updateFence(level1FenceNum);
    updateInventory();
    updatePlot();
    updateFenceLimit(level1FenceNum);

    if (second >= 6) {
        updateEnemy(level1EnemyNum);

    }
    LevelRequirement();
    updateRequirements();
}


void updateGame2() {
    updatePlayer();
    if ((!(~(oldButtons) & ((1<<8))) && (~(buttons) & ((1<<8))))) {
        level2FenceNum = 16;
    }
    updateFence(level2FenceNum);
    updateInventory();
    updatePlot();
    updateFenceLimit(level2FenceNum);

    if (second >= 4) {
        updateEnemy(level2EnemyNum);

    }
    LevelRequirement();
    updateRequirements();

}


void updateGame3() {
    updatePlayer();
    if ((!(~(oldButtons) & ((1<<8))) && (~(buttons) & ((1<<8))))) {
        level3FenceNum = 16;
    }
    updateFence(level3FenceNum);
    updateInventory();
    updatePlot();

    if (second >= 4) {
        updateEnemy(level3EnemyNum);

    }
    updateFenceLimit(level3FenceNum);
    LevelRequirement();
    updateRequirements();

}


void updateEnemy(int num) {

for (int i = 0; i < num; i++) {
    if (enemies[i].active) {
         if (enemies[i].direction == R) {
        if (enemies[i].x + enemies[i].width > 256) {
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
        if (enemies[i].y + enemies[i].height > 256) {
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


for (int i = 0; i < num; i++) {
        if (enemies[i].active == 1) {
            shadowOAM[enemies[i].shadowIndex].attr0 = (0<<13) | (0<<14) | ((enemies[i].y - vOff) & 0xFF);
            shadowOAM[enemies[i].shadowIndex].attr1 = (2<<14) | ((enemies[i].x - hOff) & 0x1FF);
            shadowOAM[enemies[i].shadowIndex].attr2 = (((enemies[i].frame * 4) * 32 + ((enemies[i].direction * 4) + 16)) & 0x3FF) | (((3) & 3) << 10);
        } else {
            shadowOAM[enemies[i].shadowIndex].attr0 = (2<<8);
        }
    }


     for (int i = 0; i < num; i++) {
        for (int j = 0; j < 24; j++) {
            if (plotArea[j].planted) {
                if (collision(plotArea[j].xp, plotArea[j].yp, plotArea[j].pixelWidth, plotArea[j].pixelHeight, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                plotArea[j].planted = 0;
                totalPlanted--;
                decrementVeggieReq(j);
                for (int k = 0; k < 24; k++) {
                    if (index[k] == j) {
                        index[k] = 0;
                    }
                }
                ((screenblock *)0x6000000)[31].tilemap[((plotArea[j].y1) * (32) + (plotArea[j].x1))] = ((0 & 0x3FF));
                ((screenblock *)0x6000000)[31].tilemap[((plotArea[j].y1) * (32) + (plotArea[j].x2))] = ((1 & 0x3FF));
                ((screenblock *)0x6000000)[31].tilemap[((plotArea[j].y2) * (32) + (plotArea[j].x1))] = ((17 & 0x3FF));
                ((screenblock *)0x6000000)[31].tilemap[((plotArea[j].y2) * (32) + (plotArea[j].x2))] = ((18 & 0x3FF));

                for (int k = 0; k < 24; k++) {
                    if ((index[k] == 24) && (j == 0)) {
                        index[k] = 0;
                    } else if (index[k] == j) {
                        index[k] = 0;
                    }
                }
            }
            }
        }
    }

    for (int i = 0; i < num; i++) {
        for (int j = 0; j < 16; j++) {
            if (fences[j].active) {
                if (collision(fences[j].x1, fences[j].y1, fences[j].width, fences[j].height, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                enemies[i].active = 0;
            }
        }
        }
    }

}


void updateInventory() {

    shadowOAM[70].attr0 = (0<<13) | (0<<14) | ((veggies[0].y - v1Off) & 0xFF);
    shadowOAM[70].attr1 = (2<<14)| ((veggies[0].x - h1Off) & 0x1FF);
    shadowOAM[70].attr2 = (((15) * 32 + (1)) & 0x3FF) | (((1) & 3) << 10);

    shadowOAM[66].attr0 = (0<<13) | (0<<14) | ((veggies[0].y - v1Off) & 0xFF);
    shadowOAM[66].attr1 = (2<<14)| ((veggies[0].x - h1Off) & 0x1FF);
    shadowOAM[66].attr2 = (((19) * 32 + (0)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[69].attr0 = (0<<13) | (0<<14) | ((veggies[1].y - v1Off) & 0xFF);
    shadowOAM[69].attr1 = (2<<14)| ((veggies[1].x - h1Off) & 0x1FF);
    shadowOAM[69].attr2 = (((15) * 32 + (1)) & 0x3FF) | (((1) & 3) << 10);

    shadowOAM[65].attr0 = (0<<13) | (0<<14) | ((veggies[1].y - v1Off) & 0xFF);
    shadowOAM[65].attr1 = (2<<14)| ((veggies[1].x - h1Off) & 0x1FF);
    shadowOAM[65].attr2 = (((19) * 32 + (4)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[68].attr0 = (0<<13) | (0<<14) | ((veggies[2].y - v1Off) & 0xFF);
    shadowOAM[68].attr1 = (2<<14)| ((veggies[2].x - h1Off) & 0x1FF);
    shadowOAM[68].attr2 = (((15) * 32 + (1)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[64].attr0 = (0<<13) | (0<<14) | ((veggies[2].y - v1Off) & 0xFF);
    shadowOAM[64].attr1 = (2<<14)| ((veggies[2].x - h1Off) & 0x1FF);
    shadowOAM[64].attr2 = (((19) * 32 + (8)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[67].attr0 = (0<<13) | (0<<14) | ((veggies[3].y - v1Off) & 0xFF);
    shadowOAM[67].attr1 = (2<<14)| ((veggies[3].x - h1Off) & 0x1FF);
    shadowOAM[67].attr2 = (((15) * 32 + (1)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[63].attr0 = (0<<13) | (0<<14) | ((veggies[3].y - v1Off) & 0xFF);
    shadowOAM[63].attr1 = (2<<14)| ((veggies[3].x - h1Off) & 0x1FF);
    shadowOAM[63].attr2 = (((19) * 32 + (12)) & 0x3FF) | (((1) & 3) << 10);


    for (int i = 0; i < 4; i++) {
        veggies[i].highlight = 0;
    }


    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        selectVeggie++;
        if (selectVeggie > 4) {
            selectVeggie = 1;
        }
    }

    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        selectVeggie--;
        if (selectVeggie < 1) {
            selectVeggie = 4;
        }
    }



    for (int i = 0; i < 4; i++) {
        if (veggies[i].veggietype == selectVeggie) {
            veggies[i].highlight = 1;
        }
    }
    for (int i = 0; i < 4; i++) {
        if (veggies[i].highlight == 1) {
            shadowOAM[62].attr0 = (0<<13) | (0<<14) | ((veggies[i].y - v1Off) & 0xFF);
            shadowOAM[62].attr1 = (2<<14)| ((veggies[i].x - h1Off) & 0x1FF);
            shadowOAM[62].attr2 = (((15) * 32 + (6)) & 0x3FF) | (((0) & 3) << 10) | (((0) & 0xF) << 12);

        }
    }
}


void updatePlayer() {
    player.isMoving = 0;


    if ((~(buttons) & ((1<<6))) && canMoveUp()) {

        player.isMoving = 1;
        player.direction = UP;
        player.y-=player.dy;
    }
    if ((~(buttons) & ((1<<7))) && canMoveDown()) {

        player.isMoving = 1;
        player.direction = DOWN;
        player.y+=player.dy;
    }
    if ((~(buttons) & ((1<<4))) && canMoveRight()) {

        player.isMoving = 1;
        player.direction = RIGHT;
        player.x+=player.dx;
    }
    if ((~(buttons) & ((1<<5))) && canMoveLeft()) {
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




    if (player.x < 240 / 2){
        hOff = 0;
    } else if (player.x > 256 - 240 / 2){
        hOff = 256 - 240;
    } else {
        hOff = player.x - 240 / 2;
    }

    if (player.y < 160 / 2){
        vOff = 0;
    } else if (player.y > 256 - 160/2){
        vOff = 256 - 160;
    } else {
        vOff = player.y - 160 / 2;
    }


    if (player.x < 0) {
        player.x = 0;
    }
    if (player.y < 0) {
        player.y = 0;
    }
    if (player.x > 256 - player.width) {
        player.x = 256 - player.width;
    }
    if (player.y > 256 - player.height) {
        player.y = 256 - player.height;
    }
    if (!(~(buttons) & ((1<<3)))) {
        shadowOAM[126].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
        shadowOAM[126].attr1 = (2<<14) | ((player.x - hOff) & 0x1FF);
        shadowOAM[126].attr2 = (((player.frame * 4) * 32 + (player.direction * 4)) & 0x3FF) | (((3) & 3) << 10) | (((paletteNum) & 0xF) << 12);
    }
}


void updatePlot() {
    if ((~(buttons) & ((1<<2)))) {
        for (int i = 0; i < 24; i++) {
            if (!plotArea[i].planted) {
            if (collision(player.x, player.y, player.width / 3, player.height, plotArea[i].xp, plotArea[i].yp, plotArea[i].pixelWidth / 2, plotArea[i].pixelHeight / 2)) {
                    plotArea[i].planted = 1;
                    playPlantSound();
                    ((screenblock *)0x6000000)[31].tilemap[((plotArea[i].y1) * (32) + (plotArea[i].x1))] = ((34 & 0x3FF));
                    ((screenblock *)0x6000000)[31].tilemap[((plotArea[i].y1) * (32) + (plotArea[i].x2))] = ((35 & 0x3FF));
                    ((screenblock *)0x6000000)[31].tilemap[((plotArea[i].y2) * (32) + (plotArea[i].x1))] = ((51 & 0x3FF));
                    ((screenblock *)0x6000000)[31].tilemap[((plotArea[i].y2) * (32) + (plotArea[i].x2))] = ((52 & 0x3FF));
                    modified = 1;
                    incrementVeggieType(i);
                    totalPlanted++;
                    int j = 0;
                    while ((index[j] != 0) && (j < 24)) {
                        j++;
                    }
                    if ((index[j] == 0) && (i == 0)) {
                        index[j] = 24;
                    } else {
                        index[j] = i;
                    }
                }
            }
        }
    }

}


void incrementVeggieType(int plotIndex) {
    switch(selectVeggie) {
            case 1:

                plotArea[plotIndex].vegType = CARROT;

                carrotCount++;
                break;
            case 2:

                plotArea[plotIndex].vegType = CORN;

                cornCount++;
                break;
            case 3:

                plotArea[plotIndex].vegType = EGGPLANT;

                eggplantCount++;
                break;
            case 4:

                plotArea[plotIndex].vegType = TOMATO;

                tomatoCount++;
                break;
        }
}


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


void updateFence(int limit) {
    for (int i = 0; i < 16; i++) {
        if (fences[i].active) {
            if (fences[i].vertical) {
                shadowOAM[fences[i].shadowIndex].attr0 = (0<<13) | (0<<14) | ((fences[i].y1) & 0xFF) - vOff;
                shadowOAM[fences[i].shadowIndex].attr1 = (2<<14)| ((fences[i].x1) & 0x1FF) - hOff;
                shadowOAM[fences[i].shadowIndex].attr2 = (((24) * 32 + (5)) & 0x3FF) | (((3) & 3) << 10) | (((0) & 0xF) << 12);
            } else if (fences[i].horizontal) {
                shadowOAM[fences[i].shadowIndex].attr0 = (0<<13) | (0<<14) | ((fences[i].y1) & 0xFF) - vOff;
                shadowOAM[fences[i].shadowIndex].attr1 = (2<<14)| ((fences[i].x1) & 0x1FF) - hOff;
                shadowOAM[fences[i].shadowIndex].attr2 = (((24) * 32 + (0)) & 0x3FF) | (((3) & 3) << 10) | (((0) & 0xF) << 12);
            }
        }
    }

    if ((!(~(oldButtons) & ((1<<9))) && (~(buttons) & ((1<<9))))) {
        for (int i = 0; i < 16; i++) {
            if (collision(player.x, player.y, player.width, player.height, fences[i].x1, fences[i].y1, fences[i].width, fences[i].height)) {
                if ((fences[i].active == 0) && (fenceNum < limit)) {
                    fences[i].active = 1;
                    fenceNum++;
                }
             }
        }

    }
}


void updateRequirements() {


    shadowOAM[59].attr0 = (0<<13) | (0<<14) | ((10 - v1Off) & 0xFF);
    shadowOAM[59].attr1 = (2<<14)| ((200 - h1Off) & 0x1FF);
    shadowOAM[59].attr2 = (((19) * 32 + (1)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[60].attr0 = (0<<13) | (0<<14) | ((18 - v1Off) & 0xFF);
    shadowOAM[60].attr1 = (0<<14)| ((220 - h1Off) & 0x1FF);
    shadowOAM[60].attr2 = (((15) * 32 + (20)) & 0x3FF) | (((1) & 3) << 10);

    shadowOAM[61].attr0 = (0<<13) | (0<<14) | ((18 - v1Off) & 0xFF);
    shadowOAM[61].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
    shadowOAM[61].attr2 = (((15) * 32 + (10 + carrotR)) & 0x3FF) | (((1) & 3) << 10);

    for (int i = carrotR; i > carrotR - carrotCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[61].attr0 = (0<<13) | (0<<14) | ((18 - v1Off) & 0xFF);
        shadowOAM[61].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
        shadowOAM[61].attr2 = (((15) * 32 + (9 + i)) & 0x3FF) | (((1) & 3) << 10);
    }


    shadowOAM[56].attr0 = (0<<13) | (0<<14) | ((29 - v1Off) & 0xFF);
    shadowOAM[56].attr1 = (2<<14)| ((192 - h1Off) & 0x1FF);
    shadowOAM[56].attr2 = (((19) * 32 + (4)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[57].attr0 = (0<<13) | (0<<14) | ((37 - v1Off) & 0xFF);
    shadowOAM[57].attr1 = (0<<14)| ((220 - h1Off) & 0x1FF);
    shadowOAM[57].attr2 = (((15) * 32 + (20)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[58].attr0 = (0<<13) | (0<<14) | ((37 - v1Off) & 0xFF);
    shadowOAM[58].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
    shadowOAM[58].attr2 = (((15) * 32 + (10 + cornR)) & 0x3FF) | (((1) & 3) << 10);

    for (int i = cornR; i > cornR - cornCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[58].attr0 = (0<<13) | (0<<14) | ((37 - v1Off) & 0xFF);
        shadowOAM[58].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
        shadowOAM[58].attr2 = (((15) * 32 + (9 + i)) & 0x3FF) | (((1) & 3) << 10);
    }



    shadowOAM[53].attr0 = (0<<13) | (0<<14) | ((48 - v1Off) & 0xFF);
    shadowOAM[53].attr1 = (2<<14)| ((192 - h1Off) & 0x1FF);
    shadowOAM[53].attr2 = (((19) * 32 + (8)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[54].attr0 = (0<<13) | (0<<14) | ((56 - v1Off) & 0xFF);
    shadowOAM[54].attr1 = (0<<14)| ((220 - h1Off) & 0x1FF);
    shadowOAM[54].attr2 = (((15) * 32 + (20)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[55].attr0 = (0<<13) | (0<<14) | ((56 - v1Off) & 0xFF);
    shadowOAM[55].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
    shadowOAM[55].attr2 = (((15) * 32 + (10 + eggplantR)) & 0x3FF) | (((1) & 3) << 10);

    for (int i = eggplantR - 1; i > eggplantR - eggplantCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[55].attr0 = (0<<13) | (0<<14) | ((56 - v1Off) & 0xFF);
        shadowOAM[55].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
        shadowOAM[55].attr2 = (((15) * 32 + (9 + i)) & 0x3FF) | (((1) & 3) << 10);
    }


    shadowOAM[50].attr0 = (0<<13) | (0<<14) | ((67 - v1Off) & 0xFF);
    shadowOAM[50].attr1 = (2<<14)| ((192 - h1Off) & 0x1FF);
    shadowOAM[50].attr2 = (((19) * 32 + (12)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[51].attr0 = (0<<13) | (0<<14) | ((75 - v1Off) & 0xFF);
    shadowOAM[51].attr1 = (0<<14)| ((220 - h1Off) & 0x1FF);
    shadowOAM[51].attr2 = (((15) * 32 + (20)) & 0x3FF) | (((1) & 3) << 10);


    shadowOAM[52].attr0 = (0<<13) | (0<<14) | ((75 - v1Off) & 0xFF);
    shadowOAM[52].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
    shadowOAM[52].attr2 = (((15) * 32 + (10 + tomatoR)) & 0x3FF) | (((1) & 3) << 10);

    for (int i = tomatoR - 1; i > tomatoR - tomatoCount; i--) {
        if (i == 0) {
            break;
        }
        shadowOAM[52].attr0 = (0<<13) | (0<<14) | ((75 - v1Off) & 0xFF);
        shadowOAM[52].attr1 = (0<<14)| ((228 - h1Off) & 0x1FF);
        shadowOAM[52].attr2 = (((15) * 32 + (9 + i)) & 0x3FF) | (((1) & 3) << 10);
    }

}


void saveTilemapModData(int index) {
    if (index == 24) {
        index = 0;
    }
    ((screenblock *)0x6000000)[31].tilemap[((plotArea[index].y1) * (32) + (plotArea[index].x1))] = ((34 & 0x3FF));
    ((screenblock *)0x6000000)[31].tilemap[((plotArea[index].y1) * (32) + (plotArea[index].x2))] = ((35 & 0x3FF));
    ((screenblock *)0x6000000)[31].tilemap[((plotArea[index].y2) * (32) + (plotArea[index].x1))] = ((51 & 0x3FF));
    ((screenblock *)0x6000000)[31].tilemap[((plotArea[index].y2) * (32) + (plotArea[index].x2))] = ((52 & 0x3FF));

}


void updateFenceLimit(int num) {


    shadowOAM[20].attr0 = (0<<13) | (0<<14) | (((160 - 26) - v1Off) & 0xFF);
    shadowOAM[20].attr1 = (2<<14)| (((240 - 50) - h1Off) & 0x1FF);
    shadowOAM[20].attr2 = (((24) * 32 + (0)) & 0x3FF) | (((1) & 3) << 10) | (((0) & 0xF) << 12);


    shadowOAM[19].attr0 = (0<<13) | (0<<14) | (((160 - 18) - v1Off) & 0xFF);
    shadowOAM[19].attr1 = (2<<14)| ((220 - h1Off) & 0x1FF);
    shadowOAM[19].attr2 = (((15) * 32 + (20)) & 0x3FF) | (((1) & 3) << 10) | (((0) & 0xF) << 12);



    if ((num - fenceNum) < 10) {
        shadowOAM[18].attr0 = (0<<13) | (0<<14) | (((160 - 18) - v1Off) & 0xFF);
        shadowOAM[18].attr1 = (0<<14)| ((230 - h1Off) & 0x1FF);
        shadowOAM[18].attr2 = (((15) * 32 + (10 + ((num - fenceNum) % 10))) & 0x3FF) | (((1) & 3) << 10);
        shadowOAM[17].attr0 = (2<<8);
    } else {
        shadowOAM[18].attr0 = (0<<13) | (0<<14) | (((160 - 18) - v1Off) & 0xFF);
        shadowOAM[18].attr1 = (0<<14)| ((230 - h1Off) & 0x1FF);
        shadowOAM[18].attr2 = (((15) * 32 + (10 + ((num - fenceNum) % 10))) & 0x3FF) | (((1) & 3) << 10);
        shadowOAM[17].attr0 = (0<<13) | (0<<14) | (((160 - 18) - v1Off) & 0xFF);
        shadowOAM[17].attr1 = (0<<14)| ((225 - h1Off) & 0x1FF);
        shadowOAM[17].attr2 = (((15) * 32 + (11)) & 0x3FF) | (((1) & 3) << 10);
    }


}


void stopTimer() {
    *(volatile unsigned short*)0x400010A = 0;
    *(volatile unsigned short*)0x400010E = 0;
}


void startTimer() {
    *(volatile unsigned short*)0x400010A = (3) | (1<<7) | (1<<6);
    *(volatile unsigned short*)0x400010E = (1<<2) | (1<<7) | (1<<6);
}
