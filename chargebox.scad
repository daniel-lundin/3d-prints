

module Flash() {
  topHeight = 2;
  topWidth = 0.5;
  middleHeight = 0.3;
  middleWidth = 1;
  middleCut = 0;

  linear_extrude(height=1, center=true, convexity=10, slices=10)
    polygon([
      [topWidth, topHeight], 
      [-middleWidth, -middleHeight], 
      [-middleCut, -middleHeight], 
      [-topWidth, -topHeight], 
      [middleWidth, middleHeight],
      [middleCut, middleHeight]
    ]);
}

module NoFlash() {
    
    thickness=1;
  Flash();

  rotate([0,0,-45]) translate([-1.5, 0, 0]) cube([1,0.4,2], center=true);
  rotate([0,0,-45]) translate([1.5, 0, 0]) cube([1,0.4,2], center=true);

}



module Sides () {
    
  rotate([90,0,0]) translate([0.25, 0.25, -5]) cylinder(h=5, r=0.25, $fn=360); 
  rotate([90,0,0]) translate([9.75, 0.25, -5]) cylinder(h=5, r=0.25, $fn=360);
  rotate([90,0,0]) translate([9.75, 4.75, -5]) cylinder(h=5, r=0.25, $fn=360);
  rotate([90,0,0]) translate([0.25, 4.75, -5]) cylinder(h=5, r=0.25, $fn=360);  
  translate([0, 0, 0.25]) cube([0.5,5,4.5]);
  translate([9.5, 0, 0.25]) cube([0.5,5,4.5]);
  translate([0.25, 0, 0]) cube([9.5,5,0.5]);
  translate([0.25, 0, 4.5]) cube([9.5,5,0.5]);

  // Middle wall
  translate([4.75, 0, 0]) cube([0.5, 5, q5]);
  // Bottom
  translate([0.25, 0, 0.25]) cube([9.5, 0.5, 4.5]);
}

module Box() {
  difference() {
    cube([10, 5, 5]);
    translate([0.5, 0.5, 0.5])  cube([9, 5, 4]);
  }
  
  translate([4.75, 0, 0])      cube([0.5, 5, 5]);
}

module FullModel() {
  difference() {
    Sides();
    // Box();
    translate([2.5,2.5,4.75]) Flash();    
    translate([7.5,2.5,4.75]) NoFlash();
  }
}

//Flash();
FullModel();

// Sides();


//translate([5, 0, 0]) NoFlash();




