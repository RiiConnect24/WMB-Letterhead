echo "Wii Message Board Letterhead Generator"
echo "By Larsenv - https://rc24.xyz/"

echo "\nMaking letter...\n"

if [ ! -f "letter.png" ]
then
    echo "Error: Please make a letterhead that is 512x376 and save it in this directory as letter.png."
    exit
fi

if [ -d "letterhead.d" ]
then
    rm -rf letterhead.d
fi

mkdir -p letterhead.d/letter.d/img/

curl -o letterhead.d/wszst-setup.txt https://transfer.notkiska.pw/Z8Cbx/wszst-setup.txt
cp letterhead.d/wszst-setup.txt letterhead.d/letter.d/wszst-setup.txt

convert letter.png -crop 64x144+0+0 letterhead.d/letter.d/img/my_Letter_a.tpl.png
convert letter.png -crop 384x144+64+0 letterhead.d/letter.d/img/my_Letter_b.tpl.png
convert letter.png -crop 64x144+448+0 letterhead.d/letter.d/img/my_Letter_c.tpl.png
convert letter.png -crop 64x168+0+144 letterhead.d/letter.d/img/my_Letter_d.tpl.png
convert letter.png -crop 384x168+64+144 letterhead.d/letter.d/img/my_Letter_e.tpl.png
convert letter.png -crop 64x168+448+144 letterhead.d/letter.d/img/my_Letter_f.tpl.png
convert letter.png -crop 64x64+0+312 letterhead.d/letter.d/img/my_Letter_g.tpl.png
convert letter.png -crop 384x64+64+312 letterhead.d/letter.d/img/my_Letter_h.tpl.png
convert letter.png -crop 64x64+448+312 letterhead.d/letter.d/img/my_Letter_i.tpl.png

wimgt encode letterhead.d/letter.d/img/*.tpl.png -x TPL.CMPR

wszst create letterhead.d/letter.d/
mv letterhead.d/letter.u8 letterhead.d/letter_LZ.bin

lzss -evn letterhead.d/letter_LZ.bin

echo "\nMaking thumbnail...\n"

if [ ! -f "thumbnail.png" ]
then
    echo "Error: Please make an envelope icon that is 144x96 and save it in this directory as thumbnail.png"
    exit
fi

mkdir -p letterhead.d/thumbnail.d/img/
cp letterhead.d/wszst-setup.txt letterhead.d/thumbnail.d/wszst-setup.txt

cp thumbnail.png letterhead.d/thumbnail.d/img/my_LetterS_b.tpl.png
wimgt encode letterhead.d/thumbnail.d/img/my_LetterS_b.tpl.png -x TPL.CMPR

wszst create letterhead.d/thumbnail.d/
mv letterhead.d/thumbnail.u8 letterhead.d/thumbnail_LZ.bin

lzss -evn letterhead.d/thumbnail_LZ.bin

echo "\nPacking up...\n"

rm -rf letterhead.d/letter.d/
rm -rf letterhead.d/thumbnail.d/

wszst create letterhead.d
mv letterhead.u8 letterhead.arc
rm -rf letterhead.d

if [ ! -f "letterhead.arc" ]
then
    echo "Error: Something went wrong. I don't know what, though... Scroll above."
    exit
    fi

echo "\nDone! The letterhead is saved as letterhead.arc in this directory."