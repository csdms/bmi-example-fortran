! An example of using a BMI extension
program bmi_geospatial_ex

    use bmif_2_0
    use bmiheatf
    use bmiheatgeof
    implicit none

    type(bmi_heat) :: h
    integer :: status
    character (len=BMI_MAX_COMPONENT_NAME), pointer :: name

    status = h%get_component_name(name)
    write (*,"(a, a30)") "Component name: ", name

end program bmi_geospatial_ex
