#!/usr/bin/env python

import sys
months=["january","february", "march","april","may","june","july","august","september","october","november","december"]
for line in sys.stdin:
	line=line.rstrip()
	if "\t" in line:
		parts=line.split("\t")
		words=parts[2].split(" ")
		idno=parts[0]
		for word in words:
			print str(word)+","+"~ctr to id"+str(idno)
	else:
		print line

