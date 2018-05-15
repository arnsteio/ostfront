// arnsteio, 2018

// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

man=2;
house_height=5;
hres=0.4;
wall_thickness=hres*2;
error=0.01;
$fn=15;

include <bezier.scad>;
include <church.scad>;
resolution = 50;

module test()
    { // Visual guide
        translate([0,0,2.5]) cube(5, center=true);
    }

// I cheated:
// for x in `seq 0 10 100`; do for y in `seq 0 10 100`; do echo "translate([$x, $y, 0])">> testbuild.scad;done; done

//test();
translate([0, 10, 0]) church_tower(4, 6, 3);   
translate([0, 20, 0]) church_tower2(4, 6, 3); 
translate([0, 30, 0]) church_tower3(4, 6, 3); 
translate([0, 40, 0]) church_double_nave();                
translate([0, 50, 0]) church_triple_nave();              
translate([0, 60, 0]) church_x4_2();           
translate([0, 70, 0])  church_x4();    
translate([0, 80, 0]) square_church_tower(4, 6, 3); 
//translate([0, 90, 0])
//translate([0, 100, 0]) test();          

//translate([10, 0, 0]) test();             
translate([10, 10, 0]) one_nave_church(4, 6);                 
translate([10, 20, 0]) one_nave_church2();                     
translate([10, 30, 0]) one_nave_church(5, 5);              
translate([10, 40, 0])one_nave_church(5, 7);    
translate([10, 50, 0])house(3, 4, 7);
translate([10, 60, 0])house(6, 4, 6);
translate([10, 70, 0])house(4, 3, 4);
translate([10, 80, 0])mosque();
translate([10, 90, 0])russian_church();

//translate([10, 100, 0])  test();

//translate([20, 0, 0]) test();
translate([20, 10, 0])house_valmtak(6, 4, 4);
translate([20, 20, 0])house_valmtak(4, 4, 4);
translate([20, 30, 0])house(4, 5, 5);
translate([20, 40, 0])house(6, 4, 6);
translate([20, 50, 0])house_valmtak(6, 4, 5);
translate([20, 60, 0])house_valmtak(5, 5, 5);
translate([20, 70, 0])house_valmtak(7, 5, 4);
translate([20, 80, 0])house_valmtak(5, 3, 5);
translate([20, 90, 0])house(5, 5, 5);
translate([20, 100, 0])house(6, 7, 5);
/*translate([30, 0, 0])
translate([30, 10, 0])
translate([30, 20, 0])
translate([30, 30, 0])tonnetak_hus(8, 6, 5);
translate([30, 40, 0])
translate([30, 50, 0])
translate([30, 60, 0])
translate([30, 70, 0])
translate([30, 80, 0])
translate([30, 90, 0])
translate([30, 100, 0])
translate([40, 0, 0])
translate([40, 10, 0])
translate([40, 20, 0])
translate([40, 30, 0])
translate([40, 40, 0])
translate([40, 50, 0])
translate([40, 60, 0])
translate([40, 70, 0])
translate([40, 80, 0])
translate([40, 90, 0])
translate([40, 100, 0])
translate([50, 0, 0])
translate([50, 10, 0])
translate([50, 20, 0])
translate([50, 30, 0])
translate([50, 40, 0])
translate([50, 50, 0])
translate([50, 60, 0])
translate([50, 70, 0])
translate([50, 80, 0])
translate([50, 90, 0])
translate([50, 100, 0])
translate([60, 0, 0])
translate([60, 10, 0])
translate([60, 20, 0])
translate([60, 30, 0])
translate([60, 40, 0])
translate([60, 50, 0])
translate([60, 60, 0])
translate([60, 70, 0])
translate([60, 80, 0])
translate([60, 90, 0])
translate([60, 100, 0])
translate([70, 0, 0])
translate([70, 10, 0])
translate([70, 20, 0])
translate([70, 30, 0])
translate([70, 40, 0])
translate([70, 50, 0])
translate([70, 60, 0])
translate([70, 70, 0])
translate([70, 80, 0])
translate([70, 90, 0])
translate([70, 100, 0])
translate([80, 0, 0])
translate([80, 10, 0])
translate([80, 20, 0])
translate([80, 30, 0])
translate([80, 40, 0])
translate([80, 50, 0])
translate([80, 60, 0])
translate([80, 70, 0])
translate([80, 80, 0])
translate([80, 90, 0])
translate([80, 100, 0])
translate([90, 0, 0])
translate([90, 10, 0])
translate([90, 20, 0])
translate([90, 30, 0])
translate([90, 40, 0])
translate([90, 50, 0])
translate([90, 60, 0])
translate([90, 70, 0])
translate([90, 80, 0])
translate([90, 90, 0])
translate([90, 100, 0])
translate([100, 0, 0])
translate([100, 10, 0])
translate([100, 20, 0])
translate([100, 30, 0])
translate([100, 40, 0])
translate([100, 50, 0])
translate([100, 60, 0])
translate([100, 70, 0])
translate([100, 80, 0])
translate([100, 90, 0])
translate([100, 100, 0])
*/
