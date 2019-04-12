add_library(${bmi_name} SHARED bmi_heat.f90)
target_link_libraries(${bmi_name} ${model_name} ${bmif_lib})

add_executable(run_${bmi_name} bmi_main.f90)
target_link_libraries(run_${bmi_name} ${bmi_name})

install(
  PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/run_${bmi_name}
  DESTINATION bin)
install(
  TARGETS ${bmi_name}
  DESTINATION lib)
install(
  FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/${bmi_name}.mod
  DESTINATION include)
