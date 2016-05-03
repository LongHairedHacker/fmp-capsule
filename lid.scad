include <constants.scad>;
include <bayonetmount.scad>;

delta = 0.2;
wall_thickness = 5;

difference() {
	lid(tube_outer_diameter - delta * 2, 
		tube_inner_diameter - delta * 2,
		latch_width - delta,
		latch_height - delta,
		lid_height);
	
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