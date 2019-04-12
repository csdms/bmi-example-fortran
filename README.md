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

**Prerequisite:**
The Fortran BMI bindings must be installed before building this example.
Follow the install directions given in the
[README](https://github.com/csdms/bmi-fortran/blob/master/README.md)
in that repository.
You can choose to build them from source
or install them through a conda binary.

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

To build this example from source with cmake, run

    mkdir _build && cd _build
    cmake .. -DCMAKE_INSTALL_PREFIX=<path-to-installation>
    make

where `<path-to-installation>` is the base directory
in which the Fortran BMI bindings have been installed
(`/usr/local` is the default).

On macOS only, update runtime paths for all executables with

    $ source ../scripts/update_rpaths

Then, to install (on both Linux and macOS):

    $ make install

The installation will look like:

```bash
.
|-- bin
|   |-- run_bmiheatf
|   `-- run_heatf
|-- include
|   |-- bmif.mod
|   |-- bmiheatf.mod
|   `-- heatf.mod
`-- lib
    |-- libbmif.dylib
    |-- libbmiheatf.dylib
    `-- libheatf.dylib

3 directories, 8 files
```

Run unit tests and examples of using the sample implementation with

    $ ctest
