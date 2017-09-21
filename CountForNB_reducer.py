#!/usr/bin/env python

import sys
prevkey=""
prevkey_sum=0
for line in sys.stdin:
	event=line.split("+=")[0]
	if prevkey==event:
		prevkey_sum=prevkey_sum+1
	else:
		if prevkey!="":
			print str(prevkey)+","+str(prevkey_sum)
		prevkey=event
		prevkey_sum=1
if prevkey!="":
	print str(prevkey)+","+str(prevkey_sum)
		

