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