#!/bin/bash

wget -P ~/m -O tor.tar.xz https://www.torproject.org/dist/torbrowser/13.0.10/tor-browser-linux-x86_64-13.0.10.tar.xz

tar -xJf tor.tar.xz -C ~/m

rm tor.tar.xz