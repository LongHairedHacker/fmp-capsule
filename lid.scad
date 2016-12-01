include <constants.scad>;
include <bayonetmount.scad>;
include <support.scad>;

delta = 0.75;


difference() {
	union() {
		lid(tube_outer_diameter - delta * 2,
			tube_inner_diameter - delta * 2,
			latch_width - delta,
			latch_height - delta,
			lid_height - delta);

		translate([0, 0, lid_height])
			import("handle.stl");

		translate([0, 0, lid_height - brim_height / 2])
		cylinder(r = tube_outer_diameter / 2,
					h = brim_height,
					center = true);
	}
}


translate([0, 0, lid_height /2]) {
	color("red")
		support(tube_outer_diameter, lid_height);
	color("red")
		support(tube_outer_diameter * 0.96, lid_height);
}
