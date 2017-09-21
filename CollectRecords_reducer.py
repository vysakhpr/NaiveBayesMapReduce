#!/usr/bin/env python

import sys
prevkey=""
buff=""
for line in sys.stdin:
	l=line.rstrip()
	if l:
		parts=l.split(',')
		key=parts[0]
		value=parts[1]
		if prevkey==key:
			buff=buff+","+value
		else:
			if prevkey!="":
				print prevkey+","+buff
			prevkey=key
			buff=value
if prevkey!="":
	print prevkey+","+buff


