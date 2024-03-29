#!/bin/bash
set -x

name=$(gh-get-link 'johnkerl/miller' '\\.[0-9]+\\-linux-amd64.tar.gz' -n)
url=$(gh-get-link 'johnkerl/miller' '\\.[0-9]+\\-linux-amd64.tar.gz')

rm -f *.bak
for i in miller-*-linux-amd64; do
    mv $i $i.bak
done

wget $url
tar -xvzf "$name"
rm "$name"
folder_name="${name:0:-7}"
chmod +x $folder_name/mlr
ln -s -f $folder_name/mlr mlr
