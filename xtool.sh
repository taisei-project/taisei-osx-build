#!/bin/bash

pushd "$(dirname "$0")"/ >/dev/null || exit 1
source common.sh || exit 1
popd >/dev/null

xtool "$@"
