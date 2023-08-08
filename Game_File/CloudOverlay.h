
//{{BLOCK(CloudOverlay)

//======================================================================
//
//	CloudOverlay, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 274 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8768 + 2048 = 11328
//
//	Time-stamp: 2023-04-27, 16:35:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CLOUDOVERLAY_H
#define GRIT_CLOUDOVERLAY_H

#define CloudOverlayTilesLen 8768
extern const unsigned short CloudOverlayTiles[4384];

#define CloudOverlayMapLen 2048
extern const unsigned short CloudOverlayMap[1024];

#define CloudOverlayPalLen 512
extern const unsigned short CloudOverlayPal[256];

#endif // GRIT_CLOUDOVERLAY_H

//}}BLOCK(CloudOverlay)
