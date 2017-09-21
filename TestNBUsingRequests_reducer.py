#!/usr/bin/env python

import sys
import math
words=[]
vocabulary_count=100
label_count=0
label_dict={}
label_anyword_dict={}
label_probability_dict={}
f=open("ref",'r')
for line in f:
	parts=line.split(',')
	count=int(parts[1].rstrip())
	event=parts[0][2:].rstrip()
	if event=="ANY":
		label_count=count
	elif "^" in event:
		i=event.index("^")
		label_anyword_dict[event[0:i]]=count
	else:
		label_dict[event]=count

for line in sys.stdin:
  	line=line.rstrip()
  	if line:
		parts=line.split(",",1)
		key=parts[0]
		value=parts[1]
		if value.startswith('~'):
			for label in label_dict:
		else:
			words=value.split(" ")



