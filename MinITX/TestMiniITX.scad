//MAIN CASE

difference(){
cube([7,7,2.5]); //base box

translate([.1,0,.1]){
cube([6.8,7.1,4]);} //cut out box

difference(){

translate([2,6.4,0]){
scale([2,1,1]){
rotate(a=45, v=[0,0,1]){
cube([.5,.5,.5]);}}} //cut out attachment points

translate([1.25,4.76,0]){
cube([2,2,1]);}
}

difference(){

translate([5,6.4,0]){
scale([2,1,1]){
rotate(a=45, v=[0,0,1]){
cube([.5,.5,.5]);}}} //cut out attachment points

translate([4.25,4.76,0]){
cube([2,2,1]);}
}

//translate([.1,0,0.2]){
//cube([6.2,.2,1.75]);} //FACEPLATE IO SHIELD

} //end difference


//SCREW LOCATIONS
screwLocationExterior = 15;
screwLocationInterior = 2.5/32*100;
screwLocationHeight = 0.25;
screwLocation1 = [6.65,.5,0.1];
screwLocation2 = [0.45,1.4,0.1];
screwLocation3 = [6.65,6.6,0.1];
screwLocation4 = [0.45,6.6,0.1];

difference(){

translate(screwLocation1){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationExterior);}}

translate(screwLocation1){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationInterior);}}

} //end difference

difference(){

translate(screwLocation2){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationExterior);}}

translate(screwLocation2){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationInterior);}}

} //end difference

difference(){

translate(screwLocation3){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationExterior);}}

translate(screwLocation3){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationInterior);}}

} //end difference

difference(){

translate(screwLocation4){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationExterior);}}

translate(screwLocation4){
scale([0.01,0.01,0]){
cylinder(h=screwLocationHeight, r=screwLocationInterior);}}

} //end difference


//ADD FRONT ATTACMENT POINTS

difference(){

translate([2,-0.6,0]){
scale([2,1,1]){
rotate(a=45, v=[0,0,1]){
cube([.5,.5,.1]);}}} //cut out attachment points

translate([1.25,-2.24,0]){
cube([2,2,1]);}
}

difference(){

translate([5,-56.9,0]){
scale([2,1,1]){
rotate(a=45, v=[0,0,1]){
cube([.5,.5,.1]);}}} //cut out attachment points

translate([4.25,-56.9,0]){
cube([2,2,1]);}
}