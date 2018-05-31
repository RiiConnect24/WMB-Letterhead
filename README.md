# WMB-Letterhead

You know those special, colorful templates you sometimes are able to get on the Wii Message Board? This repository has all of them we know of.

## Opening them

To extract the .arc files, we recommend you use [Wiimms SZS Tools](http://szs.wiimm.de/).

`wszst x <path to ARC>`

You will find at most, 4 files inside there.

* letter_LZ.bin
* thumbnail_LZ.bin
* chjump.bin
* sound.bns

The former two files are LZ10 compressed. Use [DSDecmp](https://github.com/RiiConnect24/File-Maker/tree/master/Tools/DSDecmp) to decompress them. The result of both of them is an .arc file. Use Wiimms SZS Tools to open that.

After you open the .arc file, you can use wimgt in Wiimms SZS Tools to convert the TPLs into PNGs.

`wimgt d <TPL file>`

chjump.bin is a file that will on a press of a button, launch a specified Channel. The kaitai for this is [here](https://github.com/RiiConnect24/Kaitai-Files/blob/master/Kaitais/chjump.ksy).

sound.bns is a sound file that plays when you open a letter. Use [Sharpii](https://github.com/mogzol/sharpii/releases) for converting it into a WAV.

`Sharpii BNS -from <BNS file> <output WAV file>`
