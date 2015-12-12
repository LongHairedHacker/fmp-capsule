use <threads.scad>;


$fn = 90;

bumper_diameter = 85;
body_diameter = 69;
m3nut_diameter = 6.5;

tolerance = 0.5;

thread_diameter = body_diameter - 10;
thread_pitch = 3;
thread_lenght = 7.5;

difference() {
    union() {
        translate([0, 0, 1.25])
            cylinder(r = body_diameter / 2 - 2.5 - tolerance, 
                    h=2.6,
                    center=true);

        translate([0, 0, -thread_lenght])
            metric_thread(thread_diameter, 
                            thread_pitch,
                            thread_lenght);
    }
    
    for(pos = [-15, 15]) {
        translate([pos, 0, 2.5 + 2.5])
            sphere(r = 5, center=true);
    }
}
