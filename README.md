# rust_nemu
this is a [nju-ics-nemu](https://nju-projectn.github.io/ics-pa-gitbook/ics2021/) implementation using rust

## features
+ this `rust_nemu` only implemented `rv32im` isa, but with little modification can be adjusted to `rv64im`

+ memory mappings are not supported yet, but probably in the future.

+ instruction tracing is implemented originally in `cpu.rs`,

+ function tracing is implemented but malfunctioning to a few test files

## tests
using the [ics2021-am-kernels tests](https://github.com/NJU-ProjectN/am-kernels/tree/master/tests/cpu-tests) to check if the implementation is correct or not.

if intended to compile the test files,
```
cd test_files
make all
```
will generate all the tests files binaries that can be loaded in `src/main.rs`

and if only want to generate binary file on specific target, use
```
make build TARGET=${your_target}
# e.g.
make build TARGET=goldbatch
```