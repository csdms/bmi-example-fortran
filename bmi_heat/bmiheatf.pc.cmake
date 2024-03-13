prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: @bmi_name@
Description: BMI for the heatf model
Version: @CMAKE_PROJECT_VERSION@
Requires: @model_name@, @BMIF_LIBRARIES@
Libs: -L${libdir} -l@bmi_name@
Cflags: -I${includedir}
