include <constants.scad>;




difference() {
	translate([0, 0, bumper_height / 2])
		minkowski() {
			radius = bumper_diameter / 2 - bumper_edge_radius;
			height = bumper_height - 2 * bumper_edge_radius;
			cylinder(r = radius, h = height, center = true);
			sphere(r = bumper_edge_radius, center = true);
		}
		

	translate([0, 0, lid_height / 2])
		cylinder(r = tube_inner_diameter / 2,
					h = lid_height, 
					center = true);
	
		
	translate([0, 0, bumper_tube_depth / 2])
		cylinder(r = tube_outer_diameter / 2,
					h = bumper_tube_depth, 
					center = true);
}


