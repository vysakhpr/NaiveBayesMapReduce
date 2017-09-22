#!/usr/bin/env python

import sys
import math
import operator

words=[]
vocabulary_count=448664
label_count=0
label_dict={}
label_anyword_dict={}
label_probability_dict={}
predictions={}
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

qx=1.0/vocabulary_count
qy=1.0/len(label_dict)
m=1

true_label=""
label_probability_dict={}
for label in label_dict:
	label_probability_dict[label]=math.log((label_dict[label]+m*qy)/(label_count+m))
for line in sys.stdin:
  	line=line.rstrip()
  	if line:
		parts=line.split(",",1)
		key=parts[0]
		value=parts[1]
		if value.startswith('~'):
			i=value.find("C[")
			value=value[i:]
			counters=value.split(',')
			label_buff=[]
			for c in counters:
				j=c.find("Y=")
				k=c.find("]=")
				l=int(c[k+2:])
				label_probability_dict[c[j+2:k]]=label_probability_dict[c[j+2:k]]+math.log((l+m*qx)/(label_dict[c[j+2:k]]+m))
				label_buff.append(c[j+2:k])
			for label in label_probability_dict:
				if label not in label_buff:
					label_probability_dict[label]=label_probability_dict[label]+math.log((m*qx)/(label_dict[label]+m))
		else:
			if true_label !="":
				max_label=max(label_probability_dict.iteritems(),key=operator.itemgetter(1))[0]
				true_labels=true_label.split(',')
				if max_label in true_labels:
					print 1
				else:
					print 0
			true_label=value.split("\t")[0]
			label_probability_dict={}
			for label in label_dict:
				label_probability_dict[label]=math.log((label_dict[label]+m*qy)/(label_count+m))
if true_label !="":
	max_label=max(label_probability_dict.iteritems(),key=operator.itemgetter(1))[0]
	true_labels=true_label.split(',')
	if max_label in true_labels:
		print 1		
	else:
		print 0


