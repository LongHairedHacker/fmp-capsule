use <threads.scad>;

$fn = 90;

bumper_diameter = 85;
body_diameter = 69;
m3nut_diameter = 6.5;

thread_diameter = body_diameter - 10;
thread_pitch = 3;
thread_lenght = 7.5;

difference() {

    // Cap
    union() {
        cylinder(r = bumper_diameter / 2, 
                    h = 5, 
                    center = true);
    
        translate([0, 0, -5])
            cylinder(r2 = bumper_diameter / 2,
                    r1 = body_diameter /2,
                    h = 5,
                    center = true);
         
        translate([0, 0, 5])
            cylinder(r1 = bumper_diameter / 2,
                    r2 = body_diameter /2,
                    h = 5,
                    center = true);
        
        translate([0, 0, -5 - 7.5]) 
                cylinder(r = body_diameter / 2, 
                        h = 10, 
                        center = true);
    }

    // Make the cap hollow
    translate([0, 0, -10])
        cylinder(r = (body_diameter / 2) - 5, 
            h = 15.1, 
            center = true);
    
    // Hole for the lid
    union() {
        translate([0, 0, 5 + 1.25])
            cylinder(r = body_diameter / 2 - 2.5, h=2.6,    center=true); 
        translate([0, 0, -2.5])
            metric_thread(thread_diameter, 
                            thread_pitch,
                            thread_lenght, 
                            internal=true);
    }
    
    // Screw holes
    for(angle = [0, 90, 180, 270]) {
        rotate([0,0,angle])
        translate([0, 
            body_diameter / 2 - 1.8 - 2.5, 
            -10 - m3nut_diameter / 2])
            rotate([90, 0 ,0])
                union() {
                    cylinder(r = m3nut_diameter / 2, 
                        h=3.6, 
                        center=true, 
                        $fn=6);
                    
                    translate([0,0,-3])
                    cylinder(r = 3.5/2, 
                        h=6, 
                        center=true);  
                }
    }
}