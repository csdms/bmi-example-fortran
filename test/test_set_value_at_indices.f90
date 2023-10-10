program test_set_value_at_indices

  use bmif_2_0, only: BMI_SUCCESS, BMI_FAILURE
  use bmiheatf
  use fixtures, only: status, print_array

  implicit none

  character (len=256) :: config_file
  character (len=*), parameter :: var_name = "plate_surface__temperature"
  integer, parameter :: rank = 2
  integer, parameter :: size = 50
  integer, parameter, dimension(rank) :: shape = (/ 10, 5 /)
  integer, parameter, dimension(shape(2)) :: &
       indices = (/ 2, 12, 22, 32, 42 /)
  real, parameter, dimension(shape(2)) :: &
       expected = (/ 17.0, 42.0, 88.0, 42.0, 17.0 /)
  integer :: retcode

  ! Get the path to the config file from command line params
  call get_command_argument(1, config_file)

  retcode = run_test()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if

contains

  function run_test() result(code)
    type (bmi_heat) :: m
    real :: x(size)
    integer :: i, code

    status = m%initialize(trim(config_file))
    status = m%set_value_at_indices(var_name, indices, expected)
    status = m%get_value(var_name, x)
    status = m%finalize()

    ! Visual inspection.
    do i = 1, shape(2)
       write(*,*) indices(i), x(indices(i)), expected(i)
    end do

    code = BMI_SUCCESS
    do i = 1, shape(2)
       if (x(indices(i)).ne.expected(i)) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function run_test

end program test_set_value_at_indices
