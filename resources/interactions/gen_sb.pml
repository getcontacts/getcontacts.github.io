delete *
fetch 5xnd, async=0
set state, 3

remove !resi 76+82

remove hydro
h_add
bg_color white
color gray80, elem C
show sticks
set stick_radius, 0.15
set dash_gap, 0.2
set ray_shadow, 0
set label_size, 40

set_view (\
     0.476604491,    0.290117353,   -0.829867721,\
     0.654999614,   -0.746809959,    0.115098499,\
    -0.586360693,   -0.598418713,   -0.545959711,\
     0.000059681,   -0.000028055,  -21.839725494,\
   -13.199065208,   -7.766305923,    2.472116470,\
    19.038965225,   24.641054153,  -20.000000000 )

label name OE1, 'A'
label name NH1, 'C'
set label_position, (-1, 1.2, 0)

distance SB, name OE1, name NH1
hide labels, SB

ray 500, 300
png fig_sb.png
