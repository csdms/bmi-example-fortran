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
    
end module bmiheatgeof
