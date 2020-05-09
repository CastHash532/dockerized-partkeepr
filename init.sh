#!/bin/sh

sudo wget https://downloads.partkeepr.org/partkeepr-1.4.0.zip && \
sudo unzip -qq partkeepr-1.4.0.zip -d ./ && \
sudo rm -f partkeepr-1.4.0.zip && \
sudo mv ./partkeepr-1.4.0 ./PartKeepr
