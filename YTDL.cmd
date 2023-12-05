@Echo Off
::Requires YouTube-DL.exe and, optionally, FFMPEG.exe
::This script provides an easy way to select specific video and/or audio streams and
::download all or part of your selection. For stream, you can enter a single number or two
::numbers joined with a plus sign (no spaces). For example, 137+140, will copy video from
::stream 137 and audio from stream 140. By default, it selects bestvideo+bestaudio.
::Using ffmpeg to download part of a video will only save time when downloading a very small chunk.
::You can convert to MP3 using this script, but please note you cannot add quality. If you select
::MP3 and 320K, it will just reencode the original 129K stream and make a bigger file.
::For audio only, usually the best option is to select stream 140 (M4A-AAC) and leave it as is.

Set URL=
Set Stream=bestvideo+bestaudio
Set Start=
Set Stop=
Set AF=
Set AQ=
Set Audio=
Set Mode=0

Echo.
Set /P URL="Enter video URL: "
If "%URL%"=="" Goto End

YouTube-DL -F "%URL%"

Echo.
Set /P Stream="Enter stream number(s) (n or n+n or Enter for bestvideo+bestaudio): "
Set /P start="Enter start time (in seconds or hh:mm:ss or Enter for 0): "
If Not "%Start%"=="" Set Start=-ss %Start%
Set /P Stop="Enter stop time (in seconds hh:mm:ss or Enter for end): "
If Not "%Stop%"=="" Set Stop=-to %Stop%
If "%Start%%Stop%"=="" Goto Audio
Set /P Mode="Enter 2 to download using ffmpeg (Enter to use YouTube-DL only): "
If Not %Mode%==2 Set Mode=1
:Audio
Set /P AF="Enter format to convert audio (e.g. mp3, or Enter to keep original): "
If "%AF%"=="" Goto Process
Set Audio=-x --audio-format %AF%
Set /P AQ="Enter audio convert quality (e.g. 192K or Enter for default): "
If Not "%AQ%"=="" Set Audio=%Audio% --audio-quality %AQ%

:Process
If %Mode%==0 YouTube-DL -f %stream% %Audio% "%URL%"
If %Mode%==1 YouTube-DL -f %stream% %Audio% --postprocessor-args "%Start% %Stop%" "%URL%"
If %Mode%==2 YouTube-DL -f %stream% %Audio% --external-downloader ffmpeg --external-downloader-args "%Start% %Stop%" "%URL%"

:End