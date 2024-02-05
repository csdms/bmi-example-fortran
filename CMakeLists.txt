# bmi-example-fortran

cmake_minimum_required(VERSION 3.12)

project(bmi-example-fortran
  VERSION 2.1.2
  LANGUAGES Fortran
)

include(GNUInstallDirs)

set(model_name heatf)
set(bmi_name bmi${model_name})
set(extension_name bmiheatgeof)

# Determine the Fortran BMI version.
if(DEFINED ENV{BMIF_VERSION})
  set(bmif_version $ENV{BMIF_VERSION})
else()
  set(bmif_version "2.0")
endif()
string(REPLACE "." "_" bmif_module_version ${bmif_version})
message("-- BMIF version - ${bmif_version}")
message("-- BMIF module version - ${bmif_module_version}")

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

# Locate the installed Fortran BMI bindings (bmif library and module file)
# as well as bmi_geospatial extension through CMAKE_PREFIX_PATH.
find_library(bmif_lib bmif)
find_library(bmigeof_lib bmigeof)
find_path(bmif_inc bmif_${bmif_module_version}.mod)
include_directories(${bmif_inc})
message("-- bmif_lib - ${bmif_lib}")
message("-- bmif_inc - ${bmif_inc}")
message("-- bmigeof_lib - ${bmigeof_lib}")

add_subdirectory(heat)
add_subdirectory(bmi_heat)
add_subdirectory(test)
add_subdirectory(example)

include(CTest)
