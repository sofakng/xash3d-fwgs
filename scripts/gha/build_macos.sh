#!/bin/bash

. scripts/lib.sh

# APP=xash3d-fwgs

cd "$BUILDDIR" || die
/usr/bin/python3 ./waf configure -T release
