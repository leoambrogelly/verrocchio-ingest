#!/bin/bash

TARGETFOLDER="/home/$USER/Videos/Footage from `date +"%b %d, %Y"`"
SOURCEFOLDER="/media/$USER"

# Check for ffmpeg
[[ $(which ffmpeg 2>/dev/null) ]] || { echo "ERROR: ffmpeg needs to be installed. Use 'sudo apt-get install ffmpeg'";deps=1; }
[[ $deps -ne 1 ]] || exit 1

# Make target directory and name it something nice.
mkdir "${TARGETFOLDER}"

# Copy all of the files we care about to the target directory.
find "${SOURCEFOLDER}" -type f -regextype posix-extended -regex '.*.(MP4|MOV)' -exec cp "{}" "${TARGETFOLDER}/" \;
echo "STEP ONE COMPLETED: Moved all video files from SD card to video folder."

# Use ffmpeg to transcode files.
for i in "${TARGETFOLDER}/"*.MP4 "${TARGETFOLDER}/"*.MOV
    do 
        ffmpeg -i "$i" -vcodec prores -acodec pcm_s24le -max_muxing_queue_size 1024 "${i%.*}.mov"
    done
echo "STEP TWO COMPLETED: Transcoded all video files."

# Make a meta-folder for Transcoded files.
mkdir "${TARGETFOLDER}/Transcoded"

# Move Transcoded files to meta-folder, ignoring files already in said meta-folder.
find "${TARGETFOLDER}" -type f -name "*.mov" -not -path "${TARGETFOLDER}/Transcoded/*" -exec mv "{}" "${TARGETFOLDER}/Transcoded/" \;
echo "SCRIPT COMPLETED: Moved transcoded files to meta-folder."
