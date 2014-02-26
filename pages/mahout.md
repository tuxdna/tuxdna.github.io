---
layout: page
title: "Mahout"
description: "Mahout"
---

{% include JB/setup %}

Setup hadoop-1.1.1

Setup ssh-keys for passphrase-less login

    $ ssh-copy-id localhost
    $ hadoop namenode -format
    $ start-all.sh
    $ hadoop fs -put conf input

[Hadoop Error: "could only be replicated to 0 nodes, instead of 1"](http://www.phacai.com/hadoop-error-could-only-be-replicated-to-0-nodes-instead-of-1)

    $ stop-all.sh
    $ rm -rf  /tmp/hadoop-*
    $ hadoop namenode -format
    $ start-all.sh

Now we can browse the files and track the jobs:

 * [dfshealth.jsp](http://localhost:50070/dfshealth.jsp)
 * [jobtracker.jsp](http://localhost:50030/jobtracker.jsp)

Run sample hadoop job

    $ hadoop fs -put conf/*.xml input
    $ hadoop jar hadoop-examples-*.jar grep input output 'dfs[a-z.]+'
    $ hadoop fs -cat output/*
    1       dfs.replication
    1       dfsadmin

Setup env variables:

    export HADOOP_HOME=/path/to/hadoop-1.1.1
    export PATH=$HADOOP_HOME/bin:$PATH

    export MAHOUT_HOME=/path/to/mahout-distribution-0.7
    export PATH=$MAHOUT_HOME/bin:$PATH

[Canopy Clustering example](http://cloudblog.8kmiles.com/2012/01/31/apache-mahout-a-clustering-example/)

    $ wget http://archive.ics.uci.edu/ml/databases/synthetic_control/synthetic_control.data
    $ hadoop fs -mkdir testdata
    $ hadoop fs -put /home/tuxdna/work/learn/external/synthetic_control.data testdata/
    $ mahout org.apache.mahout.clustering.syntheticcontrol.canopy.Job

Download outut sequence files:

    $ hadoop fs -get output ~/Downloads/
    $ mahout clusterdump --seqFileDir /home/tuxdna/Downloads/output/clusters-0-final/ --pointsDir /home/tuxdna/Downloads/output/clusteredPoints/ --output /home/tuxdna/Downloads/output/clusteranalyze.txt

Got this error:

    Unexpected --seqFileDir while processing Job-Specific Options:

[Fixed by this](http://stackoverflow.com/questions/11148175/is-there-any-seqfiledir-option-for-clusterdump-in-the-latest-apache-mahout-l)

    $ mahout clusterdump -i output/clusters-0-final/ --pointsDir output/clusteredPoints/ --output /tmp/clusteranalyze.txt
    Running on hadoop, using /home/tuxdna/work/learn/external/hadoop-1.1.1/bin/hadoop and HADOOP_CONF_DIR=
    MAHOUT-JOB: /home/tuxdna/work/learn/external/mahout-distribution-0.7/mahout-examples-0.7-job.jar
    13/05/22 18:45:10 INFO common.AbstractJob: Command line arguments: {--dictionaryType=[text], --distanceMeasure=[org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure], --endPhase=[2147483647], --input=[/home/tuxdna/Downloads/output/clusters-0-final/], --output=[/home/tuxdna/Downloads/output/clusteranalyze.txt], --outputFormat=[TEXT], --pointsDir=[/home/tuxdna/Downloads/output/clusteredPoints/], --startPhase=[0], --tempDir=[temp]}
    13/05/22 18:45:10 INFO clustering.ClusterDumper: Wrote 0 clusters
    13/05/22 18:45:10 INFO driver.MahoutDriver: Program took 629 ms (Minutes: 0.010483333333333334)



KMeans clustering on Text corpus:

    $ mahout seqdirectory -i file:/full_txt/ -o file:/out-seqdir -c UTF-8 -chunk 5
    $ mahout seq2sparse -i file:/out-seqdir -o /out-seqdir-sparse --maxDFPercent 8 --namedVector
    $ mahout kmeans -ow -i /out-seqdir-sparse/tfidf-vectors/ -c /out-kmeans-clusters  -o /out-kmeans -dm org.apache.mahout.common.distance.CosineDistanceMeasure -x 10 -k 20 -ow --clustering -cl
    $ mahout clusterdump -i /out-kmeans/clusters-*-final -d /out-seqdir-sparse/dictionary.file-0 -dt sequencefile -b 100 -n 20 --evaluate -dm org.apache.mahout.common.distance.CosineDistanceMeasure --pointsDir /out-kmeans/clusteredPoints -o /out-output.txt



[Word Space Model](http://su.diva-portal.org/smash/get/diva2:189276/FULLTEXT01) by Magnus Sahlgren

