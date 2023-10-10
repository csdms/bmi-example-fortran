[![Basic Model Interface](https://img.shields.io/badge/CSDMS-Basic%20Model%20Interface-green.svg)](https://bmi.readthedocs.io/)
[![Build/Test](https://github.com/csdms/bmi-example-fortran/workflows/Build/Test/badge.svg)](https://github.com/csdms/bmi-example-fortran/actions?query=workflow%3ABuild%2FTest)

# bmi-example-fortran

An example of implementing the
[Fortran bindings](https://github.com/csdms/bmi-fortran)
for the CSDMS
[Basic Model Interface](https://bmi-spec.readthedocs.io) (BMI).


## Overview

This is an example of implementing a BMI
for a simple model that  solves the diffusion equation
on a uniform rectangular plate
with Dirichlet boundary conditions.
Tests and examples of using the BMI are provided.
The model is written in Fortran 90.
The BMI is written in Fortran 2003.

This repository is organized with the following directories:

<dl>
    <dt>heat</dt>
	<dd>Holds the model and a sample main program</dd>
    <dt>bmi_heat</dt>
	<dd>Holds the BMI for the model and a main program to run the
    model through its BMI</dd>
	<dt>test</dt>
	<dd>Unit tests for the BMI-ed model</dd>
    <dt>example</dt>
	<dd>Examples of controlling the model through its BMI</dd>
    <dt>scripts</dt>
	<dd>Helper scripts</dd>
</dl>

## Build/Install

This example can be built on Linux, macOS, and Windows.

**Prerequisites:**
* A Fortran compiler
* CMake or [Fortran Package Manager](https://fpm.fortran-lang.org/)
* If using CMake, the Fortran BMI bindings. Follow the build and
  install directions given in the
  [README](https://github.com/csdms/bmi-fortran/blob/master/README.md)
  in that repository.  You can choose to build them from source or
  install them through a conda binary. If using fpm, the binding
  will be automatically downloaded and built for you.

### CMake - Linux and macOS

To build this example from source with CMake,
using the current Fortran BMI version, run

    export BMIF_VERSION=2.0
    mkdir _build && cd _build
    cmake .. -DCMAKE_INSTALL_PREFIX=<path-to-installation>
    make

where `<path-to-installation>` is the base directory
in which the Fortran BMI bindings have been installed
(`/usr/local` is the default).
When installing into a conda environment,
use the `$CONDA_PREFIX` environment variable.

Then, to install (on both Linux and macOS):

    make install

The installation will look like
(on macOS, using v2.0 of the Fortran BMI specification):

```bash
.
|-- bin
|   |-- run_bmiheatf
|   `-- run_heatf
|-- include
|   |-- bmif_2_0.mod
|   |-- bmiheatf.mod
|   `-- heatf.mod
`-- lib
    |-- libbmif.2.0.dylib
    |-- libbmif.dylib -> libbmif.2.0.dylib
    |-- libbmiheatf.dylib
    `-- libheatf.dylib

3 directories, 9 files
```

From the build directory,
run unit tests and examples of using the sample implementation with

    ctest

### CMake - Windows

An additional prerequisite is needed for Windows:

* Microsoft Visual Studio 2017 or Microsoft Build Tools for Visual Studio 2017

To configure this example from source with cmake
using the current Fortran BMI version,
run the following in a [Developer Command Prompt](https://docs.microsoft.com/en-us/dotnet/framework/tools/developer-command-prompt-for-vs)

    set "BMIF_VERSION=2.0"
    mkdir _build && cd _build
    cmake .. ^
	  -G "NMake Makefiles" ^
	  -DCMAKE_INSTALL_PREFIX=<path-to-installation> ^
	  -DCMAKE_BUILD_TYPE=Release

where `<path-to-installation>` is the base directory
in which the Fortran BMI bindings have been installed
(`"C:\Program Files (x86)"` is the default;
note that quotes and an absolute path are needed).
When installing into a conda environment,
use the `%CONDA_PREFIX%` environment variable.

Then, to build and install:

	cmake --build . --target install --config Release

From the build directory,
run unit tests and examples of using the sample implementation with

    ctest


### Fortran Package Manager (fpm)

If you don't already have fpm installed, you can do so via Conda:

    conda install fpm -c conda-forge

Then, to build and install:

    fpm build --profile release
    fpm install --prefix <path-to-installation>

where `<path-to-installation>` is the base directory in which to
install the model. Installation is optional.

To run the tests:

    fpm test -- test/sample.cfg

Here, `test/sample.cfg` is passed as a command line parameter to the
run executables, and tells the tests where to find the test config
file.

To run all of the examples:

    fpm run --example --all -- example

Similarly, `example` tells the example executables to look in the
`example` directory for config files. To run individual tests:

    fpm run --example <example-name> -- example

Where `<example-name>` is the name of the example to run. To see
a list of available examples, run `fpm run --example`. Note that the
non-BMI heat model executable is not built by default when using fpm.
If you want to build and install this too, you can do so from the
heat directory:

    cd heat
    fpm build --profile release
    fpm install --prefix <path-to-installation>


## Use

Run the heat model through its BMI with the `run_bmiheatf` program,
which takes a model configuration file
(see the [example](./example) directory for a sample)
as a required parameter.
If `run_bmiheatf` is in your path, run it with

    run_bmiheatf test1.cfg

Output from the model is written to the file **bmiheatf.out**
in the current directory.

If you built the model using fpm, you can alternatively run the
program using

    fpm run -- test.cfg