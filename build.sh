#!/bin/sh
if [ "x$1" = "x" ]; then
    echo "Usage: build.sh <version-id>"
    exit
fi
cd /home/hybrid/pypy/pypy/goal
pypy ../../rpython/bin/rpython -Ojit --lldebug targetpypystandalone --objspace-lonepycfiles
cd /home/hybrid/pypy/pypy/tool/release
pypy package.py --nostrip ../../../ pypy-$1-freebsd64
