#ifndef PLAY_H
#define PLAY_H

#define SONGCOUNT 6

typedef struct {

    char* title;
    unsigned int sampleRate;
    unsigned int length;
    signed char* data;
    int looping;

} SONG;

SONG songs[SONGCOUNT];

void startGameSong();
void playSong(int);


extern int paused;
extern int currentSong;


#endif