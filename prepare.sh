#!/usr/bin/env bash

set -e

rm -rf tests

small_samples="sample1 sample2 sample3 sample4 sample5"
for sample in $small_samples; do
    mkdir -p tests/small/$sample
    node ./node_modules/react-benchmark-generator/generate.js --outdir tests/small/$sample --nfiles 5
done

medium_samples="sample1 sample2 sample3 sample4 sample5"
for sample in $medium_samples; do
    mkdir -p tests/medium/$sample
    node ./node_modules/react-benchmark-generator/generate.js --outdir tests/medium/$sample --nfiles 100
done

large_samples="sample1 sample2 sample3 sample4 sample5"
for sample in $large_samples; do
    mkdir -p tests/large/$sample
    node ./node_modules/react-benchmark-generator/generate.js --outdir tests/large/$sample --nfiles 5000
done
