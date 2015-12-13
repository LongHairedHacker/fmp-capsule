include <constants.scad>;

module cap() {
    difference() {
    
        // Actual cap
        union() {
            // Bumper
            cylinder(r = bumper_diameter / 2, 
                        h = height_unit, 
                        center = true);
            
            // Lower cone
            translate([0, 0, - 1.5 * height_unit])
                cylinder(r2 = bumper_diameter / 2,
                        r1 = body_diameter /2,
                        h = height_unit * 2,
                        center = true);
            
            // Upper cone
            translate([0, 0, height_unit])
                cylinder(r1 = bumper_diameter / 2,
                        r2 = body_diameter /2,
                        h = height_unit,
                        center = true);
            
            // End piece that goes into the tube
            translate([0, 0, -2.5 * height_unit]) 
                    cylinder(r = body_diameter / 2, 
                            h = 2 * height_unit, 
                            center = true);
        }
    
        // Make a grove to slide the tube into
        translate([0, 0, -2 * height_unit])
            difference() {
                cylinder(r = tube_outer_diameter / 2, 
                        h = height_unit, 
                        center = true);
            
                cylinder(r = body_diameter / 2, 
                        h = height_unit + 0.1, 
                        center = true);
            }
        
        // Make the end piece of the cap hollow
        translate([0, 0, -2.5 * height_unit])
            cylinder(r = body_hole_diameter / 2, 
                h = 2 * height_unit + 0.1, 
                center = true);
        
        
        // Place the nuts
        nut_y_offset = body_diameter / 2 
                        - (body_diameter/2 - body_hole_diameter/2) 
                        + m3nut_depth / 2 - 0.5;
        
        for(angle = [0, 90, 180, 270]) {
            rotate([0,0,angle])
                translate([0, 
                    nut_y_offset, 
                    - 2.5 * height_unit])
                    rotate([90, 0 ,0])
                        //This is one nut and the hole attched to it
                        union() {
                            cylinder(r = m3nut_diameter / 2, 
                                h = m3nut_depth, 
                                center = true, 
                                $fn = 6);
                        
                            translate([0, 0, -m3hole_depth / 2 -m3nut_depth / 2])
                                cylinder(r = m3hole_diameter / 2, 
                                    h = m3hole_depth + 0.1, 
                                    center = true);  
                        };
        }
    }
}

cap();