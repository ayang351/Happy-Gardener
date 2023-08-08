
//{{BLOCK(winStateOverlay)

//======================================================================
//
//	winStateOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 42 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1344 + 2048 = 3904
//
//	Time-stamp: 2023-04-30, 02:37:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSTATEOVERLAY_H
#define GRIT_WINSTATEOVERLAY_H

#define winStateOverlayTilesLen 1344
extern const unsigned short winStateOverlayTiles[672];

#define winStateOverlayMapLen 2048
extern const unsigned short winStateOverlayMap[1024];

#define winStateOverlayPalLen 512
extern const unsigned short winStateOverlayPal[256];

#endif // GRIT_WINSTATEOVERLAY_H

//}}BLOCK(winStateOverlay)
