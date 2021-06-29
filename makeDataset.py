#!/usr/bin/env python

import glob
import numpy as np
import pickle

from skimage import io
from os.path import basename

shapes = {
        'DESCR':  'shapes',
        'COL_NAMES':  ['label', 'data'],
        'data':  [],
        'target': []
}

images = glob.glob("circles/*.png") + glob.glob("triangles/*.png")

for f in images:
  p = basename(f)
  img = io.imread(f, as_gray=True)
  img = img.reshape(-1)
  shapes['data'].append(img)

  if p.startswith("circle"):
    shapes['target'].append(0)
  elif p.startswith("triangle"):
    shapes['target'].append(1)

shapes['data']   = np.array(shapes['data'])/255.0
shapes['target'] = np.array(shapes['target'])

from numpy.random import permutation
perm = permutation(len(shapes['data']))

shapes['data']   = shapes['data'][perm]
shapes['target'] = shapes['target'][perm]

f = open("shapes.dat", "wb")
pickle.dump(shapes, f)
