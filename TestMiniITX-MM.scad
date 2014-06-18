//UNCOMMENT THE DESIRED CONFIGURATION MODULE BELOW

MiniItxScrewMounts();
//FanMount();
//HardDriveHolder();
//HardDriveBase();

//==========================================
// VARIABLES

thickness = 2.5; //mm
opening = 5; //mm

//==========================================

module case(CaseLength) {
	difference(){
		cube([178,CaseLength,93]); //base box

		translate([thickness,thickness,thickness]){
			cube([178-thickness*2,CaseLength - thickness*2,100]);} //cut out box

		translate([thickness+opening,0,thickness]){
			cube([178-thickness*2-opening*2,CaseLength +1,100]);} //cut out box

	//cut out attachment points

	difference(){
		translate([51,CaseLength - 15.5,0]){
			scale([2,1,1]){
				rotate(a=45, v=[0,0,1]){
					cube([13,13,13]);}}}

		translate([31.75,CaseLength - 57.1,0]){
			cube([50.8,50.8,25.4]);}
	}

		difference(){
			translate([127,CaseLength - 15.5,0]){
				scale([2,1,1]){
					rotate(a=45, v=[0,0,1]){
						cube([13,13,13]);}}}

		translate([105,CaseLength - 57.1,0]){
			cube([50.8,50.8,25.4]);}
		}

		//FACEPLATE IO SHIELD
		//translate([.1,0,0.2]){
			//cube([6.2,.2,1.75]);} 

		} //end difference

		//ADD ATTACHMENT TO FRONT

		difference(){
			translate([51,-15.25,0]){
				scale([2,1,1]){
					rotate(a=45, v=[0,0,1]){
						cube([13,13,2.5]);}}}

		translate([31.75,-56.9,0]){
			cube([50.8,50.8,25.4]);}
		}

		difference(){
			translate([127,-15.25,0]){
				scale([2,1,1]){
					rotate(a=45, v=[0,0,1]){
						cube([13,13,2.5]);}}}

		translate([105,-56.9,0]){
			cube([50.8,50.8,25.4]);}
	}
}// END CASE MODULE

//==========================================

module MiniItxScrewMounts(){
CaseLength = 178; //mm
case(CaseLength);

ScrewPlacement1 = [168.9,12.7,2.5];
ScrewPlacement2 = [11.43,35.56,2.5];
ScrewPlacement3 = [168.91,167.64,3];
ScrewPlacement4 = [11.43,167.64,3];

interiorRadius = 2;
exteriorRadius = 3.8;
offset = 6;

for(x=[ScrewPlacement1,ScrewPlacement2,ScrewPlacement3,ScrewPlacement4])
{
	difference(){
		translate(x){
			cylinder(r=exteriorRadius, h=offset, $fs=.1);}
		translate(x){
			cylinder(r=interiorRadius, h=offset, $fs=.1);
	}
}
}

} //END MINIITXSCREWMOUNTS MODULE

//==========================================

module FanMount(){
CaseLength = 40; //mm
case(CaseLength);

//FANS
//translate([6.75,5,2.5]){
//cube([80,25,80]);}

//translate([92,5,2.5]){
//cube([80,25,80]);}

Mount1 = [6.75,2.5,2.5];
Mount2 = [92,2.5,2.5];
Mount3 = [6.75+80-8.6,2.5,2.5];
Mount4 = [92+80-8.6,2.5,2.5];
Mount5 = [6.75,2.5+25+3,2.5];
Mount6 = [92,2.5+25+3,2.5];
Mount7 = [6.75+80-8.6,2.5+25+3,2.5];
Mount8 = [92+80-8.6,2.5+25+3,2.5];

interiorRadius = 2.3;
exteriorWidth = 8.6;
offset = [4.3,0,4.3];

for(x=[Mount1,Mount2,Mount3,Mount4,Mount5,Mount6,Mount7,Mount8])
{
	difference(){
		translate(x){
			cube([exteriorWidth,3,exteriorWidth]);}

		translate(x+offset){
			rotate([-90,0,0]){
				cylinder(h=3.2, r=interiorRadius, $fs=.1);}}
	} // End Diff
}

} //END FANMOUNT MODULE

//==========================================

module HardDriveHolder(){

CaseLength = 115; //mm

difference(){
	case(CaseLength);
	HardDrives();
}

BaseOffset = 25;

Stack1 = [thickness+BaseOffset-5, thickness, thickness];
Stack2 = [thickness+BaseOffset+146-13, thickness, thickness];
Stack3 = [thickness+BaseOffset-5, thickness+97, thickness];
Stack4 = [thickness+BaseOffset+146-13, thickness+97, thickness];
Stack5 = [thickness+BaseOffset+60, thickness, thickness];
Stack6 = [thickness+BaseOffset+60, thickness+97, thickness];

for(x=[Stack1,Stack2,Stack3,Stack4,Stack5,Stack6])
{
difference(){
	translate(x){
cube([15,10,93-thickness]);}
	HardDrives();}
}

} //END HARDDRIVEHOLDER MODULE

//==========================================

module HardDrives(){

BaseOffset = 25;

	translate([thickness+BaseOffset,thickness*2,thickness+3]){
cube([146+20,102,26]);}

translate([thickness+BaseOffset,thickness*2,thickness+26+3*2]){
cube([146+20,102,26]);}

translate([thickness+BaseOffset,thickness*2,thickness+26*2+3*3]){
cube([146+20,102,26]);}
}

//==========================================

module HardDriveBase(){

difference(){

	cube([93-thickness,115,40]);

	translate([3,thickness*2,25]){
		cube([26,102,50]);}

	translate([3*2+26,thickness*2,25]){
		cube([26,102,50]);}

	translate([3*3+26*2,thickness*2,25]){
		cube([26,102,50]);}

	translate([2,thickness*2+9,0]){
		cube([27,40,26]);}

	translate([2+26+3,thickness*2+9,0]){
		cube([27,40,26]);}

	translate([2+26*2+3*2,thickness*2+9,0]){
		cube([27,40,26]);}

} //EndDiff

} //	END HARDDRIVEBASE MODULE

//==========================================