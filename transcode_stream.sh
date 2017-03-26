#!/bin/sh
#INPUT_STREAM="rtp://@239.35.10.2:10000"
INPUT_STREAM=$1

CAMERA_DIR="/mnt/data/cams"
CAMERA="cam$2"

# Use this for nvidia hardware acceleration
#CODEC="h264_nvenc"
# Use this if no nvidia device is present
CODEC="libx264"

mkdir -p ${CAMERA_DIR}

# Set -crf 0 after -preset slow to enable lossless mode
ffmpeg -loglevel info -y -nostdin -overrun_nonfatal 1 -i "${INPUT_STREAM}" -vcodec copy -f mpegts "${CAMERA_DIR}/${CAMERA}.mp4"
#ffmpeg -loglevel info -y -nostdin -an -overrun_nonfatal 1 -i "${INPUT_STREAM}" -an -vcodec libx264 -preset slow -f mpegts "${CAMERA_DIR}/${CAMERA}.mp4"
