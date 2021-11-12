#!/usr/bin/env bash

set -ex

yarn swc $(find $1 -name '*.jsx') -d build
