
//{{BLOCK(instructionsOverlay)

//======================================================================
//
//	instructionsOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 167 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5344 + 2048 = 7904
//
//	Time-stamp: 2023-04-30, 02:05:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSOVERLAY_H
#define GRIT_INSTRUCTIONSOVERLAY_H

#define instructionsOverlayTilesLen 5344
extern const unsigned short instructionsOverlayTiles[2672];

#define instructionsOverlayMapLen 2048
extern const unsigned short instructionsOverlayMap[1024];

#define instructionsOverlayPalLen 512
extern const unsigned short instructionsOverlayPal[256];

#endif // GRIT_INSTRUCTIONSOVERLAY_H

//}}BLOCK(instructionsOverlay)
