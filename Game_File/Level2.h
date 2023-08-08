
//{{BLOCK(Level2)

//======================================================================
//
//	Level2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 13 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 416 + 2048 = 2976
//
//	Time-stamp: 2023-04-30, 01:20:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL2_H
#define GRIT_LEVEL2_H

#define Level2TilesLen 416
extern const unsigned short Level2Tiles[208];

#define Level2MapLen 2048
extern const unsigned short Level2Map[1024];

#define Level2PalLen 512
extern const unsigned short Level2Pal[256];

#endif // GRIT_LEVEL2_H

//}}BLOCK(Level2)
