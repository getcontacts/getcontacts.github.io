delete *
fetch 1crn, async=0
h_add

remove !(resi 5+9 or (resi 4 and name C+CA) or (resi 6 and name N+CA) or (resi 8 and name C+CA) or (resi 10 and name N+CA))

bg_color white
color gray80, elem C
show sticks
set stick_radius, 0.15
set dash_gap, 0.2
set ray_shadow, 0
set label_size, 40

set_view (\
     0.317921072,   -0.414445490,   -0.852737784,\
     0.565501273,    0.804796219,   -0.180312634,\
     0.761011541,   -0.424899101,    0.490228176,\
     0.000067750,   -0.000016557,  -17.122495651,\
     7.587450027,    7.212995052,   12.521244049,\
    14.217803001,   20.022911072,  -20.000000000 )

label resi 5 and name CG, 'B'
set label_position, (1.3, 0.7, 0), name CG

label resi 9 and name CB, 'A'
set label_position, (-0.5, -1.3, 0), name CB

distance dist, resi 5 and name CG, resi 9 and name CB
hide labels, dist

ray 500, 300
png fig_hp.png
