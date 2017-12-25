# Mozjpeg for Windows #

This is a wrapper for [Mozilla JPEG Encoder Project](https://github.com/mozilla/mozjpeg),
a high efficiency jpeg "compressor" that far suppress other common graphic tools.

Usage:

1. Save all files in a folder.
2. Drag and drop jpeg images onto the batch (.bat) file to compress them.
3. Non-jpeg will be converted to jpeg, if and only if ffmpeg is on the PATH env var and supports the input format.

Compressed images will be saved in the same folder as the image (not the tool), without overwriting the original.