#!/bin/sh

FULL_PATH="$(realpath "$0")"
DIR_PATH="$(dirname "$FULL_PATH")"

docker run --name pomodone_app -d --rm \
       -e DISPLAY=unix$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v "$DIR_PATH"/.config:/home/developer/.config \
       pomodone-docker 
