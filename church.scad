// arnsteio, 2018

// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

man=2;
house_height=5;
wall_thickness=0.4;
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
    
module tower6(w,h)
     // flat topped 6 sided tower with door
    // Arguments: width, height
    {
        difference()
        {
            $fn=6;
            cylinder(d=w, h=h, center=false);
            cylinder(d=w-wall_thickness*2, h=h-wall_thickness, center=false);
             translate([0, w/2, man/2]) cube([man/2, wall_thickness*4, man], center=true);
            }
        }
        
module tower8(w,h)
     // flat topped 8 sided tower
    // Arguments: width, height
    {
        difference()
        {
            $fn=8;
            cylinder(d=w, h=h, center=false);
            cylinder(d=w-wall_thickness*2, h=h-wall_thickness, center=false);
            }
        }        
        
module tower(w,d,h)
    // flat topped tower with door
    // Arguments: width, depth, height
    {
        translate([0,0,h/2])
        {
        difference()
        {
            cube([w,d,h], center=true);
            translate([0,0,-wall_thickness]) cube([w-wall_thickness*2,d-wall_thickness*2,h-wall_thickness], center=true);
            translate([w/2, 0, -h/2+man/2-error]) cube([wall_thickness*3, man/2, man], center=true);
            }
        
        }
    }
        
module open_room(w,d,h)
    // open topped house with door
    // Arguments: width, depth, height
    {
        translate([0,0,h/2])
        {
            difference()
        {
            cube([w,d,h], center=true);
            cube([w-wall_thickness*2,d-wall_thickness*2,h], center=true);
            translate([w/2, 0, -h/2+man/2-error]) cube([wall_thickness*3, man/2, man], center=true);
            }
        
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
            solidroof(w-wall_thickness*2, d-wall_thickness*2, h-wall_thickness*2);
        }
    }
module test()
        {
            open_room(3,3,house_height);
//            translate([0,0,house_height/2]) spire(man*1.5);
            translate([0,0,house_height/2]) roof(4,4,man);
            translate([0,20,0]) tower6(4, 8);
            }
// --------------- BELOW HERE BUILD MODULES ---------------- //   
module house(w, d, h)
           {
              open_room(w-wall_thickness*1.5, d-wall_thickness*1.5, h*0.6);
              translate([0, 0, h*0.6]) roof(w, d, h*0.4);
               } 
               
module church_tower(w,h, s)
            // 6-sided spire with onion cupola
            // Arguments: tower width, tower height, cupola height
            {
                tower6(w,h);
                translate([0, 0, h]) spire(s);
             }
          
module square_church_tower(w,h, s)
            // Square tower with onion cupola
            // Arguments: tower width, tower height, cupola height
            {
                tower(w,w, h);
                translate([0, 0, h]) spire(s);
             }
             
module one_nave_church(w, h)
             {
                church_tower(w, h*0.5, h*0.5);
                translate([0, -w/2, 0]) rotate([0, 0, -90]) house(w, w*0.7, h*0.7);
             }   

//          church_tower(4, 6, 3);   
//             square_church_tower(4, 6, 3);  
                one_nave_church(4, 6); 
//                 house(6, 4, 6);
             