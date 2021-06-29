#!/usr/bin/env python

# Copyright 2021 iAchieved.it LLC
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above 
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES 
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF 
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY 
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION 
# OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

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

images = glob.glob("shapes/*.png")

for f in images:
  p = basename(f)
  img = io.imread(f, as_gray=True)
  img = img.reshape(-1)
  shapes['data'].append(img)

  if p.startswith("circle"):
    shapes['target'].append(0)
  elif p.startswith("triangle"):
    shapes['target'].append(1)
  elif p.startswith("rectangle"):
    shapes['target'].append(2)
  elif p.startswith("square"):
    shapes['target'].append(3)

shapes['data']   = np.array(shapes['data'])/255.0
shapes['target'] = np.array(shapes['target'])

f = open("shapes.dat", "wb")
pickle.dump(shapes, f)
