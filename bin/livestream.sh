#/bin/bash

ffmpeg -threads 0 -re -fflags +genpts -f lavfi -i "testsrc=size=1280x720:rate=30" -f lavfi -i sine=b=4:r=44100 -map 0:v -map 1:a $ffmpeg_filters -r 30 -g 60 -ar 44100 -pix_fmt yuv420p -preset superfast -tune zerolatency -bufsize 1 -c:v libx264 -x264opts keyint=30:min-keyint=30:scenecut=-1 -b:v 3000k -profile:v baseline -level 3.0 -c:a aac -b:a 96k -bsf:a aac_adtstoasc -f flv -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 $1/alive
