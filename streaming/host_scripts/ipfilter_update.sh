#!/bin/bash
wget https://github.com/DavidMoore/ipfilter/releases/download/lists/ipfilter.dat -O /media/streaming-data/downloads/ipfilter.dat
docker container restart qbittorrent
