# bmi-heat

# Create shared library, except on Windows.
if(WIN32)
  add_library(${bmi_name} bmi_heat.f90)
  add_library(${extension_name} bmi_geo_heat.f90)
else()
  add_library(${bmi_name} SHARED bmi_heat.f90)
  add_library(${extension_name} SHARED bmi_geo_heat.f90)
endif()
target_link_libraries(${bmi_name} ${model_name} ${bmif_lib})
target_link_libraries(${extension_name} ${bmi_name} ${bmigeof_lib})

add_executable(run_${bmi_name} bmi_main.f90)
target_link_libraries(run_${bmi_name} ${bmi_name})

install(
  TARGETS run_${bmi_name}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(
  TARGETS ${bmi_name} ${extension_name}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(
  FILES
    ${CMAKE_Fortran_MODULE_DIRECTORY}/${bmi_name}.mod
    ${CMAKE_Fortran_MODULE_DIRECTORY}/${extension_name}.mod
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)
