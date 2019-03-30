#!/bin/bash

source iso.conf

# make all files read only - commented, because using this increases size of image by 10-15%
# chmod -R -w "$new_files"

echo "Extracting MBR template from $orig_iso into $mbr_template"
dd if="$orig_iso" bs=1 count=432 of="$mbr_template"

echo "Packaging folder: $new_files into new ISO image: $new_iso"
xorriso -as mkisofs \
       	-r -V 'Debian 9.8.0 amd64 n'  \
	-o "$new_iso" \
	-J -J -joliet-long -cache-inodes \
	-isohybrid-mbr "$mbr_template" \
	-b isolinux/isolinux.bin \
	-c isolinux/boot.cat \
	-boot-load-size 4 -boot-info-table -no-emul-boot \
	-eltorito-alt-boot \
	-e boot/grub/efi.img \
	-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
	"$new_files"

# Remove MBR template file
rm "$mbr_template"
