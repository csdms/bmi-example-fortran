! An example of using a BMI extension
program bmi_geospatial_ex

    use bmif_2_0
    use bmiheatf
    use bmiheatgeof
    implicit none

    type(bmi_heat) :: h
    type(bmi_heat_geo) :: g
    integer :: status, grid_id, grid_rank, i
    character (len=BMI_MAX_COMPONENT_NAME), pointer :: component_name
    integer, allocatable :: grid_shape(:)
    character (len=BMI_MAX_VAR_NAME), pointer :: names(:), units(:)
    double precision, allocatable :: xcoordinate(:), ycoordinate(:)
    character (len=BMI_MAX_VAR_NAME) :: crs

    status = h%get_component_name(component_name)
    write (*,"(a, a30)") "Component name: ", component_name

    status = h%initialize("")

    status = h%get_var_grid("plate_surface__temperature", grid_id)
    write (*,"(a, i3)") "Grid id:", grid_id

    status = h%get_grid_rank(grid_id, grid_rank)
    write (*,"(a, i3)") "Grid rank:", grid_rank

    allocate(grid_shape(grid_rank))
    status = h%get_grid_shape(grid_id, grid_shape)
    write (*,"(a, *(x, i3))") "Grid shape:", grid_shape

    g = bmi_heat_geo(h)

    allocate(names(grid_rank))
    status = g%get_grid_coordinate_names(grid_id, names)
    write (*,"(a)") "Coordinate names:"
    do i = 1, size(names)
       write (*,"(a)") "- " // trim(names(i))
    end do

    allocate(units(grid_rank))
    status = g%get_grid_coordinate_units(grid_id, units)
    write (*,"(a)") "Coordinate units:"
    do i = 1, size(units)
       write (*,"(a)") "- " // trim(units(i))
    end do

    allocate(ycoordinate(grid_shape(1)))
    status = g%get_grid_coordinate(grid_id, names(1), ycoordinate)
    write (*,"(a, *(x, f4.1))") "Y-coordinate:", ycoordinate

    allocate(xcoordinate(grid_shape(2)))
    status = g%get_grid_coordinate(grid_id, names(2), xcoordinate)
    write (*,"(a, *(x, f4.1))") "X-coordinate:", xcoordinate

    status = g%get_grid_crs(grid_id, crs)
    write (*,"(a, a30)") "CRS: ", crs

    deallocate(grid_shape, names, units, ycoordinate, xcoordinate)

    status = h%finalize()

end program bmi_geospatial_ex
