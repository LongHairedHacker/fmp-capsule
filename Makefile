all: top.stl lid.stl

%.stl: %.scad constants.scad bayonetmount.scad
	openscad -o $@ $<
