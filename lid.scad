$fn = 90;

module lid(outer_diameter,
            inner_diameter,
            latch_width, 
            latch_height,
            lid_height) {
        

    translate([0,0, latch_height / 2])
        intersection() {        
            cube([outer_diameter, 
                latch_width,
                latch_height], 
                center = true);
            
            cylinder(r = outer_diameter / 2, 
                    h = latch_height,
                    center = true);
       }
    
    cylinder(r = inner_diameter / 2, h = lid_height);
    
    
}

module hole(outer_diameter,
            inner_diameter,
            latch_width, 
            latch_height,
            lid_height) {
             
    translate([0, 0, lid_height / 2])
        intersection() {        
                cube([outer_diameter, 
                    latch_width,
                    lid_height], 
                    center = true);
                
                cylinder(r = outer_diameter / 2, 
                        h = lid_height,
                        center = true);
       }

   translate([0, 0, latch_height / 2])
        difference() {
            cylinder(r = outer_diameter / 2, 
                    h = latch_height, 
                    center = true);
            
            for(pos = [outer_diameter / 4, -outer_diameter / 4])
                translate([pos, pos, 0])
                    cube([outer_diameter / 2, 
                            outer_diameter / 2,
                            latch_height],
                            center=true);
       }
    
    translate([0,0, lid_height / 2])
        cylinder(r = inner_diameter / 2,
                    h = lid_height, 
                    center = true); 
}


hole(78,72,10,5,10);