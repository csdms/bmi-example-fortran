program test_get_var_location

  use bmif_2_0, only: BMI_FAILURE, BMI_MAX_UNITS_NAME
  use bmiheatf
  use fixtures, only: config_file, status

  implicit none

  character (len=*), parameter :: var_name = "plate_surface__temperature"
  character (len=*), parameter :: expected_location = "face"

  type (bmi_heat) :: m
  character (len=BMI_MAX_UNITS_NAME) :: location

  status = m%initialize(config_file)
  status = m%get_var_location(var_name, location)
  status = m%finalize()

  print *, location
  print *, expected_location

  if (location /= expected_location) then
     stop BMI_FAILURE
  end if
end program test_get_var_location
