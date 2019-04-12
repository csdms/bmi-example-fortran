cmake_minimum_required(VERSION 2.8)

project(bmi-example-fortran Fortran)

set(model_name heatf)
set(bmi_name bmi${model_name})

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)
set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

# Locate the installed Fortran BMI bindings (bmif library and module file)
# through CMAKE_PREFIX_PATH.
find_library(bmif_lib bmif)
find_path(bmif_inc bmif.mod)
include_directories(${bmif_inc})

add_subdirectory(heat)
add_subdirectory(bmi_heat)
