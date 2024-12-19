include(CTest)

include_directories(${CMAKE_Fortran_MODULE_DIRECTORY})

add_library(helpers OBJECT testing_helpers.f90)

function(make_example example_name)
  add_test(NAME ${example_name} COMMAND ${example_name} ${CMAKE_CURRENT_SOURCE_DIR})
  add_executable(${example_name} ${example_name}.f90 $<TARGET_OBJECTS:helpers>)
  target_link_libraries(${example_name} ${bmi_name})
endfunction(make_example)

make_example(info_ex)
make_example(irf_ex)
make_example(vargrid_ex)
make_example(get_value_ex)
make_example(set_value_ex)
make_example(conflicting_instances_ex)
make_example(change_diffusivity_ex)
