delete *
fetch 1FQJ, async=0

remove !(resi 127+136 and chain D)
remove hydro
h_add

bg_color white
color gray80, elem C
show sticks
set stick_radius, 0.15
set dash_gap, 0.2
set ray_shadow, 0
set label_size, 40

pseudoatom A1, resn TRP and name CD2+CZ2+CZ3
label A1, "A1"
set label_position, (0.35,-1.05,0), A1

pseudoatom A2, resn PHE and name CG+CE1+CE2
label A2, "A2"
set label_position, (1.3,-0.2,0), A2

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
set label_position, (-0.2,1.2,0), n1

phe_n = np.cross(phe_coords[2] - phe_coords[0], phe_coords[1] - phe_coords[0])
phe_n = 2 * phe_n / norm(phe_n)
phe_n = np.array(cmd.get_coords('A2')[0]) + phe_n
phe_n = phe_n.tolist()
cmd.pseudoatom('n2', pos=phe_n) 
label n2, "n2"
set label_position, (0.2,-1.1,0), n2


run cgo_arrow.py
cgo_arrow A1, n1, radius=0.1, hradius=0.2, color=splitpea
cgo_arrow A2, n2, radius=0.1, hradius=0.2, color=splitpea

hide nonbonded

set_view (\
    -0.189826131,    0.162470013,   -0.968281806,\
     0.621577203,    0.783292115,    0.009575458,\
     0.760005236,   -0.600041747,   -0.249674499,\
    -0.000340015,    0.000413332,  -23.083896637,\
    73.020477295,   56.380809784,  143.918106079,\
    17.611827850,   28.732810974,  -20.000000000 )

distance dist, A1, A2
hide labels, dist
set dash_radius, 0.09, dist

ray 500, 300
png fig_ts.png
