[![Basic Model Interface](https://img.shields.io/badge/CSDMS-Basic%20Model%20Interface-green.svg)](https://bmi.readthedocs.io/)
[![Build Status](https://travis-ci.org/csdms/bmi-example-fortran.svg?branch=master)](https://travis-ci.org/csdms/bmi-example-fortran)

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
	<dt>tests</dt>
	<dd>Unit tests for the BMI-ed model</dd>
    <dt>examples</dt>
	<dd>Examples of controlling the model through its BMI</dd>
    <dt>scripts</dt>
	<dd>Helper scripts</dd>
</dl>

## Build/Install

This example can be built on Linux, macOS, and Windows.

**Prerequisites:**
* A Fortran compiler
* CMake
* The Fortran BMI bindings. Follow the build and install directions
  given in the
  [README](https://github.com/csdms/bmi-fortran/blob/master/README.md)
  in that repository.  You can choose to build them from source or
  install them through a conda binary.

### Linux and macOS

To build this example from source with cmake,
using the current Fortran BMI version, run

    export BMIF_VERSION=2.0
    mkdir _build && cd _build
    cmake .. -DCMAKE_INSTALL_PREFIX=<path-to-installation>
    make

where `<path-to-installation>` is the base directory
in which the Fortran BMI bindings have been installed
(`/usr/local` is the default).

On macOS only, update runtime paths for all executables with

    source ../scripts/update_rpaths

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

### Windows

An additional prerequisite is needed for Windows:

* Microsoft Visual Studio 2017 or Microsoft Build Tools for Visual Studio 2017

To configure this example from source with cmake
using the current Fortran BMI version,
run the following in a Developer Command Prompt

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

Then, to build and install:

	cmake --build . --target install --config Release

From the build directory,
run unit tests and examples of using the sample implementation with

    ctest


## Use

Run the heat model through its BMI with the `run_bmiheatf` program,
which takes a model configuration file
(see the [examples](./examples) directory for a sample)
as a required parameter.
If `run_bmiheatf` is in your path, run it with

    run_bmiheatf test.cfg

Output from the model is written to the file **bmiheatf.out**
in the current directory.
