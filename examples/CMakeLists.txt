include(CTest)

include_directories(${CMAKE_Fortran_MODULE_DIRECTORY})

function(make_example example_name)
  add_test(NAME ${example_name} COMMAND ${example_name})
  add_executable(${example_name} ${example_name}.f90 testing_helpers.f90)
  target_link_libraries(${example_name} ${bmi_name})
endfunction(make_example)

make_example(info_ex)
make_example(irf_ex)
make_example(vargrid_ex)
make_example(get_value_ex)
make_example(set_value_ex)
make_example(conflicting_instances_ex)
make_example(change_diffusivity_ex)

file(
  COPY ${CMAKE_CURRENT_SOURCE_DIR}/test1.cfg
  DESTINATION ${CMAKE_BINARY_DIR}/examples)
file(
  COPY ${CMAKE_CURRENT_SOURCE_DIR}/test2.cfg
  DESTINATION ${CMAKE_BINARY_DIR}/examples)
