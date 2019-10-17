program test_get_input_item_count

  use bmif_2_0, only: BMI_FAILURE
  use bmiheatf
  use fixtures, only: config_file, status

  implicit none

  integer, parameter :: expected_count = 3

  type (bmi_heat) :: m
  integer :: count

  status = m%initialize(config_file)
  status = m%get_input_item_count(count)
  status = m%finalize()

  if (count /= expected_count) then
     stop BMI_FAILURE
  end if
end program test_get_input_item_count
