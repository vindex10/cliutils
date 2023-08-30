#!/bin/bash
set -x

name=$(gh-get-link 'ZaneH/piano-trainer' 'amd64\\.AppImage$' -n)
url=$(gh-get-link 'ZaneH/piano-trainer' 'amd64\\.AppImage$')

rm -f *.bak
for i in *.AppImage; do
    mv $i $i.bak
done

wget $url
chmod +x $name
ln -s -f $name piano-trainer
