! See the effect of changing diffusivity on plate temperature.
program change_diffusivity

  use bmiheatf
  use testing_helpers, only: print_array
  implicit none

  character (len=256) :: config_file
  character (len=*), parameter :: &
       dname = "plate_surface__thermal_diffusivity"
  character (len=*), parameter :: &
       tname = "plate_surface__temperature"
  double precision, parameter :: end_time = 20.d0

  type (bmi_heat) :: m
  integer :: tgrid_id
  integer, dimension(2) :: tdims
  real :: diffusivity(1), temperature(50)  
  integer :: status

  ! Get the config file directory and create the path based on this
  call get_command_argument(1, config_file)
  config_file = trim(config_file) // "/test1.cfg"
  
  ! Run model to the end with alpha=1.0 (from cfg file).
  status = m%initialize(config_file)
  status = m%get_var_grid(tname, tgrid_id)
  status = m%get_grid_shape(tgrid_id, tdims)
  status = m%get_value(dname, diffusivity)
  status = m%update_until(end_time)
  status = m%get_value(tname, temperature)
  status = m%finalize()

  write(*,"(a)") "Run 1"
  write(*,"(a, f5.2)") "alpha =", diffusivity
  call print_array(temperature, tdims)
  
  ! Run model to the end with alpha=0.75.
  status = m%initialize(config_file)
  diffusivity = 0.25
  status = m%set_value(dname, diffusivity)
  status = m%update_until(end_time)
  status = m%get_value(tname, temperature)
  status = m%finalize()

  write(*,"(a)") "Run 2"
  write(*,"(a, f5.2)") "alpha =", diffusivity
  call print_array(temperature, tdims)
end program change_diffusivity
