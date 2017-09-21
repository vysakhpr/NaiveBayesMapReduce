#!/usr/bin/env python

import sys
prevkey=""
buff=""
i=0
for line in sys.stdin:
	l=line.rstrip()
	if l:
		parts=l.split(',',1)
		key=parts[0]
		value=parts[1]
		if value.startswith("C["):
			prevkey=key
			buff=value
		else:
			if prevkey==key:
				value_parts=value.split("id")
				idno=value_parts[1].rstrip()
			 	print str(idno)+",~ctr for "+str(key)+" is "+buff



