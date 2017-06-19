INPUT_FILE="$1"
STREAM_SERVER="rtmp://localhost:1935/live"

CAMERA="$2"
BITRATE="4000k"
BUFFER="1835k"

ffmpeg -y -nostdin -re -i "${INPUT_FILE}" -an -vcodec copy -f flv "${STREAM_SERVER}/${CAMERA}"
#ffmpeg -y -nostdin -re -i "${INPUT_FILE}" -an -c:v h264_nvenc -b:v "${BITRATE}" -minrate "${BITRATE}" -maxrate "${BITRATE}" -bufsize "${BUFFER}" -f flv "${STREAM_SERVER}/${CAMERA}"
