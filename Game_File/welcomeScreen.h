
//{{BLOCK(welcomeScreen)

//======================================================================
//
//	welcomeScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 101 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3232 + 2048 = 5792
//
//	Time-stamp: 2023-04-04, 11:59:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WELCOMESCREEN_H
#define GRIT_WELCOMESCREEN_H

#define welcomeScreenTilesLen 3232
extern const unsigned short welcomeScreenTiles[1616];

#define welcomeScreenMapLen 2048
extern const unsigned short welcomeScreenMap[1024];

#define welcomeScreenPalLen 512
extern const unsigned short welcomeScreenPal[256];

#endif // GRIT_WELCOMESCREEN_H

//}}BLOCK(welcomeScreen)
