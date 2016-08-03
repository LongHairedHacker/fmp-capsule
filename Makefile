all: top.stl lid.stl bottom.stl

%.stl: %.scad constants.scad bayonetmount.scad support.scad handle.scad
	openscad -o $@ $<
