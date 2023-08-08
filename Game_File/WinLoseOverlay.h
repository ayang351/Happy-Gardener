
//{{BLOCK(WinLoseOverlay)

//======================================================================
//
//	WinLoseOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32 + 2048 = 2592
//
//	Time-stamp: 2023-04-13, 17:10:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINLOSEOVERLAY_H
#define GRIT_WINLOSEOVERLAY_H

#define WinLoseOverlayTilesLen 32
extern const unsigned short WinLoseOverlayTiles[16];

#define WinLoseOverlayMapLen 2048
extern const unsigned short WinLoseOverlayMap[1024];

#define WinLoseOverlayPalLen 512
extern const unsigned short WinLoseOverlayPal[256];

#endif // GRIT_WINLOSEOVERLAY_H

//}}BLOCK(WinLoseOverlay)
