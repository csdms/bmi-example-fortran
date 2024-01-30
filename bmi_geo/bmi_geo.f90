! BMI extension for geospatial data

module bmi_geo

    implicit none

    type, abstract :: bmi_geo
      contains

        procedure(bmi_geo_initialize), deferred :: geo_initialize
        procedure(bmi_geo_get_grid_coordinate_names), deferred :: get_grid_coordinate_names
        procedure(bmi_geo_get_grid_coordinate_units), deferred :: get_grid_coordinate_units
        procedure(bmi_geo_get_grid_coordinate), deferred :: get_grid_coordinate
        procedure(bmi_geo_get_grid_crs), deferred :: get_grid_crs

    end type bmi_geo

    abstract interface

        function bmi_geo_initialize(this, config_file) result(bmi_status)
            import :: bmi_geo
            class(bmi_geo), intent(out) :: this
            character(len=*), intent(in) :: config_file
            integer :: bmi_status
        end function bmi_geo_initialize

        function bmi_geo_get_grid_coordinate_names(this, names) result(bmi_status)
            import :: bmi_geo
            class(bmi_geo), intent(in) :: this
            character(len=*), pointer, intent(out) :: names(:)
            integer :: bmi_status
        end function bmi_geo_get_grid_coordinate_names

        function bmi_geo_get_grid_coordinate_units(this, units) result(bmi_status)
            import :: bmi_geo
            class(bmi_geo), intent(in) :: this
            character(len=*), pointer, intent(out) :: units(:)
            integer :: bmi_status
        end function bmi_geo_get_grid_coordinate_units

        function bmi_geo_get_grid_coordinate(this, grid, coordinate, values) result(bmi_status)
            import :: bmi_geo
            class(bmi_geo), intent(in) :: this
            integer, intent(in) :: grid
            character(len=*), intent(in) :: coordinate
            double precision, dimension(:), intent(out) :: values
            integer :: bmi_status
        end function bmi_geo_get_grid_coordinate

        function bmi_geo_get_grid_crs(this, grid, crs) result(bmi_status)
            import :: bmi_geo
            class(bmi_geo), intent(in) :: this
            integer, intent(in) :: grid
            character(len=*), intent(out) :: crs
            integer :: bmi_status
        end function bmi_geo_get_grid_crs

    end interface

end module bmi_geo
