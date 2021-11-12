#!/usr/bin/env bash

set -e

transformers="esbuild babel typescript swc"
sizes="small medium"
times="1 2 3 4 5"

echo "name,size,sample,time"

for size in $sizes; do
    for dir in $(ls ./tests/$size); do
	for transformer in $transformers; do
	    for time in $times; do
		sample="$(pwd)/tests/$size/$dir"
		# swc blows up with absolute input paths
		if [[ "$transformer" == "swc" ]]; then
		    sample="../tests/$size/$dir"
		fi
		pushd ./$transformer >/dev/null 2>&1
		rm -rf ./build
		res="$( TIMEFORMAT=%R; time ( ./run.sh $sample >/dev/null 2>&1 ) 2>&1 1>/dev/null )"
		echo "$transformer,$size,$dir,$res"
		popd >/dev/null 2>&1
	    done
	done
    done
done
