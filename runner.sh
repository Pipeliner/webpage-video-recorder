#!/bin/bash
i=0
while sleep 1; do
/phantomjs-2.1.1-linux-i686/bin/phantomjs runner.js | ffmpeg -y -c:v png -f image2pipe -r 25 -t 100000  -i - -c:v libx264 -pix_fmt yuv420p -movflags +faststart charly$i.mp4
((i++))
done
