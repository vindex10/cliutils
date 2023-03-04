#!/bin/bash
set -x

name=$(gh-get-link 'Mastermindzh/tidal-hifi' '\\.[0-9]+\\.appimage' -n)
url=$(gh-get-link 'Mastermindzh/tidal-hifi' '\\.[0-9]+\\.appimage')

rm -f *.bak
for i in *.AppImage; do
    mv $i $i.bak
done

wget $url
chmod +x $name
ln -s -f $name tidal
