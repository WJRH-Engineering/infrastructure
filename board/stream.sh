#!/bin/sh

ffmpeg -re -f alsa \
	-c:a pcm_s32le\
       	-channels 2\
       	-sample_rate 44100\
       	-guess_layout_max 0\
       	-i hw:1,0\
       	-acodec libmp3lame\
       	-ab 32k\
       	-ac 1\
       	-content_type audio/mpeg\
       	-f mp3\
       	icecast://source:hogghall@api.wjrh.org:8000/board
