#!/bin/bash
chmod +x *
hdfs dfs -rm -r /user/vysakhr/eventCounts
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_train.txt -output /user/vysakhr/eventCounts -file CountForNB_mapper.py -mapper CountForNB_mapper.py -file CountForNB_reducer.py  -reducer CountForNB_reducer.py
hdfs dfs -rm -r /user/vysakhr/words
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/eventCounts -output /user/vysakhr/words -file CountByWord_mapper.py -mapper CountByWord_mapper.py -file CollectRecords_reducer.py -reducer CollectRecords_reducer.py
hdfs dfs -rm -r /user/vysakhr/counts
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/eventCounts -output /user/vysakhr/counts -file LabelCounts_mapper.py -mapper LabelCounts_mapper.py -file LabelCounts_reducer.py -reducer LabelCounts_reducer.py
hdfs dfs -rm -r /user/vysakhr/testdata
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_test.txt -output /user/vysakhr/testdata -file GenerateIdForTest_mapper.py -mapper GenerateIdForTest_mapper.py -file GenerateIdForTest_reducer.py -reducer GenerateIdForTest_reducer.py
hdfs dfs -rm -r /user/vysakhr/joindata
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/testdata -input /user/vysakhr/words -output /user/vysakhr/joindata -file RequestWordCounts_mapper.py -mapper RequestWordCounts_mapper.py -file RequestWordCounts_reducer.py -reducer RequestWordCounts_reducer.py
hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=2 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt
hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=4 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=8 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=10 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt


hdfs dfs -rm -r /user/vysakhr/eventCounts
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_train.txt -output /user/vysakhr/eventCounts -file CountForNB_mapper.py -mapper CountForNB_mapper.py -file CountForNB_reducer.py  -reducer CountForNB_reducer.py
hdfs dfs -rm -r /user/vysakhr/words
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/eventCounts -output /user/vysakhr/words -file CountByWord_mapper.py -mapper CountByWord_mapper.py -file CollectRecords_reducer.py -reducer CollectRecords_reducer.py
hdfs dfs -rm -r /user/vysakhr/counts
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/eventCounts -output /user/vysakhr/counts -file LabelCounts_mapper.py -mapper LabelCounts_mapper.py -file LabelCounts_reducer.py -reducer LabelCounts_reducer.py
hdfs dfs -rm -r /user/vysakhr/testdata
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_devel.txt -output /user/vysakhr/testdata -file GenerateIdForTest_mapper.py -mapper GenerateIdForTest_mapper.py -file GenerateIdForTest_reducer.py -reducer GenerateIdForTest_reducer.py
hdfs dfs -rm -r /user/vysakhr/joindata
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/testdata -input /user/vysakhr/words -output /user/vysakhr/joindata -file RequestWordCounts_mapper.py -mapper RequestWordCounts_mapper.py -file RequestWordCounts_reducer.py -reducer RequestWordCounts_reducer.py
hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=2 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt
hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=4 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=8 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=10 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/eventCounts
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_train.txt -output /user/vysakhr/eventCounts -file CountForNB_mapper.py -mapper CountForNB_mapper.py -file CountForNB_reducer.py  -reducer CountForNB_reducer.py
hdfs dfs -rm -r /user/vysakhr/words
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/eventCounts -output /user/vysakhr/words -file CountByWord_mapper.py -mapper CountByWord_mapper.py -file CollectRecords_reducer.py -reducer CollectRecords_reducer.py
hdfs dfs -rm -r /user/vysakhr/counts
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/eventCounts -output /user/vysakhr/counts -file LabelCounts_mapper.py -mapper LabelCounts_mapper.py -file LabelCounts_reducer.py -reducer LabelCounts_reducer.py
hdfs dfs -rm -r /user/vysakhr/testdata
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/ds222/assignment-1/DBPedia.full/full_train.txt -output /user/vysakhr/testdata -file GenerateIdForTest_mapper.py -mapper GenerateIdForTest_mapper.py -file GenerateIdForTest_reducer.py -reducer GenerateIdForTest_reducer.py
hdfs dfs -rm -r /user/vysakhr/joindata
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -input /user/vysakhr/testdata -input /user/vysakhr/words -output /user/vysakhr/joindata -file RequestWordCounts_mapper.py -mapper RequestWordCounts_mapper.py -file RequestWordCounts_reducer.py -reducer RequestWordCounts_reducer.py
hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=2 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt
hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=4 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=8 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

hdfs dfs -rm -r /user/vysakhr/output
hdfs dfs -rm -r /user/vysakhr/counts.txt
hdfs dfs -cat /user/vysakhr/counts/* > counts.txt
hdfs dfs -put counts.txt /user/vysakhr/counts.txt
hadoop jar /usr/hdp/2.6.1.0-129/hadoop-mapreduce/hadoop-streaming.jar -D mapred.reduce.tasks=10 -D map.output.key.field.separator="," -D mapred.text.key.partitioner.options=-k1,1  -input /user/vysakhr/testdata -input /user/vysakhr/joindata -cacheFile /user/vysakhr/counts.txt#ref -output /user/vysakhr/output -file TestNBUsingRequests_mapper.py -mapper TestNBUsingRequests_mapper.py -file TestNBUsingRequests_reducer.py -reducer TestNBUsingRequests_reducer.py
hdfs dfs -cat /user/vysakhr/output/* > output.txt
python ComputePercentage.py >> percentage.txt

