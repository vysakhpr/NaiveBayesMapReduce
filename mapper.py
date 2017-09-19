#!/usr/bin/env python
import sys
import string 
import time
import math
import operator
months=["january","february", "march","april","may","june","july","august","september","october","november","december"]
for line in sys.stdin:
	parts=line.split("\t")
	labels=parts[0].replace(" ","").split(',')
	document=parts[1].split('"',1)[1].rsplit('"',1)[0].replace("\\u","").translate(None,string.punctuation).translate(None,string.digits)
	words=filter(None,document.split(" "))
	words=[word for  word in words if word.lower() not in months]
	for label in labels:
		print "Y=ANY += 1"
		print "Y="+str(label)+" += 1"
		for word in words:
			print "Y="+str(label)+"^X="+word+" +=1"