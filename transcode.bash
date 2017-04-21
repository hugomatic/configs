#!/usr/bin/env bash

# recordmydesktop generates out.ogv
# this script creates out.mp4

/usr/bin/ffmpeg -y -i out.ogv -s 1280x720 -aspect 16:9 -r 30000/1001 -b 2M -bt 4M -pass 1 -vcodec libx264 -threads 0 -an -f mp4 -loglevel verbose ./out.mp4
