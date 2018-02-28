from pdb_structure import *
import sys
from contextlib import contextmanager
import sys, os

# QAD script. Clean up pdb manually and use ~/Documents/contact-atlas/tables/uniprot_to_gpcrdb/*.json as second argument
if len(sys.argv) != 3:
  print("Usage: " + sys.argv[0] + " struc.pdb gpcrdb.json")
  exit(1)


@contextmanager
def suppress_stdout():
    with open(os.devnull, "w") as devnull:
        old_stdout = sys.stdout
        sys.stdout = devnull
        try:  
            yield
        finally:
            sys.stdout = old_stdout

m = PDBFile(sys.argv[1]).models[0]
with suppress_stdout():
  m.clean_alt_conformations('A')

cas = [a for a in m.atoms if a.name=='CA']
resis = [[a.chain, a.resn, str(a.resi)] for a in cas]

import json
with open(sys.argv[2]) as fp:
  gpcrdb_data = json.load(fp)

labels = []
for chain, resn, resi in resis:
  for key in gpcrdb_data:
    if gpcrdb_data[key][0] == resi:
      labels.append(":".join([chain,resn,resi]) + "\t" + str(key))

print("\n".join(labels))
