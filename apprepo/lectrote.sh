#!/bin/bash
set -x

name=$(gh-get-link 'erkyrath/lectrote' 'linux-x64.zip' -n)
name="${name%.zip}"
url=$(gh-get-link 'erkyrath/lectrote' 'linux-x64.zip')

rm -f ${name}.bak
for i in Lectrote-*-linux-x64; do
    mv $i ${i}.bak
done

wget $url
unzip ${name}.zip
rm ${name}.zip
mv Lectrote-linux-x64 ${name}
ln -s -f ${name}/Lectrote lectrote
