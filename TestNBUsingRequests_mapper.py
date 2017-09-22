#!/usr/bin/env python

import sys

for line in sys.stdin:
	line=line.rstrip()
	if line:
		if "\t" in line:
			print line.replace("\t",",",1)
		else: 
			print line

