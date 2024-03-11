# bmi-heat

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/${bmi_name}.pc.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/${bmi_name}.pc
  @ONLY
)

# Create shared library, except on Windows.
if(WIN32)
  add_library(${bmi_name} bmi_heat.f90)
else()
  add_library(${bmi_name} SHARED bmi_heat.f90)
endif()
target_link_libraries(${bmi_name} ${model_name} ${BMIF_LINK_LIBRARIES})

add_executable(run_${bmi_name} bmi_main.f90)
target_link_libraries(run_${bmi_name} ${bmi_name})

install(
  TARGETS run_${bmi_name}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(
  TARGETS ${bmi_name}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(
  FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/${bmi_name}.mod
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/${bmi_name}.pc
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)
