// arnsteio, 2018

// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

// Bases of 20mm thickness print in 13 hours. That's untenable. New possibility:  using very thin bases.
// base_h=18; - this won't do.
base_h=0.5;
cover_h=2;
plate_h=base_h+cover_h;
base_l=200;
base_d=200;

man=2;
house_height=5;
hres=0.4;
wall_thickness=hres*2;
error=0.01;
$fn=15;

include <bezier.scad>;
include <church.scad>;

resolution = 15;

module plate(w, d, h)
{
	cube([w, d, h], center=false);
}

plate(base_l, base_d, base_h);
translate([base_l/2, base_d/2, base_h]) church_triple_nave();
translate([base_l/2, base_d/2+10, base_h]) house_valmtak(6,4,4);
