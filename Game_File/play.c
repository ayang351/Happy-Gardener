#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"

#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#include "play.h"
#include "sound.h"

#include "WelcomeMusic.h"
#include "GameplayMusic.h"
#include "pausemusic.h"
#include "WinMusic.h"
#include "plantSound.h"
#include "loseSound.h"

SONG songs[SONGCOUNT];


int currentSong;
int paused;


void startGameSong() {

    currentSong = 0;
    paused = 1;
    
    songs[0].sampleRate = WelcomeMusic_sampleRate;
    songs[0].length = WelcomeMusic_length;
    songs[0].data = WelcomeMusic_data;

    songs[1].sampleRate = GameplayMusic_sampleRate;
    songs[1].length = GameplayMusic_length;
    songs[1].data = GameplayMusic_data;


    songs[2].sampleRate = pausemusic_sampleRate;
    songs[2].length = pausemusic_length;
    songs[2].data = pausemusic_data;


    songs[3].sampleRate = WinMusic_sampleRate;
    songs[3].length = WinMusic_length;
    songs[3].data = WinMusic_data;


    songs[4].sampleRate = plantSound_sampleRate;
    songs[4].length = plantSound_length;
    songs[4].data = plantSound_data;

    songs[5].sampleRate = loseSound_sampleRate;
    songs[5].length = loseSound_length;
    songs[5].data = loseSound_data;

    
    playSong(currentSong);

} 

void playSong(int s) {

    playSoundA(songs[s].data, songs[s].length, songs[s].looping);

    REG_TM2CNT = TIMER_OFF;
    REG_TM2D = 65536 - 16384;
    
    REG_TM3CNT = TIMER_OFF;
    REG_TM3D = 65536 - 60;
    
   
    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;

}

void playSong2(int s) {
    playSoundB(songs[s].data, songs[s].length, songs[s].looping);

    REG_TM2CNT = TIMER_OFF;
    REG_TM2D = 65536 - 16384;
    
    REG_TM3CNT = TIMER_OFF;
    REG_TM3D = 65536 - 60;
    
   
    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
}

void playIntroSong() {
    playSong(0);
}

void loopIntroSong() {
    if (!soundA.isPlaying && soundA.vBlankCount > soundA.durationInVBlanks) {
        playSong(0); //intro song loops forever
    }
}

void playGameSong() {
    playSong(1);
}
void loopGameSong() {
    if (!soundA.isPlaying && soundA.vBlankCount > soundA.durationInVBlanks) {
        playSong(1); //intro song loops forever
    }
}

void playPauseSong() {
    playSong(2);
}

void loopPauseSong() {
     if (!soundA.isPlaying && soundA.vBlankCount > soundA.durationInVBlanks) {
        playSong(2); //pause song loops forever
    }
}

void playWinSound() {
    playSong(3);
}

void playPlantSound() {
    playSong2(4);
}

void playLoseSound() {
    playSong(5);
}



