
//{{BLOCK(instructions2Overlay)

//======================================================================
//
//	instructions2Overlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 136 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4352 + 2048 = 6912
//
//	Time-stamp: 2023-04-30, 02:17:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS2OVERLAY_H
#define GRIT_INSTRUCTIONS2OVERLAY_H

#define instructions2OverlayTilesLen 4352
extern const unsigned short instructions2OverlayTiles[2176];

#define instructions2OverlayMapLen 2048
extern const unsigned short instructions2OverlayMap[1024];

#define instructions2OverlayPalLen 512
extern const unsigned short instructions2OverlayPal[256];

#endif // GRIT_INSTRUCTIONS2OVERLAY_H

//}}BLOCK(instructions2Overlay)
