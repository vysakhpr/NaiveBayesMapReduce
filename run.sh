#!/bin/bash
hdfs dfs -rm -r /user/vysakhr/output
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_train.txt -output /user/vysakhr/output -file mapper.py -mapper mapper.py -file reducer.py  -reducer reducer.py