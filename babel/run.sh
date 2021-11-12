#!/usr/bin/env bash

set -e

yarn babel $1 --out-dir build
