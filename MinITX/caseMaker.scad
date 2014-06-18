/*
	This script auto generates a computer case for 3d printing purposes. Parameters include the PCB size, 	the case wall thickness, the box height(height of case), the screw holder parameters (legnth, 
	diameter) and where exactly the screws go. 

	(C) (I guess) Zach Jaggi, 2010
	v 0.1

	PS  Can anyone else tell my for loops were having techical difficulties?
*/


$fa = 0.1;
$fs = 0.1;

pcbXSize = 305; //Width of motherboard
pcbYSize = 244; //Height of mother board
pcbXSpace = 30; //How much extra space on X axis
pcbYSpace = 30; //How much extra space on Y axis
wallThick = 7; //Wall thickness
boxHeight = 100; //Height of case

backPanelX = 158.75;
backPanelZ = 44.45;

screwDiam = 3.500; //Screw diameter
screwLeng = 6.35; //Screw legnth, or riser height

pcbX = pcbXSize + pcbXSpace;
pcbY = pcbYSize + pcbYSpace;

//Not the most elegant, but it works. Distance is from the top right corner of the PCB.
module screws() {
	makescrew([-157.48, -10.16, 0]);
	makescrew([-157.48, -165.24, 0]);
	makescrew([-6.35, -165.24, 0]);
	makescrew([-6.35, -33.02, 0]);
	makescrew([-157.48, -237.49, 0]);
	makescrew([-6.35, -237.49, 0]);
	makescrew([-281.94, -10.16,0]);
	makescrew([-281.94, -165.24, 0]);
	makescrew([-281.94, -237.49, 0]);
	makescrew([-203.2, -10.16, 0]);

}

//Corner of PCB for screw placement.
offsetPcb = [ pcbXSize/2, pcbY/2, wallThick + (screwLeng/2)];


//Quick markup for Mini-ITX, units are mm, connectors facing +Y
//Y=/- hold corners, pcb fits inside 


module case() {
	translate( [ -((pcbX/2)+(wallThick/2)), 0, (boxHeight/2)] ) {
		cube([wallThick, pcbY, boxHeight  ], center = true);  //-X aka left
	}
	translate( [ ((pcbX/2)+(wallThick/2)), 0, (boxHeight/2)] ) {
		cube([wallThick, pcbY, boxHeight  ], center = true);  //+X aka right
	}
	translate( [ 0, -((pcbY/2)+(wallThick/2)), (boxHeight/2)] ) {
		difference() {
			cube([pcbX+(2*wallThick), wallThick, boxHeight ], center = true ); //-Y aka down
			translate([ (pcbX+wallThick)/2, 0, boxHeight/2])
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
			translate([ -(pcbX+wallThick)/2,0, boxHeight/2])
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true); 
		}
	}
	translate( [ 0, ((pcbY/2)+(wallThick/2)), (boxHeight/2)] ) {
		difference() {
			cube([pcbX+(2*wallThick), wallThick, boxHeight ], center = true ); //-Y aka up
			translate([(pcbX + wallThick)/2, 0, boxHeight/2])
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
			translate([-(pcbX + wallThick)/2, 0, boxHeight/2])
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
			translate([(pcbXSize/2)-(backPanelX/2), 0, (-(boxHeight/2) + (backPanelZ/2) + wallThick+ screwLeng)])
				cube([ backPanelX, (wallThick*2), backPanelZ], center = true);
		}
	}
	translate( [ 0, 0, (wallThick/2) ] ) {
		cube([pcbX, pcbY, wallThick], center = true); //-Z aka bottom
	}
	translate( [pcbX + (3*wallThick), 0, (wallThick/2)]) {
		difference() {
			cube([pcbX +(2*wallThick), pcbY+ (2*wallThick), wallThick], center = true); //+Z aka top
			translate([ (pcbX+wallThick)/2, (pcbY+wallThick)/2, 0] ) 
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true); //top left			
 			translate([ -(pcbX+wallThick)/2, (pcbY+wallThick)/2, 0] )
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true); //top right		
 			translate([ (pcbX+wallThick)/2, -(pcbY+wallThick)/2, 0] )
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true); //bottom left
 			translate([ -(pcbX+wallThick)/2, -(pcbY+wallThick)/2, 0] )
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true); //bottom right
			}
	}
}

module makescrew(loc) { 
	translate(offsetPcb + loc) {
		difference() {
			cylinder(h = screwLeng, r = screwDiam, center = true);
			cylinder(h = (2*screwLeng), r= (screwDiam/2), center = true);
		}
	}
}
module dummyPCB() {
	%translate([0,(pcbYSpace/2),wallThick+screwLeng+1.5])
		cube([pcbXSize, pcbYSize, 3], center = true);
}



color([0.1, 0.7, 0.5])
	case();
screws();
dummyPCB();
