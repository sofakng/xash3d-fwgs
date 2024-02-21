#!/bin/bash

. scripts/lib.sh

build_sdl2()
{
        cd "$BUILDDIR"/SDL2_src || die
        ./configure \
                --disable-rpath \
                --enable-pulseaudio \
                --enable-pulseaudio-shared \
                --enable-video-dummy \
                --enable-video-opengl \
                --enable-video-opengles \
                --enable-video-x11 \
                --enable-video-x11-scrnsaver \
                --enable-video-x11-xcursor \
                --enable-video-x11-xinerama \
                --enable-video-x11-xinput \
                --enable-video-x11-xrandr \
                --enable-video-x11-xshape \
                --enable-x11-shared \
                --with-x # \
                # --prefix / || die # get rid of /usr/local stuff
        make -j2 || die
        mkdir -p "$BUILDDIR"/SDL2_linux
        make install # DESTDIR="$BUILDDIR"/SDL2_linux || die
        export CFLAGS=""
        export LDFLAGS=""
}

build_engine()
{
        # Build engine
        cd "$BUILDDIR" || die
	/usr/bin/python3 ./waf configure -T release
}

mkdir -p artifacts/
   
rm -rf build # clean-up build directory
# build_engine dedicated
# build_dedicated_tarball
# mv $DSTARGZ artifacts/
        
build_sdl2
build_engine full # don't rebuild some common parts twice
# build_appimage
# mv $APPIMAGE artifacts/
