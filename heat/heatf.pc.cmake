prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: @model_name@
Description: The two-dimensional heat equation in Fortran
Version: @CMAKE_PROJECT_VERSION@
Libs: -L${libdir} -l@model_name@
Cflags: -I${includedir}
