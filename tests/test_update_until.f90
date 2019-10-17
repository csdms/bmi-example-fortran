program test_update_until

  use bmif_2_0, only: BMI_FAILURE, BMI_SUCCESS
  use bmiheatf
  use fixtures, only: config_file, status

  implicit none

  type (bmi_heat) :: m
  integer :: retcode

  retcode = test_more_than_dt()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if

  retcode = test_less_than_dt()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if

  retcode = test_multiple_of_dt()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if

contains

  function test_more_than_dt() result(code)
    double precision, parameter :: expected_time = 10.5d0
    double precision :: time
    integer :: code

    status = m%initialize(config_file)
    status = m%update_until(expected_time)
    status = m%get_current_time(time)
    status = m%finalize()

    write(*,*) "Test time more than dt"
    print *, time
    print *, expected_time

    code = BMI_SUCCESS
    if (time.ne.expected_time) then
       code = BMI_FAILURE
    end if
  end function test_more_than_dt

  function test_less_than_dt() result(code)
    double precision, parameter :: expected_time = 0.5d0
    double precision :: time
    integer :: code

    status = m%initialize(config_file)
    status = m%update_until(expected_time)
    status = m%get_current_time(time)
    status = m%finalize()

    write(*,*) "Test time less than dt"
    print *, time
    print *, expected_time

    code = BMI_SUCCESS
    if (time.ne.expected_time) then
       code = BMI_FAILURE
    end if
  end function test_less_than_dt

  function test_multiple_of_dt() result(code)
    double precision, parameter :: expected_time = 3.0d0
    double precision :: time
    integer :: code

    status = m%initialize(config_file)
    status = m%update_until(expected_time)
    status = m%get_current_time(time)
    status = m%finalize()

    write(*,*) "Test time multiple of dt"
    print *, time
    print *, expected_time

    code = BMI_SUCCESS
    if (time.ne.expected_time) then
       code = BMI_FAILURE
    end if
  end function test_multiple_of_dt

end program test_update_until
