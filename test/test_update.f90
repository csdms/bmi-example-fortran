program test_update

  use bmif_2_0, only: BMI_FAILURE
  use bmiheatf
  use fixtures, only: config_file, status, tolerance

  implicit none

  double precision, parameter :: expected_time = 0.333333d0

  type (bmi_heat) :: m
  double precision :: time

  status = m%initialize(config_file)
  status = m%update()
  status = m%get_current_time(time)
  status = m%finalize()

  print *, time
  print *, expected_time

  if (abs(time - expected_time) > tolerance) then
     stop BMI_FAILURE
  end if
end program test_update
