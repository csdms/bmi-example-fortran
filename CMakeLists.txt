# bmi-example-fortran

cmake_minimum_required(VERSION 3.12)

project(bmi-example-fortran
  VERSION 2.1.2
  LANGUAGES Fortran
)

include(GNUInstallDirs)

set(model_name heatf)
set(bmi_name bmi${model_name})

find_package(PkgConfig REQUIRED)
pkg_check_modules(BMIF REQUIRED IMPORTED_TARGET bmif)
string(REPLACE "." "_" bmif_module_version ${BMIF_VERSION})
message("--   bmif module version - ${bmif_module_version}")
message("--   bmif library path - ${BMIF_LINK_LIBRARIES}")
message("--   bmif include dir - ${BMIF_INCLUDE_DIRS}")
include_directories(${BMIF_INCLUDE_DIRS})

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

add_subdirectory(heat)
add_subdirectory(bmi_heat)
add_subdirectory(test)
add_subdirectory(example)

include(CTest)
