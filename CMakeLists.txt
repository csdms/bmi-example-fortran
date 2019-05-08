cmake_minimum_required(VERSION 3.0)

project(bmi-example-fortran Fortran)

set(model_name heatf)
set(bmi_name bmi${model_name})
set(bmi_major_version 1)
set(bmi_minor_version 2)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

# Locate the installed Fortran BMI bindings (bmif library and module file)
# through CMAKE_PREFIX_PATH.
find_library(bmif_lib bmif)
find_path(bmif_inc bmif_${bmi_major_version}_${bmi_minor_version}.mod)
include_directories(${bmif_inc})

add_subdirectory(heat)
add_subdirectory(bmi_heat)
add_subdirectory(tests)
add_subdirectory(examples)

include(CTest)
