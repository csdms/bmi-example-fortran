add_library(${model_name} SHARED heat.f90)

add_executable(run_${model_name} main.f90)
target_link_libraries(run_${model_name} ${model_name})

install(
  PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/run_${model_name}
  DESTINATION bin)
install(
  TARGETS ${model_name}
  DESTINATION lib)
install(
  FILES ${CMAKE_Fortran_MODULE_DIRECTORY}/${model_name}.mod
  DESTINATION include)
