// arnsteio, 2018

// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

man=2;
house_height=5;
wall_thickness=0.8;
error=0.01;

include <bezier.scad>;
resolution = 50;

module spire(h)
    {
        rotate_extrude($fn = resolution)
        BezPolygon([
                [[0, 0],[0, 0],[0, 0],[0, 0]],
                [[0.5*h, 0],[0.8*h, 0.5*h],[0, 0.5*h],[0, h]]
        ], resolution);
    }
    
module room(w,d,h)
    // flat topped house with door
    // Arguments: width, depth, height
    {
            difference()
        {
            cube([w,d,h], center=true);
            translate([0,0,-wall_thickness]) cube([w-wall_thickness*2,d-wall_thickness*2,h-wall_thickness], center=true);
            translate([w/2, 0, -h/2+man/2-error]) cube([wall_thickness*3, man/2, man], center=true);
            }
        
        }
        
module open_room(w,d,h)
    // open topped house with door
    // Arguments: width, depth, height
    {
            difference()
        {
            cube([w,d,h], center=true);
            cube([w-wall_thickness*2,d-wall_thickness*2,h], center=true);
            translate([w/2, 0, -h/2+man/2-error]) cube([wall_thickness*3, man/2, man], center=true);
            }
        
        }        
        
module solidroof(w,d,h)
    // Solid roof
    // Arguments: width, depth, height
    {
        hull()
        {
            cube([w,d,error], center=true);
            translate([0,0,h]) cube([w,error, error], center=true);
            }
        
        }
        
module roof(w,d,h)
        // Hollow roof
        // Arguments: width, depth, height
     {
        difference()
        {
            solidroof(w,d,h);
            translate([0,0,-wall_thickness*1.5]) solidroof(w-wall_thickness, d-wall_thickness, h);
        }
    }
module build();
        {
            open_room(3,3,house_height);
//            translate([0,0,house_height/2]) spire(man*1.5);
            translate([0,0,house_height/2]) roof(4,4,man);
            }