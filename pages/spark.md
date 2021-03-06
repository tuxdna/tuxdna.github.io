---
layout: page
title: "Spark"
description: "Spark: Lightning Fast Cluster Computing"
---

{% include JB/setup %}

# Spark: Lightning-Fast Cluster Computing

[Spark Project](http://spark-project.org/)

Parallel Programming with Spark (Part 1 & 2) - Matei Zaharia 

 * [Video](http://www.youtube.com/watch?v=7k4yDKBYOcw)

Setting up Scala

Install via package manager:

    $ sudo yum install scala

Install from binary package on Linux:

    $ wget http://www.scala-lang.org/downloads/distrib/files/scala-2.9.3.tgz
    $ tar zxf scala-2.9.3.tgz
    $ cd scala-2.9.3
    $ export SCALA_HOME=`pwd`
    $ export PATH=$SCALA_HOME/bin:$PATH

Setting up Spark

    $ git clone git://github.com/mesos/spark.git
    $ cd spark
    $ sbt/sbt package
    $ ./spark-shell

Running first example

Ensure that you have setup Scala and Spark ( as above ), and setup SCALA_HOME and PATH variables for scala executable to run from the shell.

    $ ./run spark.examples.SparkLR local[2]
    ... OUTPUT SKIPPED ...
    Final w: (5816.075967498865, 5222.008066011391, 5754.751978607454, 3853.1772062206846, 5593.565827145932, 5282.387874201054, 3662.9216051953435, 4890.78210340607, 4223.371512250292, 5767.368579668863)

Components:

 * Huge dataset
 * Many nodes ( driver + workers )
 * Information extration algorithm

