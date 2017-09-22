f=open("output.txt",'r')
total_sum=0
positive_sum=0
for line in f:
	line = line.rstrip()
	if line:
		total_sum=total_sum+1
		if line.rstrip()=="1":
			positive_sum=positive_sum+1

print "Accuracy: "+str((positive_sum*100.0)/total_sum)+"%"