all: stl/top.stl stl/lid.stl stl/bottom.stl

stl/%.stl: %.scad constants.scad
	@mkdir -p $$(dirname $@)
	openscad -o $@ $<

stl/lid.stl: bayonetmount.scad support.scad stl/handle.stl
stl/top.stl: bayonetmount.scad support.scad

clean:
	rm stl/*.stl
