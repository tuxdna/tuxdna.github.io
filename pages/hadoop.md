---
layout: page
title: "Hadoop"
description: "Hadoop in a Nutshell"
---

{% include JB/setup %}

# Hadoop in an nutshell

Hadoop terminology

### Job Tracker

[JobTracker](https://wiki.apache.org/hadoop/JobTracker)

The JobTracker is the service within Hadoop that farms out MapReduce tasks to specific nodes in the cluster


### Task Tracker

[Task Tracker](https://wiki.apache.org/hadoop/TaskTracker)

A TaskTracker is a node in the cluster that accepts tasks - Map, Reduce and Shuffle operations - from a JobTracker. 


### Name Node

[Name Node](https://wiki.apache.org/hadoop/NameNode)

 * Keeps HDFS directory tree

 * Single point of failure

 * Doesn't provide High Availability in itself

 * Does YARN provide HA?

### Secondary Name Node

A secondary ( backup node ) for name node

### Data Node

[Data Node](https://wiki.apache.org/hadoop/DataNode)

Keeps actual data of files in HDFS

## Hadoop Ecosystem:

 * Avro - serialization system
 * MapReduce - data processing framework
 * HDFS - userspace distributed filesystem
 * Pig - dataflow language and execution environment
 * Hive - distributed datawarehouse system
 * HBase - distributed column oriented database
 * ZooKeeper - distributed coordination service
 * Sqoop - bulk transfer b/w structured data stores
 * Common - filesystem and I/O library


## Why MapReduce ?

Three problems that it solves:
 * dividing the work into equal-pieces
 * combining the result from independent processes run against pieces made above
 * limited capacity of a single machine


## Before you begin

Read: [Getting Started with Hadoop](https://wiki.apache.org/hadoop/GettingStartedWithHadoop)


## HDFS

HDFS
 
 * only one writer per file
 * append mode only  ( no random access )
 * no HA by default
 * execute permission is ignored by default on the HDFS filesystem

Also:

 * HDFS files are stored in blocks ( 64MB size by default )
 * Hadoop provides support for various URI schemes such as `file://`, `hdfs://` etc.
 * Provides write/copy progress support via callback `org.apache.hadoop.util.Progressable`


## Setup

Fetch a Hadoop tarball `hadoop-1.2.1-bin.tar.gz` and then:

    $ tar zxf hadoop-1.2.1-bin.tar.gz
	$ cd hadoop-1.2.1
	$ export PATH=`pwd`/bin:$PATH

**Update `core-site.xml` for**

 * `fs.default.name` value to `hdfs://localhost:9000`
 * location of HDFS data path where filesystem is created

File: `core-site.xml`

    <?xml version="1.0"?>
    <?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
    
    <!-- Put site-specific property overrides in this file. -->
    <configuration>
         <property>
             <name>fs.default.name</name>
             <value>hdfs://localhost:9000</value>
         </property>
         <property>
           <name>hadoop.tmp.dir</name>
           <value>/home/tuxdna/tmp/hadoop-1.2.1-${user.name}</value>
           <description>A base for other temporary directories.</description>
         </property>
    </configuration>



**Update `hdfs-site.xml` for `dfs.replication` value**

File `hdfs-site.xml`:

    <?xml version="1.0"?>
    <?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
    
    <property>
             <name>dfs.replication</name>
             <value>1</value>
    </property>
    </configuration>
    

**Update `mapred-site.xml` for `mapred.job.tracker` value**

File `mapred-site.xml`:

    <?xml version="1.0"?>
    <?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
    
    <configuration>
    <property>
             <name>mapred.job.tracker</name>
             <value>localhost:9101</value>
    </property>
    </configuration>
    
### Setup the HDFS directory

Format the nodename

    hadoop namenode -format

## Start the single node cluster

    $ bin/start-all.sh

Deleting a folder on HDFS:

    hadoop fs -rmr wc-out

Executing some Job:

    export HADOOP_CLASSPATH=/home/tuxdna/hadoop-book/ch02/target/ch02-3.0.jar
    hadoop alice.WordCountDriver file:///path/to/input output/

To make a copy from one hadoop cluster to another, use `distcp` command.


## HAR files

Create a hadoop archive

    $ hadoop fs -copyFromLocal alice-in-wonderland/ /user/tuxdna/
    $ hadoop archive -archiveName alice.har -p /user/tuxdna  alice-in-wonderland /user/tuxdna
    $ hadoop fs -ls alice.har
    Found 4 items
    -rw-r--r--   1 tuxdna supergroup          0 2014-03-07 19:03 /user/tuxdna/alice.har/_SUCCESS
    -rw-r--r--   5 tuxdna supergroup       1407 2014-03-07 19:03 /user/tuxdna/alice.har/_index
    -rw-r--r--   5 tuxdna supergroup         24 2014-03-07 19:03 /user/tuxdna/alice.har/_masterindex
    -rw-r--r--   1 tuxdna supergroup     144346 2014-03-07 19:03 /user/tuxdna/alice.har/part-0

Enlist archive contents

    $ hadoop fs -lsr har:///user/tuxdna/alice.har
    drwxr-xr-x   - tuxdna supergroup          0 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland
    -rw-r--r--   1 tuxdna supergroup      13867 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-06.txt
    -rw-r--r--   1 tuxdna supergroup       9559 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-03.txt
    -rw-r--r--   1 tuxdna supergroup      11459 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-01.txt
    -rw-r--r--   1 tuxdna supergroup      11993 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-05.txt
    -rw-r--r--   1 tuxdna supergroup      13878 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-04.txt
    -rw-r--r--   1 tuxdna supergroup      12695 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-07.txt
    -rw-r--r--   1 tuxdna supergroup      13663 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-08.txt
    -rw-r--r--   1 tuxdna supergroup      12625 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-09.txt
    -rw-r--r--   1 tuxdna supergroup      11535 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-10.txt
    -rw-r--r--   1 tuxdna supergroup      10387 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-11.txt
    -rw-r--r--   1 tuxdna supergroup      10996 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-02.txt
    -rw-r--r--   1 tuxdna supergroup      11689 2014-03-07 19:02 /user/tuxdna/alice.har/alice-in-wonderland/ch-12.txt


## Cluster Setup

Setting up a multi-node cluster:

[Running Hadoop on Ubuntu Linux (Multi-Node Cluster)](http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-multi-node-cluster/)

## Run jobs

Executing MapReduce Jobs:

    HADOOP_USER_NAME=hduser
    HADOOP_DIR=/home/hduser/hadoop-1.1.1
    HADOOP_CLASSPATH=/tmp/target/ch02-3.0.jar
    hadoop pirates.Driver pirates/input.txt pirates/output

## Web UI

HDFS UI: [dfshealth.jsp](http://localhost:50070/dfshealth.jsp)

JobTracker UI: [jobtracker.jsp](http://localhost:50030/jobtracker.jsp)

# References

 * [hadoop job tracker cannot start up](http://stackoverflow.com/questions/16296589/hadoop-job-tracker-cannot-start-up)
