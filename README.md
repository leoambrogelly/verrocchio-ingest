# Verrocchio

A script written to automatically import footage from SD cards and prepare it for editing in DaVinci Resolve.
Andrea del Verrocchio was a sculptor and friend of Leonardo da Vinci, thus the script's name.

**WARNING:** This script only works out-of-the-box if you have nothing besides your SD card mounted in your /media/ folder. It is possible to exclude storage devices using the arguments: -not -path "{/path/to/drive/*}"

**Install Tutorial:**

1. Ensure you have the following dependencies installed: GNU/Linux based Operating System, BASH, FFmpeg, GNU Utilities.

BASH and GNU Utilities are typically shipped with GNU/Linux based Operating Systems. Install FFmpeg using:

  **Debian and Derivatives:** sudo apt-get install ffmpeg
  
  **Fedora and Derivatives:** sudo yum install ffmpeg

2. Insert an SD card or external file storage device with video files on it. File extensions must be either .MOV or .MP4.

3. Run Script.

  If you get a permissions error, you may need to run this command: chmod +x {/path/to/file}/Verrocchio.sh
