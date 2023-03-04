#!/bin/bash
rm -rf zoom.bak
mv zoom zoom.bak
wget https://zoom.us/client/latest/zoom_x86_64.tar.xz
tar -xvf zoom_x86_64.tar.xz
rm zoom_x86_64.tar.xz
