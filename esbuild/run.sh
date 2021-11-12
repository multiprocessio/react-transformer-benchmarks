#!/usr/bin/env bash

set -e

yarn esbuild --outdir=build $1/*.jsx
