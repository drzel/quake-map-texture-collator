# quake-map-texture-collator
This simple and rudimentary bash script will pull the required .png or .tga textures from your pool of loose textures base on their file names and organise them into map specific folders. Creating text files to indicate which files are still required.

## Regirements
Requires qfbsp from [The QuakeForge Project](www.quakeforge.net). May work with other versions of bsp (untested).

## Usage
Copy any .tga or .png files to itextures/.
Copy and .bsp files to maps/map.bsp.

Usage: ./qmtc.sh QFBSP-FILE-PATH

For each map it will create three text files:
map-textures.txt - a text list of all textures in the map.
map-quake.txt - a list of all textures from the original pak0.pak and pak1.pak.
map-ext.txt - a list of all other textures.

Then it will go through the .tga and .png files looking for matches by file type and copies these into the textures/map/. .tga files take higher priority like in ezQuake.
