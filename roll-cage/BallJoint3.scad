//// Date: 2021.01.13
//// Version: OpenSCAD 2015.03-2
//// File: BallJoint3.scad
//// Author: Kijja Chaovanakij
////
//// Revise: 2021.02.1
//// Added an option to use as a library
//// Bug fixes for neck_top_hi.
////
//// Revise: 2021.02.6
//// Added an option to turn on / off the thread rod.


//sample for libray
//ball(brad=9, top_hi=5, rod=1, screw_dia=8, screw_len=10);
//ball(brad=9, top_hi=5, rod=0);
//ball_nut(brad=9, hi=6, screw_dia=8, tol=0.5);
//socket(brad=9, hi=12, gap=0.25, plate=1);
//socket(brad=9, hi=12, gap=0.25, plate=0);
//socket_nut(brad=9, gap=0.25, tol=0.6);

/*[smoothness_and_tolerance]*/
//smoothness
smooth=48; //[48:low, 60:medium, 72:fine]
$fn=smooth;
//gap between parts[0.25]
part_gap=0.25;

/*[part and option]*/
//part to generate(demo takes a long time to render)
part=0; //[0:demo, 1:ball joint, 2:ball nut, 3:socket, 4:socket nut, 5:use as library]
//make mounting plate
make_plate=1; //[0:no, 1:yes]
//make thread rod
make_rod=1; //[0:no, 1:yes]

/*[ball]*/
//ball diameter[18]
ball_dia=18; //[12,14,16,18,20,22,24,27,30,33,36,39,42]
//neck top height
neck_top_hi=5; //[3:1:100]
//ball screw size[8]
ball_screw=8; //[5,6,8,10,12,14,16,18,20,22,24]
//ball screw length
ball_screw_len=10; //[4:1:30]
//ball nut thickness
ball_nut_thk=6; //[3:1:10]
//ball nut tolerance
ball_nut_tol=0.5;

/*[socket]*/
//socket height(active if bigger than minimal size)
socket_hi=10;
//socket nut tolerance
socket_nut_tol=0.5;

/*[plate]*/
//plate x size
plate_xs=36;
//plate y size
plate_ys=30;
//plate z size
plate_zs=2.4;
//screw hole diameter
screw_hole_dia=3.3;
//screw hole offset from plate edge
screw_hole_offset=2;

//======== main ========//
if (part==1||part==0)
  color("Silver")
  translate([0, -ball_dia, -ball_dia/2])
    ball();
if ((part==2||part==0)&&make_rod==1)
  color("Silver")
  translate([0, -ball_dia, ball_dia*0.3+neck_top_hi+ball_screw_len])
  ball_nut();
if (part==3||part==0)
  color("Goldenrod")
  translate([0, ball_dia, 0])
  socket();
if (part==4||part==0)
  color("Goldenrod")
  translate([0, ball_dia, ball_dia/2])
  socket_nut();

//ball();
module ball(brad=ball_dia/2,
            top_hi=neck_top_hi,
            rod=make_rod,
            screw_dia=ball_screw,
            screw_len=ball_screw_len){
  neck_round_rad=brad/2;
  top_rad=brad*2/3;
    //echo("top_rad", top_rad);
  ypos=sqrt(pow(brad+neck_round_rad, 2)-pow(brad/2+neck_round_rad, 2));
    //echo("ypos", ypos);
  rotate_extrude()
  difference(){
    union(){
      difference(){
        circle(r=brad);
        translate([0, -brad*9/10])
          square([brad*2, brad/5], true);
      }//d
      difference(){
        translate([0, brad*0])
          square([top_rad*2/2, brad+neck_round_rad+top_hi]);
        translate([brad/2+neck_round_rad, ypos])
          circle(r=neck_round_rad);
      }//d
    }//u
    translate([-brad, -brad])
      square([brad, (brad+neck_round_rad+top_hi)*2]);
  }//d
  if (rod==1)
    translate([0, 0, brad+neck_round_rad+top_hi])
      iso_thread(m=screw_dia, l=screw_len, cap=1);
}//m
//

module ball_nut(brad=ball_dia/2,
                hi=ball_nut_thk,
                screw_dia=ball_screw,
                tol=ball_nut_tol){
  ep=0.002;
  wall=2.8;
  nrad=screw_dia/2+wall;
  difference(){
    knob(hi, nrad);
    translate([0, 0, -ep])
      iso_thread(m=screw_dia, l=hi+ep*2, cap=1, t=tol);
  }//d
}//m
//

module socket(brad=ball_dia/2,
              hi=socket_hi,
              gap=part_gap,
              plate=make_plate){
  ep=0.001;
  grad=brad+gap;
  max_hi=max(hi, grad+2);
    echo("socket_hi",max_hi);
  screw_dia=screw_size(brad*2);
    echo("socket screw_dia",screw_dia);
  difference(){
    union(){
      translate([0, 0, -max_hi])
        iso_thread(m=screw_dia, l=max_hi, cap=1, t=0);
      if (plate==1)
        translate([0, 0, -max_hi])
          plate();    
    }//u
    translate([0, 0, ep])
      rotate_extrude()
      difference(){
        circle(r=grad);
        translate([0, grad])
          square(grad*2, true);
        translate([-grad, 0])
          square(grad*2, true);
      }//d
  }//d
}//m
//

module socket_nut(brad=ball_dia/2,
                  gap=part_gap,
                  tol=socket_nut_tol){
  ep=0.001;
  wall=2;
  grad=brad+gap;
  screw_dia=screw_size(brad*2);
    //echo("screw_dia",screw_dia);
  nrad=screw_dia/2+wall;
  hi=grad*1.5;
  difference(){
    knob(hi, nrad);
    translate([0, 0, hi-1])
      linear_extrude(1+ep)
      circle(r=grad*0.9);
    translate([0, 0, grad])
      rotate_extrude()
      difference(){
        circle(r=grad);
        translate([-grad, 0])
          square(grad*2, true);
      }//d
    translate([0, 0, -ep])
      iso_thread(m=screw_dia, l=hi*0.8, cap=1, t=tol);
  }//d
}//m
//

module knob(hi=8, rad=10, n=8){
  fin=min(hi/8, rad/6);
  difference(){
      linear_extrude(hi)
      union(){
        circle(r=rad);
        for (i=[0:n-1])
          rotate([0, 0, i*360/n])
          translate([rad+fin, 0])
            rotate([0, 0, 135])
            square(fin*2);
      }//u
      translate([0, 0, hi])
        rotate_extrude()
        translate([rad+fin, 0])
          rotate([0, 0, 135])
          square(fin*2.5, true);
    }//d
}//m
//

module plate(){
  $fn=smooth/2;
  c2c_xp=plate_xs-screw_hole_offset*2-screw_hole_dia/2;
  c2c_yp=plate_ys-screw_hole_offset*2-screw_hole_dia/2;
  translate([0, 0, -plate_zs])
  linear_extrude(plate_zs)
  difference(){
    hull(){
      for(i=[c2c_xp/2, -c2c_xp/2])
      for(j=[c2c_yp/2, -c2c_yp/2])
        translate([i, j])
          circle(r=screw_hole_dia/2+screw_hole_offset);
    }//h
    for(i=[c2c_xp/2, -c2c_xp/2])
    for(j=[c2c_yp/2, -c2c_yp/2])
      translate([i, j])
        circle(r=screw_hole_dia/2);
  }//d
}//m
//

function screw_size(ball_size) //Return socket thread size
=lookup(ball_size,[
[8,12],
[10,14],
[12,18],
[14,20],
[16,22],
[18,24],
[20,27],
[22,27],
[24,30],
[27,33],
[30,36],
[33,39],
[36,48],
[39,48],
[42,52],
]);

// The below part get from
// https://www.thingiverse.com/thing:2158656
// Thank for the code

//*****************************************************//
// ISO screw thread modules by RevK @TheRealRevK
// https://en.wikipedia.org/wiki/ISO_metric_screw_thread
// Usable as a library - provides standard nut and both as well as arbitrary thread sections

/* [ Global ] */

// Length of bolt
//l=10;

// Size
//m=5; //[1.4,1.6,2,2.5,3,4,5,6,7,8,10,12,14,16,18,20,22,24,27,30,33,36]

// Clearance for printer tollerance for nut
//t=0.2;

// Steps
//$fn=48;

// Examples
//iso_thread(m=5, l=10, cap=1);
//iso_thread(l=5);

function iso_hex_size(m) // Return standard hex nut size for m value
=lookup(m,[
[1.4,3],
[1.6,3.2],
[2,4],
[2.5,5],
[3,6],
[3.5,6],
[4,7],
[5,8],
[6,10],
[7,11],
[8,13],
[10,17],
[12,19],
[14,22],
[16,24],
[18,27],
[20,30],
[22,32],
[24,36],
[27,41],
[30,46],
[33,50],
[36,55],
]);
 
function iso_pitch_course(m) // Return standard course pitch for m value
=lookup(m,[
[1,0.25],
[1.2,0.25],
[1.4,0.3],
[1.6,0.35],
[1.8,0.35],
[2,0.4],
[2.5,0.45],
[3,0.5],
[3.5,0.6],
[4,0.7],
[5,0.8],
[6,1],
[7,1],
[8,1.25],
[10,1.5],
[12,1.75],
[14,2],
[16,2],
[18,2.5],
[20,2.5],
[22,2.5],
[24,3],
[27,3],
[30,3.5],
[33,3.5],
[36,4],
[39,4],
[42,4.5],
[48,5],
[52,5],
[56,5.5],
[60,5.5],
[62,6]
]);

module iso_thread(  // Generate ISO / UTS thread, centred 0,0,
  m=20,  // M size, mm, (outer diameter)
  p=0,   // Pitch, mm (0 for standard coarse pitch)
  l=50,  // length
  t=0,   // tolerance to add (for internal thread)
  cap=1, // capped ends. If uncapped, length is half a turn more top and bottom
)
{
  p=(p?p:iso_pitch_course(m));
  //echo("tdia",m); // add echo to display diameter
  //echo("pitch",p); // add echo to display pitch
  //echo("tol",t); // add echo to display tolerance
  r=m/2; // radius
  h=sqrt(3)/2*p; // height of thread
  fn=round($fn?$fn:36); // number of points per turn
  fa=360/fn; // angle of each point
  n=max(fn+1,round(fn*(l+(cap?p*2:0))/p)+1); // total number of points
  q=min(p/16,t); // thread width adjust
  p1=[for(i=[0:1:n-1])[cos(i*fa)*(r-5*h/8+t),sin(i*fa)*(r-5*h/8+t),i*p/fn+q]];
  p2=[for(i=[0:1:n-1])[cos(i*fa)*(r-5*h/8+t),sin(i*fa)*(r-5*h/8+t),i*p/fn+p/4-q]];
  p3=[for(i=[0:1:n-1])[cos(i*fa)*(r+t),sin(i*fa)*(r+t),i*p/fn+p/2+p/8-p/16-q]];
  p4=[for(i=[0:1:n-1])[cos(i*fa)*(r+t),sin(i*fa)*(r+t),i*p/fn+p/2+p/8+p/16+q]];
  p5=[for(i=[0:1:n-1])[cos(i*fa)*(r-5*h/8+t),sin(i*fa)*(r-5*h/8+t),i*p/fn+p+q]];
  p6=[[0,0,p/2],[0,0,n*p/fn+p/2]];

  t1=[for(i=[0:1:fn-1])[n*5,i,i+1]];
  t2=[[n*5,n,0],[n*5,n*2,n],[n*5,n*3,n*2],[n*5,n*4,n*3]];
  t3=[for(i=[0:1:n-2])[i,i+n,i+1]];
  t4=[for(i=[0:1:n-2])[i+n,i+n+1,i+1]];
  t5=[for(i=[0:1:n-2])[i+n,i+n*2,i+n+1]];
  t6=[for(i=[0:1:n-2])[i+n*2,i+n*2+1,i+n+1]];
  t7=[for(i=[0:1:n-2])[i+n*2,i+n*3,i+n*2+1]];
  t8=[for(i=[0:1:n-2])[i+n*3,i+n*3+1,i+n*2+1]];
  t9=[for(i=[0:1:n-2])[i+n*3,i+n*4,i+n*3+1]];
  t10=[for(i=[0:1:n-2])[i+n*4,i+n*4+1,i+n*3+1]];
  t11=[for(i=[0:1:fn-1])[n*5+1,n*5-i-1,n*5-i-2]];
  t12=[[n*5+1,n*4-1,n*5-1],[n*5+1,n*3-1,n*4-1],[n*5+1,n*2-1,n*3-1],[n*5+1,n-1,n*2-1]];

  intersection()
  {
    translate([0,0,-p/2-(cap?p:0)])
    polyhedron(points=concat(p1,p2,p3,p4,p5,p6),
    faces=concat(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12));
    if(cap)hull()
    { // champhered ends and capped to exact length
      cylinder(r1=r-5*h/8+t,r2=r+t,h=5*h/8*tan(30));
      translate([0,0,l-5*h/8*tan(30)])
      cylinder(r1=r+t,r2=r-5*h/8+t,h=5*h/8*tan(30));
    }
  }
}
//