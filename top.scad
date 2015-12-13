include <constants.scad>;

use <threads.scad>;
use <cap.scad>;


module thread() {
	metric_thread(thread_diameter + thread_tolerance, 
					thread_pitch,
                    thread_lenght_top, 
                    internal=true);
	
	translate([0, 0, thread_lenght_top - height_unit])
	cylinder(r2 = body_hole_diameter / 2,
				r1 = thread_hole_diameter / 2,
				h = height_unit);

	cylinder(r1 = body_hole_diameter / 2,
				r2 = thread_hole_diameter / 2,
				h = height_unit);
}




difference() {

   cap();

    // Hole for the lid
    union() {

        // Metric Thread
        translate([0, 0,  - 1 * height_unit])
			thread();

        
        // Make the rest of the cap hollow
        translate([0, 0, -height_unit])
            cylinder(r = body_hole_diameter / 2,
                h = 1 * height_unit + 0.01, 
                center = true);
    }
    
}

