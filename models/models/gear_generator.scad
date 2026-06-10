// Parametric Spur Gear Generator
// Designed for AI-training CAD benchmark tasks

teeth = 24;
outer_radius = 40;
root_radius = 32;
thickness = 8;
bore_diameter = 10;
tooth_depth = outer_radius - root_radius;

module gear_body() {
    cylinder(h = thickness, r = root_radius, $fn = 96);
}

module gear_tooth(angle) {
    rotate([0, 0, angle])
        translate([root_radius, -tooth_depth / 2, 0])
            cube([tooth_depth, tooth_depth, thickness]);
}

module teeth_ring() {
    for (i = [0 : teeth - 1]) {
        gear_tooth(i * 360 / teeth);
    }
}

difference() {
    union() {
        gear_body();
        teeth_ring();
    }

    translate([0, 0, -1])
        cylinder(h = thickness + 2, d = bore_diameter, $fn = 64);
}
