// Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
// Version:      0.0.1

/* -----------------------------------------------------------------------------

This file is an OpenSCAD script for roll cage for a radio controled car.

OpenSCAD is an open source constructive solid geometry (CSG)
computer aided design (CAD) modeling tool.
Unlike most CAD tools,
OpenSCAD is not an interactive modeler,
but instead a script-only based modeler that uses its own description language.
It can render output, such as a stereolithography file (STL),
which can be used by a 3D printer to create a physical object.

structural framing
building system
structural system - https://en.wikipedia.org/wiki/Structural_system
hex bar
3-way corner brackets - https://www.amazon.com/Bracket-Connector-Aluminum-Extrusion-Profile/dp/B0794XMPG4
T connector
4-way connector
5-way connector

----------------------------------------------------------------------------- */


/*----------------------- Fixed Dimensional Parameters -----------------------*/

// OpenSCAD stuff
$fn = 64;

// https://www.datametal.com/wp-content/uploads/2018/03/Metric-Tap-and-Clearance-Drill-Sizes.pdf
clearance = 0.2;                   // clearance used for holes, ball joints, etc.

// dimensions of M3 nut & bolt holes
bolt_diameter = 3.0 + clearance;   // diameter of M3 screw holes (3.0 mm)
nut_head = 5.5 + clearance;        // width across bolt head (5.32 to 5.5 mm))
nut_depth = 2.4 + 2 * clearance;   // thickness of a nut (2.15 to 2.4 mm)
nut_flats = 5.4 + clearance;       // width across flats of hex head (5.4 mm))
nut_corners = 6.24 + clearance;    // width across corners of hex head (6.01 to 6.35 mm)

// ball joint

// curvature used for the teeth
triangle_corner_radius = 0.10;


/*-------------------- Parametric Dimensional Parameters ---------------------*/

// dimensions of the segment
seg_length = 40;                   // length of the segment in mm


/*--------------------- Derived Dimensional Parameters -----------------------*/

// https://en.wikipedia.org/wiki/Hexagon
max_radius = 2 * bolt_diameter;     // maximum radius of the hex segment
min_radius = 0.86603 * max_radius;  // minimum radius of the hex segment

slice_cube = 2 * max_radius + 1;    // slice taken out for joint


/*-------------------------- Test & Debug Routines ---------------------------*/

//solid_segment(seg_length, max_radius);
//hollow_sphere(3 * max_radius, 1.5 * max_radius);
//translate([0, 0,  3 * max_radius - 1.5 * max_radius]) rotate([180, 0, 0]) hollow_sphere(3 * max_radius, 1.5 * max_radius);
//cut_slice(0, 0, 0);
//cut_hole(0, 0, 0);
//cut_out(0, 0, 0);
//cut_out(0, 0, 0.5 * slice_cube);
//rotate([0, 0, 180]) cut_out(0, 0, seg_length - 0.5 * slice_cube);
//cut_segment(seg_length, max_radius);
//right_triangle(5, 5, 0.05, 10);
//rotate([0, -90, 180]) right_triangle(1, 1, 0.05, 10);
//N = 36; for (i = [0 : N - 1]) { rotate( [0, i * 360 / N, 0]) rotate([0, -90, 0]) right_triangle(1, 1, 0.05, 10); }
//isosceles_triangle(5, 5, 0.05, 10);
//rotate([90, 0, 0]) isosceles_triangle(1, 1, 0.05, 10);
//N = 36; for (i = [0 : N - 1]) { rotate( [0, 0, i * 360 / N]) rotate([90, 0, 0]) isosceles_triangle(1, 1, 0.05, 10); }
//obtuse_triangle(5, 5, 90 + 45, triangle_corner_radius, 10);
//flat_plate(0.25, 10);
//teeth_plate(0.25, 10, 1, 1, 0.05, 36);
//teeth_plate(0.25, max_radius, 1, 1, 0.05, 36);
//neg_teeth_plate(0.25, max_radius, 1, 1, 0.05, 36);  // make sure to re-render
//teeth_plate(0.25, max_radius, 1, 1, 0.05, 36); translate([0, 0, 2]) neg_teeth_plate(0.25, max_radius, 1, 1, 0.05, 36);  // make sure to re-render
//teeth_plate(0.25, 10, 1, 1, 0.05, 36);
//difference() { pos_teeth_plate(0.25, 10, 1, 1, 0.05, 36); flat_plate(0.25, 10); }  // make sure to re-render
//union() { translate([-(1 + 0.25) / 2, 0, 0.5 * slice_cube]) rotate([0, 90, 0]) pos_teeth_plate(0.25, max_radius, 1, 1, 0.05, 36); translate([-(1 + 0.25) / 2, 0, seg_length - 0.5 * slice_cube]) rotate([0, -90, 180]) neg_teeth_plate(0.25, max_radius, 1, 1, 0.05, 36); }  // make sure to re-render
//trim_seg(seg_length, max_radius);

//3_way_corner(seg_length, max_radius);


//solid_hub(6, max_radius);
//ball(slice_cube, min_radius + clearance / 2, max_radius);
//difference() { solid_hub(6, max_radius); translate([0, 1.4 * slice_cube, 0]) rotate([90, 0, 0]) ball(slice_cube, min_radius, max_radius); translate([0, 2.5 * 5, 0]) rotate([90, 0, 0]) cylinder(h = 7, r1 = max_radius, r2 = 0.5 * min_radius, center = true); }
//ball_joint_hub(6, min_radius, max_radius, top = false);


/*------------------------------ Main Execution ------------------------------*/


//3_way_corner(seg_length, max_radius);
//teeth_segment(seg_length, max_radius);
//teeth_segment(60, 6);
//translate([15, 0, 0]) teeth_segment(seg_length, max_radius);

//ball(seg_length, min_radius, max_radius);
//ball_segment(seg_length, slice_cube, min_radius, max_radius);


//solid_segment(seg_length, max_radius);
//solid_hub(6, max_radius);

//translate([0, 0, min_radius]) rotate([90, 0, 0]) ball_segment(2 * seg_length, slice_cube, min_radius, max_radius);
//translate([0, 0, min_radius]) rotate([90, 0, 0]) teeth_segment(seg_length, max_radius);

//translate([0, 1.4 * slice_cube, 0]) rotate([90, 0, 0]) ball(slice_cube, min_radius + clearance / 2, max_radius);
//translate([0, 2.5 * 5, 0]) rotate([90, 0, 0]) cylinder(h = 6.5, r1 =  1.2 * max_radius, r2 = 0.2 * min_radius, center = true);

ball_joint_hub(6, min_radius, max_radius);



module ball_joint_hub(no_balls, min_r, max_r, top = false) {

    X = 2;
    side = 4 * X * max_r;

    if (top == false) {
        rotate([180, 0, 0]) difference() {
            solid_hub(no_balls, max_r);

            // cut the solid_hub in half
            translate([0, 0, 0.5 * side]) cube([side, side, side], center = true);

            // drill the hole for the bolt & nut
            translate([0, 0, -0.1 * min_r]) rotate([0, -90, 0]) cut_hole(0, 0, 0);

            // drill out the ball joints, make the ball cavity slightly larger
            N = 6;
            for (i = [0 : N - 1]) {
                rotate([0, 0, i * 360 / N]) {
                    translate([0, 1.35 * slice_cube, 0]) rotate([90, 0, 0]) ball(slice_cube, min_r + clearance / 2, max_r);
                    translate([0, 2.5 * 5, 0]) rotate([90, 0, 0]) cylinder(h = 6.5, r1 =  1.2 * max_r, r2 = 0.2 * min_r, center = true);
                }
            }
        }
    } else {
    }

}


// create a solid hub without any holes for ball joints
module solid_hub(no_balls, max_r) {

    side = 1.5 * max_r;

   intersection() {
        cube([4 * side, 4 * side, 2.5 * min_radius], true);
        hull() rotate_extrude(angle = 360, convexity = 10, $fn = no_balls)
            translate([side, 0, 0]) rotate([0, 0, 30]) circle(r = side, $fn = 6);
    }

}


module ball_segment(length, trans, min_r, max_r) {

    difference() {
        solid_segment(length, max_r);

        // cut away top & bottom of segment to make room for ball & peg
        translate([0, 0, 0.5 * trans]) cube([trans , trans , trans], center = true);
        translate([0, 0, length - 0.5 * trans]) cube([trans , trans , trans], center = true);
    }

    // add ball & peg to top and bottom
    translate([0, 0, trans]) rotate([180, 0, 0]) ball(trans, min_r, max_r);
    translate([0, 0, length - trans]) rotate([0, 0, 0]) ball(trans, min_r, max_r);

}


module ball(trans, min_r, max_r) {

    // sphere to form the ball joint
    translate([0, 0, trans - 0.75 * min_r]) sphere(r = 0.75 * min_r);

    // peg attached to the ball joint
    translate([0, 0, -1]) solid_segment(trans - 0.75 * min_r, 0.5 * min_r);

    // transition from the peb to the segment
    hull() {
        translate([0, 0,  -1]) solid_segment(1, max_r);
        translate([0, 0, 0.1 * trans]) solid_segment(1, 0.5 * min_r);
    }

}



/*------------------------------ Main Modules --------------------------------*/


// Create a solid hex segment starting at the origin and running vertically along the z-axis.
// This is the primitive for making many HexBar objects.
module solid_segment(length, radius) {

    cylinder(h = length, r = radius, center = false, $fn = 6);

}


// Create a hex segment with notch and drill holes on both ends. Object starts =
// at the origin and running vertically along the z-axis.
module cut_segment(length, radius) {

    difference() {
        solid_segment(length, radius);

        // at top, cut the notch and drill the holes
        cut_end_of_segment(length, radius, top = true);

        // at bottom, cut the notch and drill the holes
        cut_end_of_segment(length, radius, top = false);
    }

}


// Create a hex segment with notch, drill holes, and teeth on both ends.
// Object starts at the origin and running vertically along the z-axis.
module teeth_segment(length, radius) {

    tooth_height = 1;
    plate_thickness = 0.25;
    number_of_teeth = 36;
    total_thickness = tooth_height + plate_thickness;
    embed = total_thickness / 2;       // distance to embed tooth plate

    difference() {
        union() {
            difference() {
                cut_segment(length, radius);

                translate([-embed, 0, 0.5 * slice_cube]) rotate([0, 90, 0])
                    flat_plate(total_thickness, max_radius);

                translate([-embed, 0, length - 0.5 * slice_cube]) rotate([0, 90, 0])
                    flat_plate(total_thickness, radius);
            }

            translate([-embed, 0, 0.5 * slice_cube]) rotate([0, 90, 0])
                pos_teeth_plate(plate_thickness, radius, 1, 1, 0.05, number_of_teeth);

            translate([-embed, 0, length - 0.5 * slice_cube]) rotate([0, -90, 180])
                neg_teeth_plate(plate_thickness, radius, 1, 1, 0.05, number_of_teeth);
        }

        trim_seg(length, radius);

        cut_hole(0, 0, 0.5 * slice_cube);
        cut_hole(0, 0, length - 0.5 * slice_cube);

    }

}


/*--------------------------- Supporting Modules -----------------------------*/


// Object used to cut the notch, drill bolt holes, and round the ends
// on a solid hex segment running vertically along the z-axis.
// You must choose top or bottom of the hex segment.
module cut_end_of_segment(length, radius, top = false) {

    if (top == false) {
        // cut the notch and drill the holes
        cut_out(0, 0, 0.5 * slice_cube);

        // round the ends of the segment
        translate([0, 0,  3 * max_radius - 1.5 * max_radius])
            rotate([180, 0, 0]) hollow_sphere(3 * max_radius, 1.5 * max_radius);
    } else {
        // cut the notch and drill the holes
        rotate([0, 0, 180]) cut_out(0, 0, length - 0.5 * slice_cube);

        // round the ends of the segment
        translate([0, 0, length - (3 * max_radius - 1.5 * max_radius)])
            hollow_sphere(3 * max_radius, 1.5 * max_radius);
    }

}


// Create an object to cut the teeth on the end of segment after it has been notched.
// You must choose positive or negative teeth on top or bottom of the hex segment.
module add_teeth_end_of_segment(length, radius, top = false, positive = true) {

    if (positive == true) {
    } else {
    }

}


// hollowed out half-sphere
module hollow_sphere(outer_r, inner_r) {

    difference() {
        sphere(r = outer_r);
        sphere(r = inner_r);
        translate([0, 0, -2 * max_radius]) cube(size = 2 * outer_r, center = true);
    }

}


// 3-way corner
module 3_way_corner(length, radius) {

    difference() {
        union() {
            // segment along z-axis
            solid_segment(length, radius);

            // segment along the x-axis
            rotate([90, 0, 90]) solid_segment(length, radius);

            // segment along the y-axis
            rotate([-90, 0, 0]) solid_segment(length, radius);

            // fill void in corner
            translate([0, 0, -min_radius]) solid_segment(radius, radius);
        }
        translate([0, -min_radius, -max_radius]) rotate([0, 0, 180])
            obtuse_triangle(max_radius, max_radius, 90 + 80, triangle_corner_radius, 2 * max_radius);
    }

}


// 6-way corner
module 6_way_corner(length, radius) {

    3_way_corner(length, radius);
    rotate([180, 0, -90]) 3_way_corner(length, radius);

}

// cut out on the end of the segment
module cut_out(x_trans, y_trans, z_trans) {

        cut_slice(x_trans, y_trans, z_trans);
        cut_hole(x_trans, y_trans, z_trans);

}


module cut_slice(x_trans, y_trans, z_trans) {
    translate([x_trans, y_trans, z_trans])
        translate([0.5 * slice_cube, 0, 0]) cube([slice_cube , slice_cube , slice_cube], center = true);
}


module cut_hole(x_trans, y_trans, z_trans) {

    translate([x_trans, y_trans, z_trans]) {
        translate([-slice_cube - max_radius + nut_depth, 0, 0]) rotate([0, 90, 0])
            cylinder(h = slice_cube, r = 0.5 * nut_corners, center = false, $fn = 6);

        translate([-0.5 * slice_cube, 0, 0]) rotate([0, 90, 0])
            cylinder(h = slice_cube, r = 0.5 * bolt_diameter, center = false);
    }

}


// Object used to trim off any objects hanging over the segment.  This is primarily used for trimming away the over hang of the teeth plate.
module trim_seg(length, radius) {

    delta = 1;      // extra length

    difference() {
    hull() {
        cube([slice_cube , slice_cube , slice_cube], center = true);
        translate([0, 0, length]) cube([slice_cube , slice_cube , slice_cube], center = true);
    }

    translate([0, 0, - (slice_cube + delta) / 2]) solid_segment(length + slice_cube + delta, radius);
    }

}


// create a right triangle with rounded vertices, corner_radius must be > zero but very small
module right_triangle(side1, side2, corner_radius, triangle_length) {

    translate([corner_radius, corner_radius, 0]) hull() {
        cylinder(r = corner_radius, h = triangle_length);
        translate([side1 - 2 * corner_radius, 0, 0]) cylinder(r = corner_radius, h = triangle_length);
        translate([0, side2 - 2 * corner_radius, 0]) cylinder(r = corner_radius, h = triangle_length);
    }

}


module isosceles_triangle(base, height, corner_radius, triangle_length) {

    translate([0, corner_radius, 0]) hull() {
        translate([0, height - 2 * corner_radius, 0]) cylinder(r = corner_radius, h = triangle_length);
        translate([base / 2 - 2 * corner_radius, 0, 0]) cylinder(r = corner_radius, h = triangle_length);
        translate([-(base / 2 - 2 * corner_radius), 0, 0]) cylinder(r = corner_radius, h = triangle_length);
    }

}


// obtuse triangle has one obtuse angle (greater than 90°)
module obtuse_triangle(base, height, obtuse_ang, corner_radius, triangle_length) {

    translate([0, corner_radius, 0]) hull() {
        cylinder(r = corner_radius, h = triangle_length);   // location of obtuse angle
        translate([base - 2 * corner_radius, 0, 0]) cylinder(r = corner_radius, h = triangle_length);
        translate([-(height / tan(180 - obtuse_ang)), height - 2 * corner_radius, 0]) cylinder(r = corner_radius, h = triangle_length);
    }

}


// flat, circular plate used to hold the teeth
module flat_plate(plate_thickness, plate_radius) {
    cylinder(r = plate_radius, h = plate_thickness);
}


// create a circular plate with positive teeth on it.
module pos_teeth_plate(plate_thickness, plate_radius, teeth_base, teeth_height, corner_radius, no_teeth) {

    translate([0, 0, plate_thickness]) {
        // create the multiple teeth, equidistant around a circle
        N = no_teeth;
        for (i = [0 : N - 1]) {
            rotate( [0, 0, i * 360 / N]) rotate([90, 0, 0]) isosceles_triangle(teeth_base, teeth_height, corner_radius, plate_radius);
        }
    }

    // create the plate holding the teeth
    flat_plate(plate_thickness, plate_radius);

}


// create a circular plate with negative teeth on it.
module neg_teeth_plate(plate_thickness, plate_radius, teeth_base, teeth_height, corner_radius, no_teeth) {

    difference() {
        // create the plate to receiver the negative teeth imprint
        cylinder(r = plate_radius, h = 2 * plate_thickness + teeth_height);

        pos_teeth_plate(plate_thickness, plate_radius, teeth_base, teeth_height, corner_radius, no_teeth);

        // create the plate holding the teeth
        flat_plate(plate_thickness, plate_radius);

    }

}

