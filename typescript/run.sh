#!/usr/bin/env bash

set -e

yarn tsc --outDir build --allowJs --rootDir $1 $(find $1 -name '*.jsx')
