# NoSQL Databases

NoSQL databases

 - sacrifice some of the ACID properties
 - simpler API ( with less powerful SQL like queries ) e.g. Hive, MongoDB, Dynamo, Cassandra

Decision tree for NoSQL databases / RDBMSes

replication

partition

 - static
 - dynamic

distributed hash table ( DHT ) 

consistency

key / value or document / object

BASE - basically available, soft state and eventually consistent

CAP theorem - Out of Consistency, Availability and Partition tolerance, a system can only guarantee two of the three at a time.

 - Consistency - all nodes see the same data at the same time
 - Availability - a guarantee that every request receives a response about whether it was successful or failed
 - Partition tolerance - the system continues to operate despite arbitrary message loss

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
    


Papers:

 - Google BigTable : HBase, Big Table
 - Apache Dynamo : Dynamo, Cassandra

OrientDB uses RB+Tree ( RB Tree + B+ Tree )

NoSQLDatabases.org

For MongoDB - http://nosql.mypopescu.com/post/1378460012/mongodb-and-cap-theorem
