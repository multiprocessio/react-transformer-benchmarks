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
$ ./run.sh > results.csv
$ echo results.csv | sqlite3 bench.db ".import --csv /dev/stdin results"
```

Then you can run queries:

```bash
$ sqlite3 bench.db 'SELECT name, size, AVG(time) FROM results GROUP BY name, size ORDER BY (AVG time) DESC'
```