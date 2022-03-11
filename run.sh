#!/bin/sh

docker run -d --rm \
       -e DISPLAY=unix$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v $(pwd)/.config:/home/developer/.config \
       pomodone-docker 
