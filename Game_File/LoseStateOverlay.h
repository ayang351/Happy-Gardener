
//{{BLOCK(LoseStateOverlay)

//======================================================================
//
//	LoseStateOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 44 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1408 + 2048 = 3968
//
//	Time-stamp: 2023-04-30, 02:45:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESTATEOVERLAY_H
#define GRIT_LOSESTATEOVERLAY_H

#define LoseStateOverlayTilesLen 1408
extern const unsigned short LoseStateOverlayTiles[704];

#define LoseStateOverlayMapLen 2048
extern const unsigned short LoseStateOverlayMap[1024];

#define LoseStateOverlayPalLen 512
extern const unsigned short LoseStateOverlayPal[256];

#endif // GRIT_LOSESTATEOVERLAY_H

//}}BLOCK(LoseStateOverlay)
