Top();
translate([-12,0,0]) Bottom();

Width=10;
Length=10;
Height=2;

//drive offset
DriveOffsetX1=0.75;
DriveOffsetX2=5.25;
DriveOffsetY=0;
DriveOffsetZ=1;

//drive spacing
DriveSpace=0.4;
DriveInset=1;

//drive demintions
DriveLength=5.75;
DriveWidth=4;
DriveHeight=1.1;

//supports
SupportOffset=0.4;
SupportRadius=1/8;

//bottom cutouts
cablegrooveX=0;
connectorCutX=2;
connectorCutY=0.25;
connectorCutZ=1;
connectorOffX1=DriveOffsetX1+DriveWidth-connectorCutX;
connectorOffX2=DriveOffsetX2+DriveWidth-connectorCutX;

module Top()
{
difference()
	{
	cube([Width,Length,Height]);
	translate([DriveOffsetX1,0.75+DriveSpace*0+DriveHeight*0,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX1,0.75+DriveSpace*1+DriveHeight*1,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX1,0.75+DriveSpace*2+DriveHeight*2,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX1,0.75+DriveSpace*3+DriveHeight*3,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX1,0.75+DriveSpace*4+DriveHeight*4,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX1,0.75+DriveSpace*5+DriveHeight*5,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);

	translate([DriveOffsetX2,0.75+DriveSpace*0+DriveHeight*0,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX2,0.75+DriveSpace*1+DriveHeight*1,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX2,0.75+DriveSpace*2+DriveHeight*2,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX2,0.75+DriveSpace*3+DriveHeight*3,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX2,0.75+DriveSpace*4+DriveHeight*4,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);
	translate([DriveOffsetX2,0.75+DriveSpace*5+DriveHeight*5,DriveOffsetZ]) cube([DriveWidth,DriveHeight,DriveInset]);

	translate([SupportOffset,SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width-SupportOffset,SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([SupportOffset,Length-SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width-SupportOffset,Length-SupportOffset,1]) cylinder (h=1,r=SupportRadius);

	translate([SupportOffset,Length/2,1]) cylinder (h=1,r=SupportRadius);
	translate([Width/2,SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width/2,Length-SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width-SupportOffset,Length/2,1]) cylinder (h=1,r=SupportRadius);

	translate([Width/2,Length/2,1]) cylinder (h=1,r=SupportRadius);
	}
}

module Bottom()
{
difference()
	{
	cube([Width,Length,Height]);
	translate([2.75,.75,1.5]) cube([connectorCutX,11.25,0.5]);
	translate([7.25,.75,1.5]) cube([connectorCutX,11.25,0.5]);

	translate([connectorOffX1,0.75+DriveSpace*0+DriveHeight*0,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX1,0.75+DriveSpace*1+DriveHeight*1,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX1,0.75+DriveSpace*2+DriveHeight*2,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX1,0.75+DriveSpace*3+DriveHeight*3,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX1,0.75+DriveSpace*4+DriveHeight*4,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX1,0.75+DriveSpace*5+DriveHeight*5,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);

	translate([connectorOffX2,0.75+DriveSpace*0+DriveHeight*0,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX2,0.75+DriveSpace*1+DriveHeight*1,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX2,0.75+DriveSpace*2+DriveHeight*2,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX2,0.75+DriveSpace*3+DriveHeight*3,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX2,0.75+DriveSpace*4+DriveHeight*4,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);
	translate([connectorOffX2,0.75+DriveSpace*5+DriveHeight*5,DriveOffsetZ]) cube([connectorCutX,connectorCutY,connectorCutZ]);

	translate([SupportOffset,SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width-SupportOffset,SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([SupportOffset,Length-SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width-SupportOffset,Length-SupportOffset,1]) cylinder (h=1,r=SupportRadius);

	translate([SupportOffset,Length/2,1]) cylinder (h=1,r=SupportRadius);
	translate([Width/2,SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width/2,Length-SupportOffset,1]) cylinder (h=1,r=SupportRadius);
	translate([Width-SupportOffset,Length/2,1]) cylinder (h=1,r=SupportRadius);

	translate([Width/2,Length/2,1]) cylinder (h=1,r=SupportRadius);
	}
}