#!/usr/bin/env bash
rm -rf ../basemaps_data/*
cd ..
cd basemaps_data

git clone git@github.com:planetskht/TGP-NANDYAL.git
git clone git@github.com:planetskht/TGP-Main-Canal.git
git clone git@github.com:planetskht/TGP-Link-Canal-VBR.git
git clone git@github.com:planetskht/Srisailam-Right-Side-Main-Canal.git

git clone git@github.com:planetskht/SKFF-Canal-Basemap-from-Km-0.000-to-Km-45.125.git

git clone git@github.com:planetskht/Kandaleru-Reservoir-Basemap.git

git clone git@github.com:planetskht/HNSS-Phase-1.git

git clone git@github.com:planetskht/HNSS-Phase-2.git

git clone git@github.com:planetskht/Pulichinthala-Project.git

cd ..
cd basemaps
