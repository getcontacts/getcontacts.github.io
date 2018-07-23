delete *
fetch 4AMI, async=0

remove !(resi 182+201 and chain A)
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
    -0.711777925,    0.396150678,   -0.580022693,\
     0.628528833,    0.727850080,   -0.274167180,\
     0.313562602,   -0.559713304,   -0.767063856,\
    -0.000148994,    0.000709137,  -22.452455521,\
   -21.192438126,  -18.193990707,   29.932056427,\
    17.185974121,   27.701322556,  -20.000000000 )

#label resn PHE and name CG+CE1+CE2, "A"
#label name NZ, 'C'
#set label_position, (1.3, 0.2, 0), name Nz

pseudoatom A1, resn TRP and name CD2+CZ2+CZ3
label A1, "A1"
set label_position, (0.8,-0.3,0), A1

pseudoatom A2, resn PHE and name CG+CE1+CE2
label A2, "A2"
set label_position, (1,-0.2,0), A2

import numpy as np
from numpy.linalg import norm
trp_coords = np.array(cmd.get_coords('resn TRP and name CD2+CZ2+CZ3'))
print trp_coords
phe_coords = np.array(cmd.get_coords('resn PHE and name CG+CE1+CE2'))

trp_n = np.cross(trp_coords[1] - trp_coords[0], trp_coords[2] - trp_coords[0])
trp_n = 2 * trp_n / norm(trp_n)
trp_n = np.array(cmd.get_coords('A1')[0]) + trp_n
trp_n = trp_n.tolist()
cmd.pseudoatom('n1', pos=trp_n) 
label n1, "n1"
set label_position, (0,0.8,0), n1

phe_n = np.cross(phe_coords[2] - phe_coords[0], phe_coords[1] - phe_coords[0])
phe_n = 2 * phe_n / norm(phe_n)
phe_n = np.array(cmd.get_coords('A2')[0]) + phe_n
phe_n = phe_n.tolist()
cmd.pseudoatom('n2', pos=phe_n) 
label n2, "n2"
set label_position, (1.2,0,0), n2


run cgo_arrow.py
cgo_arrow A1, n1, radius=0.1, hradius=0.2, color=splitpea
cgo_arrow A2, n2, radius=0.1, hradius=0.2, color=splitpea

hide nonbonded

set_view (\
    -0.747356832,    0.112040050,   -0.654899538,\
     0.572994053,    0.607661188,   -0.549912632,\
     0.336348981,   -0.786243379,   -0.518339813,\
    -0.000057074,    0.000648018,  -23.737586975,\
   -21.032115936,  -17.529422760,   30.188882828,\
    19.354032516,   28.050786972,  -20.000000000 )

distance dist, A1, A2
hide labels, dist
set dash_radius, 0.09, dist

ray 500, 300
png fig_ps.png
