#!/bin/bash

cd "$(dirname "$0")" || exit 1
pushd ../.. >/dev/null || exit 1
source common.sh || exit 1
popd >/dev/null || exit 1

if [[ "$1" = "-c" ]]; then
    rm -rfv build
fi

PKG=$(get-pkg https://download.sourceforge.net/libpng/ libpng-1.6.34 tar.xz)

set-cross-env

mkdir -p build && \
cd build && \
../$PKG/configure "${CONFIGURE_COMMON[@]}" \
    --enable-hardware-optimizations \
&& $MAKE install
