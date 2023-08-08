
//{{BLOCK(pauseOverlay)

//======================================================================
//
//	pauseOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 66 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2112 + 2048 = 4672
//
//	Time-stamp: 2023-04-30, 02:28:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEOVERLAY_H
#define GRIT_PAUSEOVERLAY_H

#define pauseOverlayTilesLen 2112
extern const unsigned short pauseOverlayTiles[1056];

#define pauseOverlayMapLen 2048
extern const unsigned short pauseOverlayMap[1024];

#define pauseOverlayPalLen 512
extern const unsigned short pauseOverlayPal[256];

#endif // GRIT_PAUSEOVERLAY_H

//}}BLOCK(pauseOverlay)
