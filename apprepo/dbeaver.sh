#!/bin/bash
wget https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz

rm -rf *.bak
mv dbeaver dbeaver.bak

tar -xvzf dbeaver-ce-latest-linux.gtk.x86_64.tar.gz
rm dbeaver-ce-latest-linux.gtk.x86_64.tar.gz
