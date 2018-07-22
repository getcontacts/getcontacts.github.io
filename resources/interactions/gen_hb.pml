delete *
fetch 5xnd, async=0
set state, 3

remove !resi 63+56

bg_color white
color gray80, elem C
show sticks
set stick_radius, 0.15
set dash_gap, 0.2
set ray_shadow, 0
set label_size, 40

set_view (\
     0.923731923,   -0.339396060,   -0.177565008,\
     0.242948651,    0.877527237,   -0.413425058,\
     0.296131432,    0.338755190,    0.893056810,\
    -0.000024577,    0.000002588,  -18.393295288,\
    -2.401509285,   -1.311617851,   14.027775764,\
    15.853686333,   20.933629990,  -20.000000000 )

label name OE1, 'A'
label name OG, 'D'
label name HG, 'H'
set label_position, (0, 1.1, 0)
set label_position, (0, -1.1, 0), name OG

distance dist, name OE1, name OG
hide labels, dist

angle ang, name OE1, name HG, name OG
hide labels, ang
set angle_size, 0.4
color splitpea, ang

ray 500, 400
png fig_hb.png
