# React Transformer Benchmarks

This is a set of scripts that generates large fake React projects
using
[react-benchmark-generator](https://github.com/multiprocessio/react-benchmark-generator)
and runs transformers against these projects.

## Setup

Once you have this repo, run:

```bash
$ yarn
$ ./prepare.sh
```

prepare.sh will create 5 sample projects in a `tests` directory in 3
sizes: small, medium and large. They are basic projects that just
render JSX with builtin and custom components.

This script will take a while!

## Run

Once you have generated all tests you can run all benchmarks:

```bash
$ ./run.sh
```

This will dump a CSV to output.

## Analysis

If you redirect the run script output to a file you can easily analyze
it with SQLite.

```bash
$ ./run.sh | tee results.csv
$ sqlite3
sqlite> .mode csv
sqlite> .import results.csv results
sqlite> ^D
```

Then you can run queries:

```csv
$ sqlite3 bench.db 'SELECT name, size, AVG(time) FROM results GROUP BY name, size ORDER BY size DESC, AVG(time) ASC'
esbuild,small,0.33284
swc,small,0.38476
babel,small,1.44288
typescript,small,2.32456
esbuild,medium,0.80556
swc,medium,0.97588
typescript,medium,8.2286
babel,medium,12.8434
esbuild,large,3.06556
swc,large,3.8216
typescript,large,37.28584
babel,large,70.57572
```

## Debugging

Output for all runs is redirected to `./runlog` in the root of this
repo. You can `tail -f ./runlog` to follow all tests as they are run
and see error output if something fails.