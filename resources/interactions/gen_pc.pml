delete *
fetch 5xnd, async=0
set state, 14

remove !resi 58+97
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
     0.851376474,    0.279613823,    0.443807930,\
    -0.379326254,    0.912566006,    0.152729914,\
    -0.362300277,   -0.298384458,    0.883009136,\
     0.000008248,   -0.000019809,  -18.203300476,\
    -1.856850624,   -6.650670052,   20.142860413,\
    14.614892960,   21.802282333,  -20.000000000 )

#label resn PHE and name CG+CE1+CE2, "A"
label name NZ, 'C'
set label_position, (1.3, 0.2, 0), name Nz

pseudoatom Ac, resn PHE and name CG+CE1+CE2
pseudoatom Ac_up, resn PHE and name CG+CE1+CE2
alter_state 14, Ac_up, x = -0.30774057
alter_state 14, Ac_up, y = -7.34049881
alter_state 14, Ac_up, z = 21.0503812
label Ac, "A"
set label_position, (0.2, -1, 0), Ac
label Ac_up, "n"
set label_position, (-1, -0.5, 0), Ac_up
hide nonbonded

distance dist, name NZ, Ac
hide labels, dist
set dash_radius, 0.09, dist

angle ang, name NZ, Ac, Ac_up
hide labels, ang
set angle_size, 0.4
color splitpea, ang

ray 500, 400
png fig_pc.png
