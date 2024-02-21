#!/bin/bash
cd $GITHUB_WORKSPACE

wget http://libsdl.org/release/SDL2-$SDL_VERSION.zip -O SDL2.zip
unzip -q SDL2.zip
mv SDL2-$SDL_VERSION SDL2_src
