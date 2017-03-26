CAMERA_DIR="/mnt/data/cams"

CAMERA="cam$1"
OUTPUT_FILE="replay_${CAMERA}_$(date -Iseconds).mov"

DURATION="00:00:30"
PREEVENT="-15"

ffmpeg -nostdin -y -sseof "${PREEVENT}" -t "${DURATION}" -i "${CAMERA_DIR}/${CAMERA}.mp4" "${OUTPUT_FILE}"

#ffmpeg -nostdin -y -sseof "${PREEVENT}" -t "${DURATION}" -r 25 -i "${CAMERA_DIR}/${CAMERA}.mp4" "${OUTPUT_FILE}"
#ffmpeg -y -nostdin -i ${INPUT_STREAM} -t ${DURATION} -vcodec copy -f avi pipe: | ffmpeg -y -nostdin -i pipe:0 -vf blackdetect=d=0.1:pix_th=.1 -vcodec prores -profile:v 3 ${OUTPUT_FILE}
