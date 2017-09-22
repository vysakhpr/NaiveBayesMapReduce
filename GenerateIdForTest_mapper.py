#!/usr/bin/env python

import sys
import string 
import time
import math
import operator
months=["january","february", "march","april","may","june","july","august","september","october","november","december"]
i=1
for line in sys.stdin:
	parts=line.split("\t")
	labels=parts[0].replace(" ","")
	document=parts[1].split('"',1)[1].rsplit('"',1)[0].replace("\\u","").translate(None,string.punctuation).translate(None,string.digits)
	words=filter(None,document.split(" "))
	words=[word for  word in words if word.lower() not in months]
	words=" ".join(words)
	if words.rstrip():
		words=labels+"\t"+words
		print words
