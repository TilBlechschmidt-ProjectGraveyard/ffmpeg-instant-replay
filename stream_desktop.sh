#!/bin/sh
ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -s 1920x1080 -i :0.0+1920,0 -f pulse -ac 2 -i default -c:v libx264 -preset fast -pix_fmt yuv420p -s 1280x800 -c:a aac -b:a 160k -ar 44100 -threads 0 -f mpegts udp://127.0.0.1:6000
