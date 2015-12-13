include <constants.scad>;

use <threads.scad>;
use <cap.scad>;


difference() {

   cap();

    // Hole for the lid
    union() {
        // Actual lid hole
        translate([0, 0, 1.25 * height_unit])
            cylinder(r = lid_diameter / 2,
                        h = 0.5 * height_unit + 0.01, 
                        center = true);
        
        // Add a little bevel to smooth the thread start
        translate([0, 0, (0.125 + 0.75) * height_unit])
            cylinder(r2 = lid_diameter / 2,
                        r1 = thread_diameter / 2,
                        h = 0.25 * height_unit + 0.01,
                        center = true);
                        
       
        // Metric Thread
        translate([0, 0,  - height_unit])
            metric_thread(thread_diameter + thread_tolerance, 
                            thread_pitch,
                            thread_lenght_top, 
                            internal=true);
        
        // Put a little support unter the thread
        translate([0, 0, -height_unit])
            cylinder(r2 = thread_hole_diameter / 2,
                r1 = body_hole_diameter / 2,
                h = 1 * height_unit + 0.01, 
                center = true);
    }
    
}