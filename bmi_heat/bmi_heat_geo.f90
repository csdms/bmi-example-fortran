! Implement the bmi_geo type and use the bmi_heat type in a new type, bmi_heat_geo

module bmiheatgeof

    use bmigeof
    use bmiheatf
    implicit none

    type, extends (bmi_geo) :: bmi_heat_geo
        private
        type (bmi_heat) :: bmi_base
    contains
        procedure :: initialize => heat_initialize
        procedure :: get_grid_coordinate_names => heat_grid_coordinate_names
        procedure :: get_grid_coordinate_units => heat_grid_coordinate_units
        procedure :: get_grid_coordinate => heat_grid_coordinate
        procedure :: get_grid_crs => heat_grid_crs
    end type bmi_heat_geo

contains

    function heat_initialize(this, config_file) result (bmi_status)
        class (bmi_heat_geo), intent(out) :: this
        character (len=*), intent(in) :: config_file
        integer :: bmi_status

        bmi_status = BMI_SUCCESS
    end function heat_initialize

    function heat_grid_coordinate_names(this, grid, names) result (bmi_status)
        class (bmi_heat_geo), intent(in) :: this
        integer, intent(in) :: grid
        character (*), pointer, intent(out) :: names(:)
        integer :: bmi_status

        bmi_status = BMI_SUCCESS
    end function heat_grid_coordinate_names

    function heat_grid_coordinate_units(this, grid, units) result (bmi_status)
        class (bmi_heat_geo), intent(in) :: this
        integer, intent(in) :: grid
        character (*), pointer, intent(out) :: units(:)
        integer :: bmi_status

        bmi_status = BMI_SUCCESS
    end function heat_grid_coordinate_units

    function heat_grid_coordinate(this, grid, coordinate, values) result (bmi_status)
        class (bmi_heat_geo), intent(in) :: this
        integer, intent(in) :: grid
        character(len=*), intent(in) :: coordinate
        double precision, dimension(:), intent(out) :: values
        integer :: bmi_status

        bmi_status = BMI_SUCCESS
    end function heat_grid_x

    function heat_grid_crs(this, grid, crs) result (bmi_status)
        class (bmi_heat_geo), intent(in) :: this
        integer, intent(in) :: grid
        character (len=*), intent(out) :: crs
        integer :: bmi_status

        bmi_status = BMI_SUCCESS
    end function heat_grid_crs

end module bmiheatgeof
