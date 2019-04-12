#!/usr/bin/env bash
# Updates runtime paths for executables on macOS.

run_install_name_tool() {
    install_name_tool \
	-change @rpath/libbmif.dylib \
	    ${CONDA_PREFIX}/lib/libbmif.dylib \
	-change @rpath/libgfortran.3.dylib \
	    ${CONDA_PREFIX}/lib/libgfortran.3.dylib \
	-change @rpath/libquadmath.0.dylib \
	    ${CONDA_PREFIX}/lib/libquadmath.0.dylib \
	$1
    echo "- updated $1"
}

if [[ -z "$CONDA_PREFIX" ]]; then
    CONDA_PREFIX=`python -c "import sys; print(sys.prefix)"`
fi

tests=`ls -1 ./tests/ | egrep "test_"`
for exe in $tests; do
    run_install_name_tool ./tests/$exe
done

examples=`ls -1 ./examples/ | egrep "_ex"`
for exe in $examples; do
    run_install_name_tool ./examples/$exe
done

run_install_name_tool ./heat/run_heatf
run_install_name_tool ./bmi_heat/run_bmiheatf
