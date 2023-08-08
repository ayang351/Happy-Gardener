#include <stdlib.h>
#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "game.h"
#include "spritesheet.h"

//SMALL BG
#include "smallbgtilemap.h"
#include "smallBGtileset.h"

//pause state
#include "pausetilemap.h"
#include "pausetileset.h"

//game state
#include "gamestatetilemap.h"
#include "gamestatetileset.h"

//lose state
#include "LoseStateOverlay.h"

//win state
#include "winStateOverlay.h"

//instructions
#include "instructionstilemap.h"

//welcome screen text
#include "welcomeScreen.h"

//Level 1 Overlay
#include "Level1.h"

//level 2 overlay
#include "Level2.h"

//level 3 overlay
#include "Level3.h"

//pause overlay
#include "pauseOverlay.h"

//win/lose overlay
#include "WinLoseOverlay.h"

//instructions overlay
#include "instructionsOverlay.h"

//instructions overlay 2
#include "instructions2Overlay.h"

//clouds overlay
#include "CloudOverlay.h"

//sound stuff
#include "sound.h"
#include "play.h"

#define MAPWIDTH 256
#define MAPHEIGHT 256


//State prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToInstructions2();
void instructions2();
void goToGame1();
void game1();
void goToGame2();
void game2();
void goToGame3();
void game3();
void goToWin();
void win();
void goToLose();
void lose();

void initialize();
void hideSprites();

//scrolling bg functions
void titleScroll();
void scrollSecondBg();
void resetScroll();
void reset2ndScroll();

//interrupts
void setupInterrupts();
void interruptHandler();

//hoff & voff surrogate variables
extern int hOff;
extern int vOff;
extern int h1Off;
extern int v1Off;
int h2Off;
int v2Off;

//whether is passes the current level
int metRequirement;

//total number of seeds planted 
int totalPlanted;
//tracks the current state
int prev;

//control scrolling speed
int buffer;

//states
enum
{
    START,
    INSTRUCTIONS,
    INSTRUCTIONS2,
    GAME1,
    GAME2,
    GAME3,
    PAUSE,
    WIN,
    LOSE
};
int state;

OBJ_ATTR shadowOAM[128];

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch(state) {
            case START: 
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case INSTRUCTIONS2:
                instructions2();
                break;
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
                break;
            case GAME3:
                game3();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
            case WIN:
                win();
                break;
        }
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
        REG_BG1VOFF = v1Off;
        REG_BG1HOFF = h1Off;
        REG_BG2HOFF - h2Off;
        REG_BG2VOFF = v2Off;
        hideSprites();

    }
}
 
void initialize() {
    mgba_open();

    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | SPRITE_ENABLE;
    
    //Main BG
    REG_BG0CNT = 3 | BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    //Clouds BG
    REG_BG2CNT =  2 | BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(2) | BG_SCREENBLOCK(25);
    
    //Title BG
    REG_BG1CNT = 1 | BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);

    
    
    //Sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);


    //hide all sprites
    hideSprites();


    hOff = 0;
    vOff = 0;

    setupSounds();
    setupInterrupts();
    goToStart();
    
    buffer = 0;
}

//scrolls bg
void titleScroll() {
        hOff++;
        REG_BG0HOFF = hOff;
  
}

void scrollSecondBg() {
    h2Off++;
    REG_BG2HOFF = h2Off;
}

//stops scrolling bg
void resetScroll() {
    hOff = 0;
    REG_BG0HOFF = hOff;
}

void reset2ndScroll() {
    h2Off = 0;
    REG_BG2HOFF = h2Off;
}

void goToStart() {
    //Main bg
    DMANow(3, smallBGtilesetPal, PALETTE, smallBGtilesetPalLen/ 2);
    DMANow(3, smallBGtilesetTiles, &CHARBLOCK[0], smallBGtilesetTilesLen / 2);
    DMANow(3, smallbgtilemapMap, &SCREENBLOCK[31], smallbgtilemapMapLen / 2);

    //title overlay
    DMANow(3, welcomeScreenPal + 16, PALETTE + 16, 16);
    DMANow(3, welcomeScreenTiles, &CHARBLOCK[1], welcomeScreenTilesLen / 2);
    DMANow(3, welcomeScreenMap, &SCREENBLOCK[28], welcomeScreenMapLen / 2);

    //Clouds overlay
    DMANow(3, CloudOverlayPal + 64, PALETTE + 64, 16);
    DMANow(3, CloudOverlayTiles, &CHARBLOCK[2], CloudOverlayTilesLen / 2);
    DMANow(3, CloudOverlayMap, &SCREENBLOCK[25], CloudOverlayMapLen / 2);

    //start playing sound
    startGameSong();

    waitForVBlank();

    state = START;
}

void start() {

    modified = 0;

    if (buffer % 11) {
        titleScroll();
    }
    if (buffer % 3) {
        scrollSecondBg();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame1();
        initGame1();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
    buffer++;
}

void goToInstructions() {
    DMANow(3, pausetilesetPal, PALETTE, pausetilesetPalLen / 2);
    DMANow(3, pausetilesetTiles, &CHARBLOCK[0], pausetilesetTilesLen/ 2);
    DMANow(3, instructionstilemapMap, &SCREENBLOCK[31], instructionstilemapMapLen / 2);

    //overlay
    DMANow(3, instructionsOverlayPal + 32, PALETTE + 32, 16);
    DMANow(3, instructionsOverlayTiles, &CHARBLOCK[1], instructionsOverlayTilesLen / 2);
    DMANow(3, instructionsOverlayMap, &SCREENBLOCK[28], instructionsOverlayMapLen / 2);

    //transparent overlay
    DMANow(3, WinLoseOverlayPal + 16, PALETTE + 16, 16);
    DMANow(3, WinLoseOverlayTiles, &CHARBLOCK[2], WinLoseOverlayTilesLen / 2);
    DMANow(3, WinLoseOverlayMap, &SCREENBLOCK[25], WinLoseOverlayMapLen / 2);

    waitForVBlank();
    state = INSTRUCTIONS;
}

void instructions() {
    resetScroll();
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        goToInstructions2();
    } else if (BUTTON_PRESSED(BUTTON_LEFT)) {
        goToStart();
    }
}

void goToInstructions2() {

    DMANow(3, instructionsOverlayPal + 32, PALETTE + 32, 16);
    DMANow(3, instructions2OverlayTiles, &CHARBLOCK[1], instructions2OverlayTilesLen / 2);
    DMANow(3, instructions2OverlayMap, &SCREENBLOCK[28], instructions2OverlayMapLen / 2);

    waitForVBlank();
    state = INSTRUCTIONS2;
}

void instructions2() {
     if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        goToGame1();
        initGame1();
        totalPlanted = 0;
    } else if (BUTTON_PRESSED(BUTTON_LEFT)) {
        goToInstructions();

    }
}

void goToGame1() {
    unpauseSounds();
    stopTimer();

    //Game Background
    DMANow(3, gamestatetilesetPal, PALETTE, gamestatetilesetPalLen / 2);
    DMANow(3, gamestatetilesetTiles, &CHARBLOCK[0], gamestatetilesetTilesLen / 2);
    DMANow(3, gamestatetilemapMap, &SCREENBLOCK[31], gamestatetilemapMapLen / 2);

    // Level 1 overlay
    DMANow(3, Level1Pal + 48, PALETTE + 48, 16);
    DMANow(3, Level1Tiles, &CHARBLOCK[1], Level1TilesLen / 2);
    DMANow(3, Level1Map, &SCREENBLOCK[28], Level1MapLen / 2);

    //transparent overlay
    DMANow(3, WinLoseOverlayPal + 16, PALETTE + 16, 16);
    DMANow(3, WinLoseOverlayTiles, &CHARBLOCK[2], WinLoseOverlayTilesLen / 2);
    DMANow(3, WinLoseOverlayMap, &SCREENBLOCK[25], WinLoseOverlayMapLen / 2);

    //saves all tilemap modification data
        if (modified == 1) {
        for (int i = 0; i < PLOTNUM; i++) {
            if (index[i] != 0) {
                saveTilemapModData(index[i]);
            }
        }
    }
    playGameSong();
    loopGameSong();
    startTimer();

    prev = 1;

    state = GAME1;
}

void game1() {
    updateGame1(); 

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (metRequirement == 1) {
        totalPlanted = 0;
        second = 0;
        minute = 0;
        initGame2();
        goToGame2();
    }
    if (metRequirement == 0 && (totalPlanted == PLOTNUM)) {
        second = 0;
        minute = 0;
        totalPlanted = 0;
        goToLose();
    }
}

void goToGame2() {
    unpauseSounds();
    stopTimer();


    //Game background
    DMANow(3, gamestatetilesetPal, PALETTE, gamestatetilesetPalLen / 2);
    DMANow(3, gamestatetilesetTiles, &CHARBLOCK[0], gamestatetilesetTilesLen / 2);
    DMANow(3, gamestatetilemapMap, &SCREENBLOCK[31], gamestatetilemapMapLen / 2);

    // Level 2 overlay
    DMANow(3, Level2Pal + 48, PALETTE + 48, 16);
    DMANow(3, Level2Tiles, &CHARBLOCK[1], Level2TilesLen / 2);
    DMANow(3, Level2Map, &SCREENBLOCK[28], Level2MapLen / 2);

    //transparent overlay
    DMANow(3, WinLoseOverlayPal + 16, PALETTE + 16, 16);
    DMANow(3, WinLoseOverlayTiles, &CHARBLOCK[2], WinLoseOverlayTilesLen / 2);
    DMANow(3, WinLoseOverlayMap, &SCREENBLOCK[25], WinLoseOverlayMapLen / 2);

    //saves all tilemap modification data
    if (modified == 1) {
        for (int i = 0; i < PLOTNUM; i++) {
            if (index[i] != 0) {
                saveTilemapModData(index[i]);
            }
        }
    }

    playGameSong();
    loopGameSong();
    startTimer();
    prev = 2;

    state = GAME2;
}

void game2() {
    updateGame2(); //updates game objects


    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (metRequirement == 1) {
        second = 0;
        minute = 0;
        totalPlanted = 0;
        initGame3();
        goToGame3();
    }
    if (metRequirement == 0 && (totalPlanted == PLOTNUM)) {
        second = 0;
        minute = 0;
        totalPlanted = 0;
        goToLose();
    }
}

void goToGame3() {
    unpauseSounds();
    stopTimer();
  
    //Game background
    DMANow(3, gamestatetilesetPal, PALETTE, gamestatetilesetPalLen / 2);
    DMANow(3, gamestatetilesetTiles, &CHARBLOCK[0], gamestatetilesetTilesLen / 2);
    DMANow(3, gamestatetilemapMap, &SCREENBLOCK[31], gamestatetilemapMapLen / 2);

    // Level 3 overlay
    DMANow(3, Level3Pal + 48, PALETTE + 48, 16);
    DMANow(3, Level3Tiles, &CHARBLOCK[1], Level2TilesLen / 2);
    DMANow(3, Level3Map, &SCREENBLOCK[28], Level2MapLen / 2);

    //transparent overlay
    DMANow(3, WinLoseOverlayPal + 16, PALETTE + 16, 16);
    DMANow(3, WinLoseOverlayTiles, &CHARBLOCK[2], WinLoseOverlayTilesLen / 2);
    DMANow(3, WinLoseOverlayMap, &SCREENBLOCK[25], WinLoseOverlayMapLen / 2);

    //saves all tilemap modification data
    if (modified == 1) {
        for (int i = 0; i < PLOTNUM; i++) {
            if (index[i] != 0) {
                saveTilemapModData(index[i]);
            }
        }
    }

    playGameSong();
    loopGameSong();
    startTimer();

    prev = 3;

    state = GAME3;
}


void game3() {
    updateGame3(); //updates game objects

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (metRequirement == 1) {
        second = 0;
        minute = 0;
        totalPlanted = 0;
        goToWin();
    }
    if (metRequirement == 0 && (totalPlanted == PLOTNUM)) {
        second = 0;
        minute = 0;
        totalPlanted = 0;
        goToLose();
    }
}

void goToPause() {

    //pause state background
    DMANow(3, pausetilesetPal, PALETTE, pausetilesetPalLen / 2);
    DMANow(3, pausetilesetTiles, &CHARBLOCK[0], pausetilesetTilesLen/ 2);
    DMANow(3, instructionstilemapMap, &SCREENBLOCK[31], instructionstilemapMapLen / 2);

    //pause text overlay
    DMANow(3, pauseOverlayPal + 32, PALETTE + 32, 16);
    DMANow(3, pauseOverlayTiles, &CHARBLOCK[1], pauseOverlayTilesLen / 2);
    DMANow(3, pauseOverlayMap, &SCREENBLOCK[28], pauseOverlayMapLen / 2);
    pauseSounds();

    playPauseSong();
    loopPauseSong();

    state = PAUSE;
}

void pause() {
    vOff = 0;
    hOff = 0;

    //goes back to the current game state
    if (BUTTON_PRESSED(BUTTON_START)) {
        if (prev == 1) {
            goToGame1();
        } else if (prev == 2) {
            goToGame2();
        } else if (prev == 3) {
            goToGame3();
        }
    }

    //restarts the game
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    stopTimer();

    //lose state background
    DMANow(3, pausetilesetPal, PALETTE, pausetilesetPalLen / 2);
    DMANow(3, pausetilesetTiles, &CHARBLOCK[0], pausetilesetTilesLen/ 2);
    DMANow(3, instructionstilemapMap, &SCREENBLOCK[31], instructionstilemapMapLen / 2);

    // Lose overlay
    DMANow(3, LoseStateOverlayPal + 32, PALETTE + 32, 16);
    DMANow(3, LoseStateOverlayTiles, &CHARBLOCK[1], LoseStateOverlayTilesLen / 2);
    DMANow(3, LoseStateOverlayMap, &SCREENBLOCK[28], LoseStateOverlayMapLen / 2);

    pauseSounds();
    playLoseSound();

    state = LOSE;
}

void lose() {
    vOff = 0;
    hOff = 0;
    if (BUTTON_PRESSED(BUTTON_START)) {
        modified = 0;
        goToStart();
    }
}

void goToWin() {
    stopTimer();
    
    //win state background
    DMANow(3, pausetilesetPal, PALETTE, pausetilesetPalLen / 2);
    DMANow(3, pausetilesetTiles, &CHARBLOCK[0], pausetilesetTilesLen/ 2);
    DMANow(3, instructionstilemapMap, &SCREENBLOCK[31], instructionstilemapMapLen / 2);

    //win overlay
    DMANow(3, winStateOverlayPal + 32, PALETTE + 32, 16);
    DMANow(3, winStateOverlayTiles, &CHARBLOCK[1], winStateOverlayTilesLen / 2);
    DMANow(3, winStateOverlayMap, &SCREENBLOCK[28], winStateOverlayMapLen / 2);
    
    pauseSounds();
    playWinSound();
    state = WIN;
}

void win() {
    hOff = 0;
    vOff = 0;
    if (BUTTON_PRESSED(BUTTON_START)) {
        modified = 0;
        goToStart();
    }
}

//interrupt set-up
void setupInterrupts() {

	REG_IME = 0;

    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;

    REG_INTERRUPT = &interruptHandler;

	REG_IME = 1;

}

//handle interrupt
void interruptHandler() {

	REG_IME = 0;

	if (REG_IF & IRQ_VBLANK) {

        soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                playSoundA(soundA.data, soundA.dataLength, soundA.looping);
            }
        

        soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    REG_TM1CNT = 0;
                    dma[2].cnt = 0;
                }
            }

	}

    //set timer data
     if (REG_IF & IRQ_TIMER(2)) {
        second = (second + 1) % 60;
    } 

    if (REG_IF & IRQ_TIMER(3)) {
        minute = (minute + 1) % 100;
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}