#!/usr/bin/env python

import sys
for line in sys.stdin:
	if line.startswith("X="):
		begin_index=2
		end_index=line.index('^')
		word=line[begin_index:end_index]
		parts=line.replace("X="+word,"w").split(',')
		parts[0]="C["+parts[0].rstrip()+"]"
		print str(word)+","+'='.join(parts)
		

