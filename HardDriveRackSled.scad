//Number of Drives
DriveNumX=3;
DriveNumY=4;

//drive offset
DriveOffsetX1=3/8;
DriveOffsetX2=1/4;
DriveOffsetY=0;
DriveOffsetZ=0.25;

//drive spacing
DriveSpace=1;
DriveInset=1;
DriveBaseOffset=0.125;

//drive demintions
DriveLength=5.75;
DriveWidth=4;
DriveHeight=1;



difference(){
//inches
cube([17.5,26,1.75]);
translate([0.125,0.125,0.06]) cube([17.25,25.75,1.7]);
}
//Drives
for (J = [0 : DriveNumY-1])
{
	for (Z = [0 : DriveNumX-1])
	{
		translate([DriveOffsetX1+DriveWidth*J+DriveOffsetX2*J,DriveBaseOffset+DriveSpace*Z+DriveLength*Z,DriveOffsetZ]) cube([DriveWidth,DriveLength,DriveHeight]);
	}
}

//Mobo
translate([1,19,0.1]) cube([6.7,6.7,0.5]);

//PSU