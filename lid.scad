include <constants.scad>;

use <cap.scad>;
use <threads.scad>;




difference() {
    union() {
        translate([0, 0, 0.25 * height_unit])
            cylinder(r = lid_diameter / 2 - lid_tolerance, 
                    h=0.5 * height_unit,
                    center=true);

        translate([0, 0, -thread_lenght_lid])
            metric_thread(thread_diameter - thread_tolerance, 
                            thread_pitch,
                            thread_lenght_lid);
    }
    
    union() {
        for(pos = [-3 * height_unit, 3 * height_unit]) {
            translate([pos, 0, height_unit])
                sphere(r = 1.5 * height_unit, center=true);
        }
        translate([0, 0, height_unit])
        rotate([0, 90, 0])
        cylinder(r = 1.5 * height_unit, h=6 * height_unit, center=true);
    }
    
    
    
    //Make the thread hollow
    translate([0, 0, - 1.5 * height_unit])
        cylinder(r = thread_diameter / 2 - 5, 
                h = 1.5 * height_unit + 0.01,
                center=true);
}
