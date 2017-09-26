#!/bin/bash

cd "$(dirname "$0")" || exit 1
pushd ../.. >/dev/null || exit 1
source common.sh || exit 1
popd >/dev/null || exit 1

if [[ "$1" = "-c" ]]; then
    rm -rfv *.tar.* build
fi

PKG=$(get-pkg https://nih.at/libzip/libzip/ libzip-1.3.0 tar.xz)

mkdir -p build && \
cd build && \
../$PKG/configure \
    --host="$HOST" \
    --prefix="$ROOT/local" \
    --disable-shared \
    --enable-static \
    --disable-silent-rules \
&& $MAKE install