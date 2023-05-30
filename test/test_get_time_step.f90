program test_get_time_step

  use bmif_2_0, only: BMI_FAILURE
  use bmiheatf
  use fixtures, only: config_file, status, tolerance

  implicit none

  double precision, parameter :: expected_time_step = 0.333333d0

  type (bmi_heat) :: m
  double precision :: time_step

  status = m%initialize(config_file)
  status = m%get_time_step(time_step)
  status = m%finalize()

  print *, time_step
  print *, expected_time_step

  if (abs(time_step - expected_time_step) > tolerance) then
     stop BMI_FAILURE
  end if
end program test_get_time_step
