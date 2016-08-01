include <constants.scad>;
include <bayonetmount.scad>;
include <support.scad>;

delta = 0.5;
wall_thickness = 5;

difference() {
	union() {
		lid(tube_outer_diameter - delta * 2, 
			tube_inner_diameter - delta * 2,
			latch_width - delta,
			latch_height - delta,
			lid_height - delta);
		
		translate([0, 0, lid_height - brim_height / 2])
		cylinder(r = tube_outer_diameter / 2, 
					h = brim_height,
					center = true);
	}
	
	hull() {
			pos = groove_length / 2 - groove_depth;
			for(x = [-pos, pos])
				translate([x, 0, lid_height])
					sphere(r = groove_depth, center = true);
	}
	
	difference() {
		translate([0, 0, (lid_height - wall_thickness) / 2])
			cylinder(r = (tube_inner_diameter - wall_thickness) / 2, 
						h = lid_height - wall_thickness,
						center = true);
		
		translate([0, 0, lid_height / 2])
			cube([tube_outer_diameter, 
					groove_depth * 2, 
					lid_height],
					center = true);
	}
}

translate([0, 0, lid_height /2]) {
	support(tube_outer_diameter, lid_height);
	support(tube_outer_diameter * 0.96, lid_height);
	
	support(tube_inner_diameter * 0.75, lid_height);
}