all: top.stl lid.stl bottom.stl

%.stl: %.scad constants.scad cap.scad
	openscad -o $@ $<
