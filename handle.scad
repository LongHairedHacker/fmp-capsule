//$fn = 90;

include <constants.scad>;



module handle() {
    center_offset = (handle_length / 2) 
                    - handle_height;

    // Doesn't make much sense but gives nice proportions                
    handle_bevel_radius = 2 * handle_length - handle_min_width;

    rotate([-90, 0, 0])
        minkowski() {
            translate([0, center_offset, 0])
                difference() {
                    cylinder(d = handle_length,
                                h = handle_max_width,
                                center = true);
                    cylinder(d = handle_length - handle_thickness,
                                h = handle_max_width,
                                center = true);
                    translate([0, handle_height, 0])
                        cube([handle_length, 
                                handle_length,
                                handle_max_width
                            ], 
                            center = true);
                    
                    for(z = [-handle_length, handle_length])
                    translate([0, -center_offset, z])
                        rotate([90,0,0])
                            cylinder(d = handle_bevel_radius,
                                        h =handle_max_width);

                }
                
            sphere(d = handle_minkowski_dia, center = true);
        }
}

handle();