Database systems

 massive, persistent, safe, multi-user, convenient, efficient, reliable

Data model - records, xml, graph


Schema versus data - types versus variables
 * DDL
 * DML

Relational model - 35 years old

    DB = set of tables / relations
    
Design anomalies
 - redundancy
 - update anomaly
 - deletion anomany

Normal Forms

     1NF - atomic values
     2NF - keys
     
Functional dependencies => boyce codd nornal form

     3NF - weak BCNF
    
Multivalued Dependencies => 4th Normal Form

If we have this data:

    x    y    z
    1 -> A -> K
    2 -> A -> K
    3 -> B -> M
    
Then we can infer following relationship:

    x  -> y   ( x implies y )
    y !-> x   ( y doesn't imply x )
    
Therefore x is the key.
