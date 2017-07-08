#!/usr/bin/env bash

cd "$1"
find . type f | grep wma$ > wma-files.txt

readarray -t files < wma-files.txt

ffprobe=/usr/local/google/home/rajivpb/bin/ffmpeg-git-20170621-64bit-static/ffprobe
ffmpeg=/usr/local/google/home/rajivpb/bin/ffmpeg-git-20170621-64bit-static/ffmpeg
for file in "${files[@]}"; do
    out=${file%.wma}.mp3
    bit_rate=`$ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "$file"`
    $ffmpeg -i "$file" -vn -ar 44100 -ac 2 -ab "$bit_rate" -f mp3 "$out"
done

