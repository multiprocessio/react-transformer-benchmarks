#!/usr/bin/env bash

set -e

transformers="esbuild babel typescript"
sizes="small medium"

for size in $sizes; do
    for dir in $(ls ./tests/$size); do
	for transformer in $transformers; do
	    echo "Running $transformer on $size/$dir"
	    sample="$(pwd)/tests/$size/$dir"
	    pushd ./$transformer >/dev/null 2>&1
	    rm -rf ./build
	    time ./run.sh $sample >/dev/null 2>&1
	    popd >/dev/null 2>&1
	    printf "\n\n"
	done
    done
done
