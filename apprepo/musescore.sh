#!/bin/bash
set -x

name=$(gh-get-link 'musescore/MuseScore' '-x86_64.AppImage$' -n)
url=$(gh-get-link 'musescore/MuseScore' '-x86_64.AppImage$')

rm -f *.bak
for i in MuseScore-Studio-*-x86_64.AppImage; do
    mv $i $i.bak
done

wget $url
chmod +x "$name"
ln -s -f "$name" musescore
