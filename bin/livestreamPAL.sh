#/bin/bash

ffmpeg -threads 0 -re -fflags +genpts \
  -f lavfi -i "testsrc=size=1280x720:rate=25" \
  -f lavfi -i sine=b=4:r=44100 -map 0:v -map 1:a \
  $ffmpeg_filters \
  -vf "drawtext=fontfile=/Users/rstruhl/Library/Fonts/OperatorMonoSSm-MediumItalic.otf:timecode='00\:00\:00\:00':r=25:x=100:y=100:fontcolor=white:box=1:boxcolor=0x00000000@1:boxborderw=5:fontsize=30" \
  -r 25 -g 50 -ar 44100 -pix_fmt yuv420p -preset superfast \
  -tune zerolatency -bufsize 1 -c:v libx264 -x264opts keyint=25:min-keyint=25:scenecut=-1 \
  -b:v 3000k -profile:v baseline -level 3.0 \
  -c:a aac -b:a 96k -bsf:a aac_adtstoasc \
  -f flv -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 \
  $1/alive
