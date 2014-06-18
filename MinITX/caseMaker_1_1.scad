/* 
	This script auto generates a computer case for 3d printing purposes. Parameters include the PCB size, the case wall thickness, the box height(height of case), the screw holder parameters (le	gnth, 
	diameter) and where exactly the screws go. 

	(C) (I guess) Zach Jaggi, 2010
	v 0.1

	PS Can anyone else tell my for loops were having techical difficulties?
*/

$fa = 0.1; 
$fs = 0.1;

pcbSizeX = 100; //Width of motherboard
pcbSizeY = 72; //Height of mother board
pcbSpaceX = 30; //How much extra space on X axis
pcbSpaceY = 15; //How much extra space on Y axis
wallThick = 5; //Wall thickness
boxHeight = 40; //Height of case

psuSizeX = 0;
psuSizeY = 140;
psuSizeZ = 150;
psuOpenX = 64;
psuOpenZ = 117;
psuFlip = X;
psuFlipOff = [-psuSizeX, 0, 0];

//backPanelX = 158.75;
//backPanelZ = 44.45;
backPanelX = 100;
backPanelZ = 25;

screwDiam = 3.200; //Screw diameter
screwLeng = 6.35; //Screw legnth, or riser height

boxInX = pcbSizeX + pcbSpaceX +psuSizeX; // inner size of box
boxInY = pcbSizeY + pcbSpaceY;

offsetFirstSlot = 7.5; //Better calculations coming later! :P
offsetOtherSlot = 8.5;
slotWidth = 12;
slotHeight = 105;
slotNum = 0;

//Not the most elegant, but it works. Distance is from the top right corner of the PCB. 
module screws() {
	//makescrew([-157.48, -10.16, 0]); //ATX
	//makescrew([-157.48, -165.24, 0]); //ATX
	//makescrew([-6.35, -165.24, 0]); //ATX
	//makescrew([-6.35, -33.02, 0]); //ATX
	//makescrew([-157.48, -237.49, 0]); //ATX
	//makescrew([-6.35, -237.49, 0]); //ATX
	//makescrew([-281.94, -10.16,0]); //ATX
	//makescrew([-281.94, -165.24, 0]); //ATX
	//makescrew([-281.94, -237.49, 0]); //ATX
	//makescrew([-203.2, -10.16, 0]); //ATX
	//makescrew([-209.45, -10.16, 0]); //mATX
	//makescrew([-209.45, -165.24,0]); //mATX
	//makescrew([-209.45, -237.49, 0]); //mATX
	makescrew([-2.97,-3.04,0]);
	makescrew([-97.05, -3.04, 0]);
	makescrew([-97.05, -69.08, 0]);
	makescrew([-2.97, -69.08, 0]);


}


//Corner of PCB for screw placement. 
offsetPcbX = wallThick + psuSizeX + pcbSizeX + (pcbSpaceX/2);
offsetPcb = [ offsetPcbX, wallThick+pcbSpaceY + pcbSizeY, wallThick + (screwLeng/2)];
offsetPsuScrew = [psuSizeX, 0, 0];

//Quick markup for Mini-ITX, units are mm, connectors facing +Y
//Y=/- hold corners, pcb fits inside 

module frontPanel() {
	difference() {
		cube([boxInX+(wallThick*2), wallThick, boxHeight]); //Y-, legnth of X
		translate([wallThick/2, wallThick/2, boxHeight])
			cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
		translate([wallThick/2 + wallThick + boxInX, wallThick/2, boxHeight])
			cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
	}
}

module backPanel() {
	translate([0, boxInY+wallThick, 0])
		difference() {
			cube([boxInX+(wallThick*2), wallThick, boxHeight]); //Y+, legnth of X
			translate([wallThick/2, wallThick/2, boxHeight])
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
			translate([wallThick/2 + wallThick + boxInX, wallThick/2, boxHeight])
				cylinder(h = 2*screwLeng, r = screwDiam/2, center = true);
			translate([offsetPcbX-backPanelX, -wallThick/2, wallThick + screwLeng])
				cube([ backPanelX, (wallThick*2), backPanelZ]);
			if(slotNum > 0) { 
				union() {
					for( w = [0:(slotNum-1)] ) {
						translate([offsetPcbX-backPanelX-offsetFirstSlot-(w*slotWidth)-(w*offsetOtherSlot)-(pcbSpaceX/2)+wallThick,-wallThick/2, screwLeng+wallThick])
							cube([slotWidth, 2*wallThick, slotHeight]);
					}
				}
			}
			if(pcbSizeX > 0) {
				translate([wallThick, -wallThick/2, wallThick])
					cube([psuSizeX, wallThick*2, psuSizeZ+0.1]); // to match boolean operations nicely
			}		
		}
}

module case() {
	translate([0, wallThick, 0])
		cube([wallThick, boxInY, boxHeight]); //X- , legnth of Y
	translate([boxInX+wallThick, wallThick, 0])
		cube([wallThick, boxInY, boxHeight]); //X+, legnth of Y
	translate([wallThick,wallThick,0])
		cube([boxInX, boxInY, wallThick]); //-Z
	translate([boxInX+ (3*wallThick), 0, 0])//+Z with screw holes
		difference() {
			cube([boxInX + (2*wallThick), boxInY + (2*wallThick), wallThick]); //+Z
			translate([ wallThick/2, wallThick/2, -screwLeng/2] ) 
				cylinder(h = 2*screwLeng, r = screwDiam/2);
			translate([ boxInX+wallThick + wallThick/2, wallThick/2, -screwLeng/2])
				cylinder(h = 2*screwLeng, r = screwDiam/2); 
			translate([ boxInX+wallThick +wallThick/2, boxInY+wallThick+wallThick/2, -screwLeng/2] )
				cylinder(h = 2*screwLeng, r = screwDiam/2);
			translate([ wallThick/2, boxInY + wallThick + wallThick/2, -screwLeng/2] )
				cylinder(h = 2*screwLeng, r = screwDiam/2); 
		}
		
}

module psuWall() { 
	translate([wallThick, boxInY + wallThick, wallThick])
		
		mirror(psuFlip)
		translate(psuFlipOff)
		difference() { 
			cube([psuSizeX, wallThick, psuSizeZ]);
			translate([-16, 0, 16] + offsetPsuScrew)
				rotate(a = [90, 0, 0])
					cylinder(h = screwLeng*2, r = screwDiam/2, center = true);
			translate([-6, 0, 120] + offsetPsuScrew)
				rotate(a = [90, 0, 0])
					cylinder(h = screwLeng*2, r = screwDiam/2, center = true);
			translate([-80, 0, 6] + offsetPsuScrew )
				rotate(a = [90, 0, 0])
					cylinder(h = screwLeng*2, r = screwDiam/2, center = true);
			translate([-80, 0, 142] + offsetPsuScrew)
				rotate(a = [90, 0, 0])
					cylinder(h = screwLeng*2, r = screwDiam/2, center = true); 
			translate([13,-wallThick/2,13])
				cube([psuOpenX, 2*wallThick, psuOpenZ]);
		}
}

module dummyPCB() {
	%translate([offsetPcbX-pcbSizeX, wallThick+pcbSpaceY, wallThick+screwLeng])
		cube([pcbSizeX, pcbSizeY, 3]);
}

module dummyPSU() {
	%translate([ wallThick, boxInY+wallThick-psuSizeY, wallThick])
		cube([psuSizeX, psuSizeY, psuSizeZ]);
}

module makescrew(loc) { 
	translate(offsetPcb + loc) {
		difference() {
			cylinder(h = screwLeng, r = screwDiam, center = true);
				cylinder(h = (2*screwLeng), r= (screwDiam/2), center = true);
		}
	}
}

color([0.1, 0.7, 0.5]) {
	case();
	frontPanel();
	backPanel();
	if (psuSizeX > 0)
		psuWall();
}
dummyPCB();
dummyPSU();
screws();
