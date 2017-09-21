#!/usr/bin/env python

import sys
i=1
for line in sys.stdin:
	print str(i)+"\t"+line 
	i=i+1