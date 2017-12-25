# FFmpeg scripts #

Drag and drop video(s) to batch files to do simple processing with ffmpeg.

Output files are usually same name as original, with an appended name tag and/or has a different extension.
This means output will never overwrite the input, though it is possible to indirectly overwrite with format conversion.

ffmpeg must be on the PATH environment variable.

Video, Audio, Subtitle, metadata, and container format are preserved whenever possible.
When re-encode is necessary (e.g. hardsub and other filters), very high quality encoding is used to preserve data, and should be followed by conversion to more efficient format(s).

## cv (codec video) ##

Convert video to h264/hevc/vp9.  Audio is copied (if any).

### cv_none ###

Throws video away, leaving only audio.


## ca (codec audio) ##

Convert audio to aac-lc/vorbis.  Video is copied (if any).

### ca_none ###

Throws audio away, leaving only video.


## cs (codec subtitle) ##

Various subtitle processing.

### cs_ass, cs_ssa, cs_srt ###

Convert subtitle file(s) to ass, ssa, or srt.

### cs_embed ###

Embed an ass/ssa/srt file (in this order) to input video, saved as mkv.
The subtitle file must have same name as the video.
All subtitle tracks will be discarded before adding the new track.

### cs_hardsub ###

Hardsub an ass/ssa/srt/embedded subtitle (in this order) to input video, saved as mkv.
The ass/ssa/srt file must have same name as the video.
All subtitle tracks will be discarded.


## cf (container format) ##

Change container format, i.e. mp4 to mkv or vice versa.

Embedded subtitles (if any) will be converted to mov_text for mp4, or ass for mkv.

Conversion may fail if the video/audio codec is incompatible; I won't auto-convert for you.

### cf_metadata_clear ###

Clear stream and container metadata.  Nothing else is changed.
Note that ffmpeg will add a few basic metadata to the container.


## filter ##

Filtered video and/or audio.

### filter_scale ###

Scale video up or down.

### filter_speed ###

Speed video and audio up or down.



## other ##

### ffprobe ###

Dump the info of all dragged file(s) and pause.