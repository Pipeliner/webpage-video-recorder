#!/bin/bash -x
vol=19
while true; do
  #sleep 1d
  echo pause
  read
  find . -name "charly*.mp4" -size -100k -delete
  du -sh charly*mp4 | sort -rh | awk '{print $2}' | sort | awk '{print "file ", $1}' > join.txt
  rm charly-united.mp4
  ffmpeg -f concat -i join.txt -c copy charly-united.mp4
  cat join.txt | awk '{print $2}' | tac | sed 1d | tac | xargs rm

  ((vol++))
  youtube-upload --title="qw's DCSS play vol. $vol" charly-united.mp4
done
