include <constants.scad>;
include <bayonetmount.scad>;

difference() {
	lid(tube_outer_diameter, 
		tube_inner_diameter,
		latch_width,
		latch_height,
		lid_height);
	
	hull() {
			pos = groove_length / 2 - groove_depth;
			for(x = [-pos, pos])
				translate([x, 0, lid_height])
					sphere(r = groove_depth, center = true);
	}
}