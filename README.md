# YTDL.cmd

A simple batch file to make [YouTube-DL](https://ytdl-org.github.io/youtube-dl/) easier to use

[![image](https://user-images.githubusercontent.com/79026235/152910441-59ba653c-5607-4f59-90c0-bc2851bf2688.png)Download the zip file](https://github.com/LesFerch/YTDL.cmd/archive/refs/heads/main.zip)

![image](https://github.com/LesFerch/YTDL.cmd/assets/79026235/5160a22f-15e0-43ce-976d-1ae4afa4cd28)

Requires [YouTube-DL.exe](https://ytdl-org.github.io/youtube-dl/) and, optionally, [FFMPEG.exe](https://ffmpeg.org/download.html)

This script provides an easy way to select specific video and/or audio streams and download all or part of your selection.

For stream, you can enter a single number or two numbers joined with a plus sign (no spaces). For example, 137+140, will copy video from
stream 137 and audio from stream 140. By default, it selects bestvideo+bestaudio.

Note: Using ffmpeg to download part of a video will only save time when downloading a very small chunk.

You can convert to MP3 using this script, but please note you cannot add quality. If you select
MP3 and 320K, it will just re-encode the original 129K stream and make a bigger file.

For audio only, usually the best option is to select stream 140 (M4A-AAC) and leave it as is.
