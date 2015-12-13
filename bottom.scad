include <constants.scad>
use <cap.scad>

difference() {

    cap();

    // Make the cap hollow
    translate([0, 0, -1.5 * height_unit])
        cylinder(r = body_hole_diameter / 2, 
            h = 4 * height_unit + 0.1, 
            center = true);
}