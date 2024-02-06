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
    character (len=BMI_MAX_VAR_NAME), pointer :: names(:), units(:)
    character (len=BMI_MAX_VAR_NAME) :: crs

    status = h%get_component_name(component_name)
    write (*,"(a, a30)") "Component name: ", component_name

    status = h%initialize("")

    status = h%get_var_grid("plate_surface__temperature", grid_id)
    write (*,"(a, i3)") "Grid id:", grid_id

    status = h%get_grid_rank(grid_id, grid_rank)
    write (*,"(a, i3)") "Grid rank:", grid_rank

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

    status = g%get_grid_crs(grid_id, crs)
    write (*,"(a, a30)") "CRS: ", crs

    status = h%finalize()

end program bmi_geospatial_ex
