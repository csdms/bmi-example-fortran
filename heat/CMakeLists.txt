# heat

# Create shared library, except on Windows.
if(WIN32)
  add_library(${model_name} heat.f90)
else()
  add_library(${model_name} SHARED heat.f90)
endif()

add_executable(run_${model_name} main.f90)
target_link_libraries(run_${model_name} ${model_name})

install(
  TARGETS run_${model_name}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(
  TARGETS ${model_name}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install(
  FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/${model_name}.mod
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)
