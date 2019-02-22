#!/bin/bash

ffmpeg -threads 0 -re -fflags +genpts -f lavfi -i "testsrc=size=hd1080:rate=30:duration=10" -vf "frei0r=glitch0r:0.04|0.1|0.2|0.2,drawtext=fontfile=/Users/rstruhl/Library/Fonts/OperatorMonoSSm-Medium.otf:timecode='00\:00\:00\:00':r=30:x=100:y=100:fontcolor=white:box=1:boxcolor=0x00000000@1:boxborderw=5:fontsize=30" -pix_fmt yuv420p -preset superfast -tune zerolatency -bufsize 1 -c:v libx264 -x264opts keyint=30:min-keyint=30:scenecut=-1 -b:v 3000k -profile:v baseline -level 3.0 -f flv -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 $1/alive
