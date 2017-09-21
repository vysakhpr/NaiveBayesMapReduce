#!/usr/bin/env python

import sys

for line in sys.stdin:
	line=line.rstrip()
	if line:
		if line.startswith("Y="):
			print line

