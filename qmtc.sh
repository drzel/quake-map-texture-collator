#!/bin/bash

# extracts names itextures from map/map.bsp
# ref: gettextnames.sh

if [[ "$1" -eq "" ]]; then
	echo Usage: ./everything.sh QFBSPFILEPATH
else
	for map in maps/**/*.bsp; do
		
		basemap="$(basename ${map%.bsp})"
		savedir="textures/${basemap}"
		outputfile="${savedir}/${basemap}-textures.txt"
		outputfile_qrp="${savedir}/${basemap}-quake.txt"
		outputfile_ext="${savedir}/${basemap}-ext.txt"
		
		mkdir ${savedir}

		echo
		echo writing: ${map}
		"$1" --extract-textures ${map} | awk '{print $3}' | sed s/\*/\#/ >> ${outputfile}

		while read texture; do
			if [ -a itextures/${texture}.tga ]; then
				echo Found: ${texture}
				echo ${texture} >> ${outputfile_qrp}
				cp itextures/${texture}.tga ${savedir}
			elif [ -a itextures/${texture}.png ]; then
				echo Found: ${texture}
				echo ${texture} >> ${outputfile_qrp}
				cp itextures/${texture}.png ${savedir}
			else
				echo Not found: ${texture}
				echo ${texture} >> ${outputfile_ext}
			fi
		done < ${outputfile}
	done
fi
