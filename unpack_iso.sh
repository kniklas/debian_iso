#!/bin/bash

# Load configuration
source iso.conf

echo "Unpacking image: $orig_iso to folder: $new_files"

# create folder where iso will be extracted
mkdir -p "$new_files"

# extract iso to folder
cat "$orig_iso" | bsdtar -C "$new_files" -xf -
# alternatively - NOTE using this will increase image size by 10-15% !!!
# xorriso -osirrox on -indev "$orig_iso" -extract / "$new_files"

# make files writible
chmod -R +w "$new_files"
