#!/usr/bin/env bash

set -e

yarn tsc --outDir build --allowJs $1/*.jsx
