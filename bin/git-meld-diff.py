#!/usr/bin/python

import sys
import os

if len(sys.argv) < 5:
    sys.stdout.write("Invalid parameters\n")
    sys.exit(1)

filename_1 = sys.argv[2]
filename_2 = sys.argv[5]
os.system('meld "%s" "%s"' % (sys.argv[2], sys.argv[5]))

