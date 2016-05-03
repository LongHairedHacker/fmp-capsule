include <constants.scad>;
include <bayonetmount.scad>;


module support(outer_diameter, height) {
	inner_diameter = outer_diameter - 0.5;
	
	difference() {
		cylinder(r = outer_diameter / 2, 
					h = height,
					center=true);
		cylinder(r = inner_diameter / 2, 
					h = height * 1.01, 
					center = true);
	}
}



difference() {
	translate([0, 0, bumper_height / 2])
		minkowski() {
			radius = bumper_diameter / 2 - bumper_edge_radius;
			height = bumper_height - 2 * bumper_edge_radius;
			cylinder(r = radius, h = height, center = true);
			sphere(r = bumper_edge_radius, center = true);
		}
		
	translate([0, 0, bumper_height - lid_height])
		hole(tube_outer_diameter, 
			tube_inner_diameter,
			latch_width,
			latch_height,
			lid_height);

	translate([0, 0, lid_height / 2])
		cylinder(r = tube_inner_diameter / 2,
					h = lid_height, 
					center = true);
	
		
	translate([0, 0, bumper_tube_depth / 2])
		cylinder(r = tube_outer_diameter / 2,
					h = bumper_tube_depth, 
					center = true);
}


translate([0, 0, bumper_tube_depth / 2])
	support(tube_inner_diameter + 0.5, bumper_tube_depth);

translate([0, 0, bumper_height - lid_height + latch_height / 2])
	support(tube_inner_diameter + 0.5, latch_height);