program test_initialize

  use bmif_2_0, only: BMI_SUCCESS
  use bmiheatf
  use fixtures, only: status

  implicit none

  character (len=*), parameter :: config_file1 = ""
  character (len=256) :: config_file2

  type (bmi_heat) :: m
  integer :: status1, status2

  ! Get the path to the config file from command line params
  call get_command_argument(1, config_file2)

  status1 = m%initialize(config_file1)
  status = m%finalize()
  if (status1.ne.BMI_SUCCESS) then
     stop 1
  end if

  status2 = m%initialize(trim(config_file2))
  status = m%finalize()
  if (status2.ne.BMI_SUCCESS) then
     stop 2
  end if
end program test_initialize
