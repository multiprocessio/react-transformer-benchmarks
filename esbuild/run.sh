#!/usr/bin/env bash

set -ex

yarn esbuild --outdir=build $(find $1 -name '*.jsx')
