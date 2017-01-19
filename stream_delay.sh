INPUT_STREAM="rtp://@239.35.10.2:10000"
OUTPUT_STREAM="udp://127.0.0.1:1234"

DELAY=30
INPUT_RESOLUTION="1280x720"

ffmpeg -y -nostdin -f lavfi -i nullsrc=s=${INPUT_RESOLUTION}:d=${DELAY} -an -r 50 -i ${INPUT_STREAM} -filter_complex "concat" -an -r 10 -tune zerolatency -preset fast -vcodec libx264 -f mpegts ${OUTPUT_STREAM}
