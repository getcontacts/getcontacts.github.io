delete *
fetch 1crn, async=0
h_add

remove !(resi 15+18 or (resi 14 and name C+CA) or (resi 16 and name N+CA) or (resi 17 and name C+CA) or (resi 19 and name N+CA))

bg_color white
color gray80, elem C
show sticks
set stick_radius, 0.15
set dash_gap, 0.2
set ray_shadow, 0
set label_size, 40

set_view (\
     0.592036128,   -0.333665192,   -0.733594894,\
    -0.284917712,   -0.938137650,    0.196760729,\
    -0.753867686,    0.092527159,   -0.650481701,\
     0.000008490,    0.000008557,  -15.588832855,\
     3.912691593,    1.991307735,   -0.427078843,\
    12.819745064,   18.365306854,  -20.000000000 )

label resi 15 and name O, 'A'
set label_position, (0.3, -1.1, 0), name O

label resi 18 and name CB, 'B'
set label_position, (-1, -1.2, 0), name CB

distance dist, resi 15 and name O, resi 18 and name CB
hide labels, dist

ray 500, 300
png fig_vdw.png
