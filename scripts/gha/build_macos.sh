#!/bin/bash

. scripts/lib.sh

# APP=xash3d-fwgs

cd "$BUILDDIR" || die
./waf configure -T release
