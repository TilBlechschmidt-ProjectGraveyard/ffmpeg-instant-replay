INPUT_STREAM="rtp://@239.35.10.2:10000"

CAMERA_DIR="/mnt/data/cams"
CAMERA="cam1"

# Set -crf 0 after -preset slow to enable lossless mode
ffmpeg -loglevel info -y -nostdin -an -r 50 -i "${INPUT_STREAM}" -an -vcodec h264_nvenc -preset slow -f mpegts "${CAMERA_DIR}/${CAMERA}.mp4"
