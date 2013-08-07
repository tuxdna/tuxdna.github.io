---
layout: page
title: "NoSQL"
description: "What is NoSQL?"
---

{% include JB/setup %}


# What is NoSQL ?

NoSQL stands for *Not only SQL*, ( it doesn't mean *not SQL* ). This basically means that a traditional SQL database is a NoSQL database too.

## Comparison of NoSQL with traditional databases

NoSQL databases essentially

 * sacrifice some of the ACID properties

 *  simpler API ( with less powerful SQL like queries ) e.g. Hive, MongoDB, Dynamo, Cassandra

## Classification based on the type of data

Here I am listing some categories and a few well know examples:

 * *Wide Column Store / Column Families*: HBASE, Cassandra
 * *Document Store*: CouchDB, MongoDB, ElasticSearch
 * *Key Value / Tuple Store*: Memcache, Redis
 * *Graph Databases*: Neo4J
 * *Multimodel Databases*: OrientDB ( both document and graph data )
 * *Object Databases*: ZODB ( basically a distributed Object database, where you can call methods on objects stored in DB )
 * *Grid / Cloud Databases*: Infinispan ( a part of JBoss project ) is basically a distributed key-value store
 * *XML Databases*: eXist DB ( I have yet to figure out why it exists ? :-) )
 * *Multidimensional Databases*: RASDAMAN. These database are used in scientific research, business intelligence and analytics. ( heard of data cube ? ), basically for drilling down into huge amount of data metrics.
 * *Multivalue Databases*: TBD
 * *Event Sourcing*: Event Store ( for complex event processing - CEP )
 * and many other uncategorized
 
That may sound like a lot of data, and yes it is. Understanding one single database in itself is a big task, let alone all the above categories.

## How do we decide which database to use?

Basicall you can choose from a variety of parameters. Here are some decisoin criteria for NoSQL databases / RDBMSes

 * replication: Do you need replication?

 * partition: What kind of partitions do you want?

    - static
    - dynamic

 * distributed hash table ( DHT ): How do you want your data to be distributed over a set of data nodes?

 * consistency : Do you need consistency?

 * key / value or document / object: What is your data like?


## BASE Theorem

[BASE](http://www.johndcook.com/blog/2009/07/06/brewer-cap-theorem-base/) - basically available, soft state and eventually consistent.

BASE Theorem is the motivation behind many of the now popular NoSQL databases. Think of your wall posts apparing after a dealy on a friend's Facebook wall. That is eventual consistency.

## CAP Theorem

[CAP](http://en.wikipedia.org/wiki/CAP_theorem) Theorem - Out of Consistency, Availability and Partition tolerance, a system can only guarantee two of the three at a time.

 - Consistency - all nodes see the same data at the same time
 - Availability - a guarantee that every request receives a response about whether it was successful or failed
 - Partition tolerance - the system continues to operate despite arbitrary message loss


## ACID compliance

ACID

 - atomic - all or nothing
 - consistent - any operation should move from one consistent state to another
 - isolated - data in a transaction is not visible to others until the transaction finishes
 - durable - data is not lost in case of system failure

consistency - is affected by network latency

partition tolerance - has an effect on number of requests

      | RDBMS | Dynamo / Cassandra | HBase / BigTable |
    C |  Y    | N                  | Y                |
    A |  Y    | Y                  | N                |
    P |  N    | Y                  | Y                |
    


Papers and links:

 - [Google BigTable](http://research.google.com/archive/bigtable.html) : HBase, Big Table
 - [Apache Dynamo](http://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf) : Dynamo, Cassandra
 - [OrientDB](https://github.com/orientechnologies/orientdb#orientdb) uses RB+Tree ( RB Tree + B+ Tree )


## More exhaustive list of databases

Read more at: [NoSQL-Databases.org](http://NoSQL-Databases.org)

