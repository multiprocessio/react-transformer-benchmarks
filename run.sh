#!/usr/bin/env bash

set -e

transformers="esbuild babel typescript"

for dir in $(ls ./tests); do
    for transformer in $transformers; do
	echo "Running $transformer on $dir"
	time ./$transformer/run.sh ./tests/$dir &2>1
    done
done
