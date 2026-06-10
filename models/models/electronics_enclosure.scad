// Parametric Electronics Enclosure
// Designed for AI-training CAD benchmark tasks

case_length = 120;
case_width = 70;
case_height = 35;
wall_thickness = 3;
corner_radius = 5;

lid_thickness = 3;
screw_diameter = 3;
screw_offset = 10;

module rounded_box(length, width, height, radius) {
    linear_extrude(height = height)
        offset(r = radius)
            offset(delta = -radius)
                square([length, width], center = true);
}

module outer_shell() {
    rounded_box(case_length, case_width, case_height, corner_radius);
}

module inner_cutout() {
    translate([0, 0, wall_thickness])
        rounded_box(
            case_length - 2 * wall_thickness,
            case_width - 2 * wall_thickness,
            case_height,
            corner_radius - 1
        );
}

module screw_posts() {
    for (x = [-case_length / 2 + screw_offset, case_length / 2 - screw_offset]) {
        for (y = [-case_width / 2 + screw_offset, case_width / 2 - screw_offset]) {
            translate([x, y, 0])
                difference() {
                    cylinder(h = case_height - lid_thickness, d = 8, $fn = 32);
                    translate([0, 0, -1])
                        cylinder(h = case_height + 2, d = screw_diameter, $fn = 32);
                }
        }
    }
}

difference() {
    union() {
        outer_shell();
        screw_posts();
    }

    inner_cutout();
}
