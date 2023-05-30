program test_get_grid_face_count

  use bmif_2_0, only: BMI_FAILURE
  use bmiheatf
  use fixtures, only: config_file, status

  implicit none

  integer, parameter :: grid_id = 0
  integer, parameter :: expected_count = -1

  type (bmi_heat) :: m
  integer :: count, fail_status

  status = m%initialize(config_file)
  fail_status = m%get_grid_face_count(grid_id, count)
  status = m%finalize()

  print *, count
  print *, expected_count

  if (count /= expected_count) then
     stop BMI_FAILURE
  end if

  if (fail_status /= BMI_FAILURE) then
     stop BMI_FAILURE
  end if
end program test_get_grid_face_count
