INPUT_STREAM="udp://127.0.0.1:1234"
OUTPUT_FILE="output.mov"

# Note that aprox 4-7 seconds get cut off at the beginning
DURATION="00:00:30"

ffmpeg -y -nostdin -i ${INPUT_STREAM} -t ${DURATION} -vcodec copy -f avi pipe: | ffmpeg -y -nostdin -i pipe:0 -vf blackdetect=d=0.1:pix_th=.1 -vcodec prores -profile:v 3 ${OUTPUT_FILE}
