
//{{BLOCK(Level1)

//======================================================================
//
//	Level1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 13 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 416 + 2048 = 2976
//
//	Time-stamp: 2023-04-30, 01:21:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL1_H
#define GRIT_LEVEL1_H

#define Level1TilesLen 416
extern const unsigned short Level1Tiles[208];

#define Level1MapLen 2048
extern const unsigned short Level1Map[1024];

#define Level1PalLen 512
extern const unsigned short Level1Pal[256];

#endif // GRIT_LEVEL1_H

//}}BLOCK(Level1)
