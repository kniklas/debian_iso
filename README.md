# Debian ISO

Set of scripts allow to unpack bootable Debian ISO and package it again.


# Installation and dependencies

You only need to copy contents of this repository to your computer and then make sure you have *xorriso* and *bsdtar* packages installed. Best if you run below command to install required packages:
```
$ sudo apt-get install xorriso bsdtar
```


# Usage

First you need to make sure your configuration file: `iso.conf` has correct values for:
* *$orig_iso* - original ISO image file name
* *$new_iso* - new ISO image file name
* *$new_files* - folder name to extract original ISO files.

Then you extract original iso image using command: `./unpack_iso.sh` 

After extraction you can customise content of your ISO image, e.g. add preseed file, modify packages, etc.

When customisation is done, you have to run command to package this folder to bootable ISO: `./pack_iso.sh`


# References

This tool has been created on base of below links, they may be useful if you need more details:
* [ManipulatingISOs](https://wiki.debian.org/ManipulatingISOs#Extracting_All_Files_from_an_ISO) - how to extract files from ISO using `bsdtar` command
* [RepackBootableISO](https://wiki.debian.org/RepackBootableISO) - how to create bootable ISO using `xorriso` command
