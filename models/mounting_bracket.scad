// Parametric Mounting Bracket
// Designed for AI-training CAD benchmark tasks

bracket_length = 100;
bracket_width = 40;
bracket_thickness = 8;
hole_diameter = 8;
hole_spacing = 70;
corner_radius = 4;

module rounded_plate(length, width, thickness, radius) {
    linear_extrude(height = thickness)
        offset(r = radius)
            offset(delta = -radius)
                square([length, width], center = true);
}

module mounting_holes(spacing, diameter, thickness) {
    translate([-spacing / 2, 0, -1])
        cylinder(h = thickness + 2, d = diameter, $fn = 64);

    translate([spacing / 2, 0, -1])
        cylinder(h = thickness + 2, d = diameter, $fn = 64);
}

difference() {
    rounded_plate(bracket_length, bracket_width, bracket_thickness, corner_radius);
    mounting_holes(hole_spacing, hole_diameter, bracket_thickness);
}
