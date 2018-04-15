// arnsteio, 2018

// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

man=2;
house_height=5;
wall_thickness=0.4;
hres=0.4;
error=0.01;
$fn=15;

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
   
   module spire2(h)
    {
        rotate_extrude($fn = resolution)
        BezPolygon([
                [[0, 0],[0, 0],[0, 0],[0, 0]],
                [[0.6*h, 0],[0.7*h, 0.5*h],[0, 0.5*h],[0, h]]
        ], resolution);
    }
 
   module spire3(h)
    {
        rotate_extrude($fn = resolution)
        BezPolygon([
                [[0, 0],[0, 0],[0, 0],[0, 0]],
                [[0.6*h, 0],[0.6*h, 0.4*h],[0, 0.5*h],[0, h]]
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
        
module solidvalmtak(w,d,h)
    // Solid valmroof
    // Arguments: width, depth, height
    {
        hull()
        {
            cube([w,d,error], center=true);
            translate([0,0,h]) cube([w/2,error, error], center=true);
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
    
module valmtak(w,d,h)
        // Hollow roof
        // Arguments: width, depth, height
     {
        difference()
        {
            solidvalmtak(w,d,h);
            solidvalmtak(w-wall_thickness*2, d-wall_thickness*2, h-wall_thickness*2);
        }
    }
    
module test()
        {
            open_room(3,3,house_height);
//            translate([0,0,house_height/2]) spire(man*1.5);
            translate([0,0,house_height/2]) roof(4,4,man);
            translate([0,20,0]) tower6(4, 8);
            }
            
module tonnetak_hus(w, d, h)
            {
                difference()
                {// Protruding roof
                    rotate([90, 0, 0])cylinder(h=w, d=d,center=true);
                    translate ([0, 0, 0]) rotate([90, 0, 0])cylinder(h=w+error, d=d-wall_thickness*2,center=true);
                    translate ([0, 0, -h/2]) cube([d, w, h],center=true);
                }
            difference()
                {
                hull()
                    {//House
                        rotate([90, 0, 0])cylinder(h=w-wall_thickness*2, d=d-wall_thickness*2,center=true);
                        translate ([0, 0, -h/2]) cube([d-wall_thickness*2, w-wall_thickness*2, 1],center=true);
                    } // Make hollow:
                    hull()
                    {
                    rotate([90, 0, 0])cylinder(h=w-wall_thickness*4, d=d-wall_thickness*4,center=true);
                    translate ([0, 0, -h/2]) cube([d-wall_thickness*4, w-wall_thickness*4, 1],center=true);
                    }
                    // Make door:
                    translate ([0, w/2, -h/2]) cube([man/2, man, man],center=true);
                }//diff
            } // module
            
module tonnetak(w, d, h)
            {
                roofheight=h;
                for(x=[0:180])
                    translate([x*w/180, 0, sin(x)*roofheight])
                       cube([hres, d, hres]);      
            }      

            
module tonnetak_hus(w,d,h)
            {
             translate([0,0,h*0.9])tonnetak(w,d,h*0.1);   
                
            }
// tonnetak_hus(4, 6, 5);
// --------------- BELOW HERE BUILD MODULES ---------------- //   
module house(w, d, h)
           {
              open_room(w-wall_thickness*1.5, d-wall_thickness*1.5, h*0.6);
              translate([0, 0, h*0.6]) roof(w, d, h*0.4);
               } 

module house_valmtak(w, d, h)
           {
              open_room(w-wall_thickness*1.5, d-wall_thickness*1.5, h*0.6);
              translate([0, 0, h*0.6]) valmtak(w, d, h*0.4);
               } 
               
module church_tower(w,h, s)
            // 6-sided spire with onion cupola
            // Arguments: tower width, tower height, cupola height
            {
                tower6(w,h);
                translate([0, 0, h]) spire(s);
             }
  
module church_tower2(w,h, s)
            // 6-sided spire with onion cupola
            // Arguments: tower width, tower height, cupola height
            {
                tower6(w,h);
                translate([0, 0, h]) spire2(s);
             }
    
module church_tower3(w,h, s)
            // 6-sided spire with onion cupola
            // Arguments: tower width, tower height, cupola height
            {
                tower6(w,h);
                translate([0, 0, h]) spire3(s);
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

module one_nave_church2()
             {
                church_tower(4, 4, 4);
                translate([0, -2, 0]) rotate([0, 0, -90]) house(2, 3, 4);
             }   

module church_double_nave()
             {
                 square_church_tower(4,5,4);
                 translate([3,0,0]) house(3,3,4);
                 translate([-3,0,0]) rotate([0,0,180]) house(3,3,4);
                 }

module church_triple_nave()
             {
                 square_church_tower(4,5,4);
                 translate([3,0,0]) house(3,3,4);
                 translate([-3,0,0]) rotate([0,0,180]) house(4,5,5);
                 
                 }

module church_x4()
             {
                 square_church_tower(4,5,4);
                 translate([3,0,0]) house(3,3,4); // large entrance
                 translate([-4,0,0]) rotate([0,0,180]) house(6,3,4); // church ship
                 translate([0,3,0]) rotate([0,0,90]) house(3,3,4);
                 translate([0,-3,0]) rotate([0,0,-90]) house(3,3,4);
                 }
        
            module church_x4_2()
             {
                 square_church_tower(4,5,4);
                 translate([2,0,0]) house(2,2,4); // small entrance
                 translate([-4,0,0]) rotate([0,0,180]) house(5,3,4); // church ship
                 translate([0,2,0]) rotate([0,0,90]) house(2,3,4);
                 translate([0,-2,0]) rotate([0,0,-90]) house(2,3,4);
                 }
     
module mosque()
                 {
                     tower(7, 5, 3);
                     church_tower(3,5,3);
                     translate([2.5, 2.5, 0]) church_tower(2,4,2);
                     translate([2.5, -2.5, 0]) rotate(0,0,180) church_tower(2,4,2);
                     }

module russian_church()
                 {
                     translate([1, 0, 0]) tower(5, 7, 3);
                     church_tower(3,5,3);
                     translate([2.5, 2.5, 0]) church_tower(2,4,2);
                     translate([2.5, -2.5, 0]) church_tower(2,4,2);
                     }
                   
//          church_tower(4, 6, 3);   
//             square_church_tower(4, 6, 3);  
//               one_nave_church(4, 6); 
//                 house(6, 4, 6);
//                house_valmtak(6, 4, 4);
//             house_valmtak(4, 4, 4);
//             one_nave_church2();
//                 hurch_double_nave();
//                 church_triple_nave();
//                 church_x4_2();
//                 church_x4();
//                     russian_church();
//                     mosque();
//                     tonnetak_hus(8, 6, 5);