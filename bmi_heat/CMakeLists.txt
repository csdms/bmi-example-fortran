# bmi-heat

# Create shared library, except on Windows.
if(WIN32)
  add_library(${bmi_name} bmi_heat.f90)
else()
  add_library(${bmi_name} SHARED bmi_heat.f90)
endif()
target_link_libraries(${bmi_name} ${model_name} ${bmif_lib})

add_executable(run_${bmi_name} bmi_main.f90)
target_link_libraries(run_${bmi_name} ${bmi_name})

install(
  TARGETS run_${bmi_name}
  RUNTIME DESTINATION bin
)
install(
  TARGETS ${bmi_name}
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
)
install(
  FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/${bmi_name}.mod
  DESTINATION include
)
