r = 45; h = 20; w = 20;

br = 11.15; bh = 7; ir = 5;
t = 4; e = 0.02; $fn = 50;
  
intersection() {
  difference() {
    cylinder(r1=r, r2=ir, h=h);
    translate([0,0,-e]) intersection() {
      cylinder(r=br+e, h=h+e);
      cylinder(r1=br+bh+e, r2=ir, h=br+bh-ir+e);
    }
    cylinder(r=ir, h=h+e);
  }

  union() {
    difference() {
      union() {
        translate([0,-w/2,0]) cube([r+e,w,h]);
        rotate(120) translate([0,-w/2,0]) cube([r+e,w,h]);
        rotate(240) translate([0,-w/2,0]) cube([r+e,w,h]);
      }
      intersection() {
        union() {
          translate([-e,-w/2+t,-e]) cube([r+e,w-2*t,h+2*e]);
          rotate(120) translate([-e,-w/2+t,-e]) cube([r+e,w-2*t,h+2*e]);
          rotate(240) translate([-e,-w/2+t,-e]) cube([r+e,w-2*t,h+2*e]);
        }
        translate([0,0,-e]) cylinder(r=r-t, h=h+2*e);
      }
    }
    cylinder(r=br+t, h=h);
  } 
}
