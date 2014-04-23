---
layout: page
title: "Machine Learning"
description: "Notes on Machine Learning"
---

{% include JB/setup %}

# Machine Learning


## What is Machine Learning?

1959 - Field of study that gives computers the ability to learn without being explicitly programmed.

1998 - A computer program is said to learn from experience E with respect to some task T and some performance P, if its performance on T, as measured by P, improves with experience E.


## Kinds of Learning

 Supervised Learning: _Regression_, _Classification_

 Unsupervised Learning: _Clustering_, _Collaborative Filtering_ / _Recommeder Systems_, _Reinforcement Learning_

### Supervised

Supervised - Given a dataset where right answers were known, the machine learns to estimate the right answers for unknow data.

#### Regression

Regression - predict continuous valued output

 * Linear Regression

   * Univariate - with one variable

   * Multivariate - multiple variables

   * Hypotheses, Cost Function and its Minimization

 * Techniques Used

   * Gradient Descent Algorithm

   * Convex Function

   * Batch Gradient Descent

   * Normal Equation

#### Classification

 Classification involves discreete valued output.

 * Machine makes decision based on experience, and in the process, emulate certain forms of human decision making.

 * Used in Predictive Analytics and Spam Detection

### Unsupervised

#### Clustering

##### Components

     - An Algorithm
     - A notion of Similarity / Dissimilarity
     - Stop Condition

##### Objective

 * Objective is to group similar / related items together

##### Grouping items

Items are generally grouped together using a mean or centroid of the measures ( similarity / dissimilarity ).

 * Clustering
 
   * [Canopy Clustering](https://cwiki.apache.org/confluence/display/MAHOUT/Canopy+Clustering)

     * (1) Initialize

       * `S = set of all points`

       * `T1, T2 = distance thresholds such that T1 > T2`

     * (2) Pick a point `A` at random from S i.e. `A = S.pickRandom()`, this becomes a new canopy cluster center

     * (3) For each of the points P in S:

       * `if ( distance(A,P) > T1 ) ignore P else if ( distance(A,P) <= T1 ) select P`

       * `if ( distance(A,P) < T2) then S.remove(P)`

     * (4) Repeat 2-3 steps until S is empty
	 

Pseudocode

    S = set of all points
    T1, T2 = distance thresholds such that T1 > T2
	canopies = Set of canopies, initially empty
	do {
      C = S.pickRandom() // new canopy
	  canopies.add(C)
      for( P <- S ) {
        if ( distance(C,P) <= T1 ) { select for C }
        if ( distance(C,P) < T2) { S.remove(P) }
      }
    } while( S.notEmpty() )


Scala implementation: https://gist.github.com/tuxdna/9764091


   * [K-Means Clustering](http://en.wikipedia.org/wiki/K-means_clustering)

     * (1) Take an initial set of k points as means

     * (2) Make k clusters by associating every point with the nearest mean-point.

     * (3) For each of the k clusters formed in previous step, find the centroid of the cluster.

     * (4) Repeat 2-3 steps until centroid have converged, or until a limit on iterations has reached.

        Step 2 is the expectation step, and step 3 is the maximization step. Therefore, this algorithm is also a variant of generalized [exptectation-maximization algorithm](http://en.wikipedia.org/wiki/Expectation-maximization_algorithm).


#### Recommender Systems

Recommender systems are classified in the following ways:

 * Collaborative Filtering

 * Content based approach 

 * Hybrid models ( CF + Content Based )


Recommendations can be of 3 kinds:

 * User based - producing recommendations based on, and only based on knowledge of user's relationship to items, and not the properties of items themselves ( e.g. KNN based algorithm )

 * Item based - build an item-item matrix for relationship among pairs. using the data on current user, infer his tase. ( e.g. Slop One algorithm )

 * Content based
 
Also read the [Wipedia article](http://en.wikipedia.org/wiki/Collaborative_filtering)

Challenges in Collaborative Filtering: 

 * data sparsity
 * cold start
 * scalabiliy
 * synonyms
 * grey sheep
 * black sheep
 * shilling attacks
 * diversity


#### Reinforcement Learning

TBD

# Apache Mahout

Introduction to Apache Mahout: It started as a sub project of Lucene. (More to do with Hadoop.)
Sean Owen started Taste Project ( Recommender Systems ) in 2005.

Requirements for Setting Up:
 * Java
 * IDE - Eclipse
 * Maven
 * Mahout distribution ( preferably the latest version )
 * Hadoop

## Recommendation Algorithms

Input data takes a form of preferences. Preference is a tuple of three values: userId, itemId, preferenceValue. Mahout has its own data structures to store these values efficiently. It has FastMap, FastByIdMap, FastIDSet etc. The preferences are stored in memory using GenericPreference, GenericPreferenceArray etc. 

These values can be loaded from files or from databases or other storage media. For file backed storage, Mahout has FileDataModel class. It is simple to use.

For recommendation algorithms, first we create a DataModel for user, item and preferences. Then we select a similarity measure i.e. UserSimilarity or ItemSimilarity. Next, we select a class that creates a neighbourhood of users or items based on a certain criteria. This criteria can be a threshold value of similarity or a limit on top N items.

So we have a DataModel, a UserSimilarity ( or ItemSimilarity ) and a UserNeighborhood. Finally we create Recommender. Mahout has many different kinds of recommenders already built into it e.g.: GenericUserBasedRecommender, SlopeOneRecommender etc.

Order of business here is:

 * Choose a data model and load preference data

 * Choose a similiarity metric
 
 * Define a neighborhood
 
 * Choose an algorithm implementation for recommendations

 * Now we are ready for recommendations.
 
Another point to note is that we would need to evaluate the quality of recommendations that Mahout is giving us. For this there is a recommender evaluation framework already in place. Two metrics are:

 * RecommenderEvaluator: measures the divergence of estimated recommendation value from the actual recommendation value
 
 * RecommenderIRStatsEvaluator: measures precision and recall of the recommendation

Apache Mahout has all of this already implemented.

Lets look at MySQL based data model.

### MySQL Data Model

Create Taste preferences:

	CREATE TABLE taste_preferences (
	  user_id BIGINT NOT NULL,
      item_id BIGINT NOT NULL,
      preference FLOAT NOT NULL,
      PRIMARY KEY (user_id, item_id),
      INDEX (user_id),
      INDEX (item_id));

    mysql> create database mia01;
    Query OK, 1 row affected (0.00 sec)

    mysql> use mia01;
    Database changed

    mysql> CREATE TABLE taste_preferences ( user_id BIGINT NOT NULL, item_id BIGINT NOT NULL, preference FLOAT NOT NULL, PRIMARY KEY (user_id, item_id), INDEX (user_id), INDEX (item_id));
    Query OK, 0 rows affected (0.11 sec)


Create item similarity table:

  
    CREATE TABLE taste_item_similarity (
      item_id_a BIGINT NOT NULL,
      item_id_b BIGINT NOT NULL,
      similarity FLOAT NOT NULL,
      PRIMARY KEY (item_id_a, item_id_b));
	  


### Similarity metrics

#### Pearson correlation

Pearson Correlation definition: The value is in the range -1.0 to 1.0

    Pearson correlation of two series is the ratio of their covariance to the product of their variances.

Perason correlation problems: 

 * it doesn't take into account the number of items in which two users preferences overlap

 * if two users overlap on only one item, no correlation can be computed because of how the computation is defined
 
 * the correlation is also undefined if either series of preference values are all identical

There is also a weighted pearson correlation metric, which moves correlation towards -1 or +1, when the preferences for some feathres are missing.

#### Euclidean distance

Euclidean distance is geometric distance between two n-dimensional points. This is a distance metric, so to convert it into a similarity metric, it is defined as

    s = 1 / (1 + d )
	where s = similarity
	and d = euclidean distance
	
#### Cosine measure

Cosine measure is the `cos(theta)` of angle `theta` between two points with respect to originx. This is essentially implemented as Pearson Correlation metric in Mahout, mentioned above.

#### Spearman correlation

Spearman correlation - defining similarity by relative rank

#### Tanimoto coefficient

Also know as Jackard coefficent is: 

    tc = intersection of preferences / union of preferences

#### Log likelihood test


It is quite similar to Tanimoto Coefficient, which measures an overlap. However, Log Likelihood test, is an expression of how unlikely are will users have so much overlap, given the total number of items and the number of items each user has a preference for.

Two similar users are likely to rate a movie common to them. However two dissimilar users are unlikely to rate a common movie. Therefore the more unilkely, the more similar two users shoud be. The resulting value can be interpreted as a probability that an overlap isn't just due to chance.


### Components and their compatibility

Boolean Preference Data Model 

 * is not compatible with PearsonCorrelation / EuclideanDistance

 * is compatible with LogLikelihood
 

In case of zero difference in estimate and actual preference, by the evauluator, we can always do a precision / recall evaluation -- using IRStats evaluator.

### User based recommender

*User based* recommenders first finds similar users and then sees what they like.

**Algorithm**: User-Based Recommender


    for every item i that u has no preference for yet
      for every other user v that has a preference for i
        compute a similarity s between u and v
        incorporate v's preference for i, weighted by s, into a running average
    return the top items, ranked by weighted average
	
Basic algorithm with a user neighbourhood:

    for every other user w
      compute a similarity s between u and w
      retain the top users, ranked by similarity, as a neighbourhood n
    
    for item i in neighbourhood except the ones rated by u
      for user v in neighbourhood who has a preference for i
        compute a similarity s between u and v
        incorporate v's preference for i, weighted by s, into a running average
    
    return the top items, ranked by weighted average

Kind of neighbourhood metrics:

 * fixed size

 * threshold based

It is also possible to infer values for missing preferences in Mahout. This is achieveable using `PreferenceInferer` implementation such as `AveragePreferenceInferer`.

### Item based recommender

*Item based* recommenders first sees what the user likes and then finds similar items.

**Algorithm**: Item-Based Recommender

    for every item i that u has no preference for yet
      for every item j that u has a preference for
        compute a similarity s between i and j
        add u's preference for j, weighted by s, to a running average
		
    return the top items, ranked by weighted average

Note: the running time of an item-based recommender scales up as the number of items increases, whereas a user-based recommender's running time goes up as the number of users increases.


#### Slope One recommender

Algorithm


    Preprocessing

      for every item i
        for every other item j
          for every user u expressing preference for both i and j
            add the difference in u's preference for i and j to an average

    SlopeOne Algorithm(u: User)
    
      for every item i for which u expresses no preference
        for every item j for which u expresses a preference
          find the average preference difference between j and i
          add this diff to u's preference value for j
          add this to a running average
       return the top items, raned by these averages


Implementation in a pseudo-code (Following Code is Scala like)
    
    I = { set of all items }
    U = { set of all users }
    M = { (i,u,p): i in I, u in U, p is a preference value }
    
    AvgDiff = ZeroTriangularMatrix(I.size)
    
    for(i <- I) {
      val sumDiff = 0
      val allExcept_i = I.filter(x => x != i)
      val count = 0
      for( j <- allExcept_i)) {
        for( (u, pi, pj) <- M.findUsersFor(i,j)) {
          sumDiff += pi - pj
          count += 1
        }
      }
      AvgDiff(i)(j) = sumDiff / count
    }
    
    def slopeOne(u: User, n: Int) = {
      val notRatedItems = I.filter( x => ! u.preferredItems.contains(x))
      val ratedItems = u.preferredItems();
      val preferenceList = listForAllItems(I)
      for( i <- notRatedItems ) {
        val sumForI = 0
        val count = 0
        for( j <- ratedItems ) {
          val avgDiff = AvgDiff(i)(j)
          sumForI += u.preferenceFor(j) + avgDiff
          count += 1
        }
        val avgForI = sumForI / count
        preferenceList(i) = avgForI
      }
      preferenceList.sortBy(average).reverse().take(n)
    }
    

**SlopeOne Gotchas**

The difference does not take into account the number of users who provided the ratings. Even if the rating is given for two items only by one user, its weightage will be same as rating given by many more users. This can be mitigated by using weigthing schemes:

 * Count based weighting - more users means more weightage ( rating is more reliable )
 * Standard deviation based weighting - less standard deviation means more reliable ratings

Diff calculation is a resource intesive process. It uses a lot of memory as well as CPU. This can be done over offline storage. The compution can also be distributed using Hadoop.

### SVD Recommender

Uses Matrix factorization to reduce the total data points, also summarizing them. 

Issues: Slow to compute. All SVD is done in memory.

Produces good and meaningful results.

### Linear interpolation based Recommender

Implementd as KNN  ( K Nearest Neighbours ).

Sample code:

    m = new DataModel();
    ItemSimilarity s = new LogLikelihoodSimilarity(m);
    Optimizer optimizer = new NonNegativeQuadraticOptimizer();
    r = new KnnItemBasedRecommender(m,s,optimizer,10);

### Cluseter-based recommendation

A variant on user-based CF, where items are recommendd to clusters of similar users. First all users are paritioned into clusters. Now the recommendations are computed for group of users belonging to the cluster.

## Clustering

The process of grouping a set of physical or abstract objects into classes of similar objects is called *clustering*.

A *cluster* is a collection of data objects that are similar to one another within the same cluster and are dissimilar to the objects in other clusters.

Process of clustering involves
 * an *algorithm*
 * a *simimarity/dissimarity metric*
 * and a *stop condition*
 

Distance measures

 * **Euclidean Distance**: Defined above.

 * **Squared Euclidean Distance**: `d = (a1 - b1)^2 + (a2 - b2)^2 + ... + (an - bn) ^ 2`

 * **Manhattan Distance**: `d = (a1 - b1) + (a2 - b2) + ... + (an - bn)`

 * **Cosine Distance**: Defined above

 * **Tanimoto Distance**: Defined above
 
 * **Weighted Distance Measure**: Assigns weights for different features in Euclidean or Manhattan Distances. Define a weight Vector, which has weight factor values.

TF-IDF measure

	N = Number of Documents
    TFi = Term Frequency of term i
	DFi = Document Frequency of term i ( number of documents in which i occurs )
    IDFi = Inverted Document Frequency of term i = 1 / DFi
	
Therefore:

	Wi = Weight of term i
	Wi = TF * N / IDF

In the above equation IDF can diminish the effect of TF to a large degree. Therefore, we can use `log` of IDF

	Wi = TF * log(N / IDF)

Finally a good TF-IDF measure is given by the above equation.

**Collocation**: A sequence of related words occuring together, such as **New York City**. Although these are three words `New`, `York` and `City`, when combined they have a different meaning. Therefore they can be, together considered as a single term. This is also known as **Word N-Grams**.


Creating Vectors from Text documents

Create sequence files

    $ mahout seqdirectory -i /data/lda/text-files/ -o /data/lda/output-seqdir -c UTF-8
    Running on hadoop, using ....hadoop-1.1.1/bin/hadoop and HADOOP_CONF_DIR=
    MAHOUT-JOB: ....mahout-distribution-0.7/mahout-examples-0.7-job.jar
    14/03/24 20:57:20 INFO driver.MahoutDriver: Program took 594764 ms (Minutes: 9.912733333333334)

Convert sequence files to sparse vectors. Use TFIDF by default.

    $ mahout seq2sparse -i /data/lda/output-seqdir -o /data/lda/output-seq2sparse/ -ow
    Running on hadoop, using ....hadoop-1.1.1/bin/hadoop and HADOOP_CONF_DIR=
    MAHOUT-JOB: ....mahout-distribution-0.7/mahout-examples-0.7-job.jar
    14/03/24 21:00:08 INFO vectorizer.SparseVectorsFromSequenceFiles: Maximum n-gram size is: 1
    14/03/24 21:00:09 INFO vectorizer.SparseVectorsFromSequenceFiles: Minimum LLR value: 1.0
    14/03/24 21:00:09 INFO vectorizer.SparseVectorsFromSequenceFiles: Number of reduce tasks: 1
    14/03/24 21:00:10 INFO input.FileInputFormat: Total input paths to process : 1
    14/03/24 21:00:11 INFO mapred.JobClient: Running job: job_201403241418_0001
    .....
    14/03/24 21:02:51 INFO driver.MahoutDriver: Program took 162906 ms (Minutes: 2.7151)

This step creates:
 
  * TF vectors in `/data/lda/output-seq2sparse/tf-vectors`
  * DF count in `/data/lda/output-seq2sparse/df-count`
  * TF-IDF vectors in `/data/lda/output-seq2sparse/tfidf-vectors`
 
Normalization:

 * **p-norm**: Read on [Wikipedia](http://en.wikipedia.org/wiki/Norm_%28mathematics%29#p-norm)
 * **Manhattan norm**: When `p = 1`
 * **Euclidean norm**: When `p = 2`
 * **Infinite norm**: Simply divide by weight of **largest magnitude dimension**.

Following command fails ( using `/data/lda/output-seq2sparse` as input )

    $ mahout seq2sparse -i /data/lda/output-seq2sparse -o /data/lda/output-seq2sparse-normalized -ow -a org.apache.lucene.analysis.WhitespaceAnalyzer -chunk 200 -wt tfidf -s 5 -md 3 -x 90 -ng 2  -ml 50 -seq -n 2 -nr 5
    Exception in thread "main" java.io.FileNotFoundException: File does not exist: hdfs://localhost:54310/data/lda/output-seq2sparse/df-count/data
    	at org.apache.hadoop.hdfs.DistributedFileSystem.getFileStatus(DistributedFileSystem.java:528)
    	at org.apache.hadoop.mapreduce.lib.input.SequenceFileInputFormat.listStatus(SequenceFileInputFormat.java:63)
    	at org.apache.hadoop.mapreduce.lib.input.FileInputFormat.getSplits(FileInputFormat.java:252)
		....SKIPPED....
    	at org.apache.hadoop.util.RunJar.main(RunJar.java:156)


However this works just fine ( using `/data/lda/output-seqdir` as input )

    $ mahout seq2sparse -i /data/lda/output-seqdir -o /data/lda/output-seq2sparse-normalized -ow -a org.apache.lucene.analysis.WhitespaceAnalyzer -chunk 200 -wt tfidf -s 5 -md 3 -x 90 -ng 2  -ml 50 -seq -n 2 -nr 5
    Running on hadoop, using .../hadoop-1.1.1/bin/hadoop and HADOOP_CONF_DIR=
    MAHOUT-JOB: ..../mahout-distribution-0.7/mahout-examples-0.7-job.jar
    14/03/24 21:35:55 INFO vectorizer.SparseVectorsFromSequenceFiles: Maximum n-gram size is: 2
    14/03/24 21:35:56 INFO vectorizer.SparseVectorsFromSequenceFiles: Minimum LLR value: 50.0
    14/03/24 21:35:56 INFO vectorizer.SparseVectorsFromSequenceFiles: Number of reduce tasks: 5
    14/03/24 21:35:57 INFO input.FileInputFormat: Total input paths to process : 1
    ...SKIPPED...
    14/03/24 21:45:11 INFO common.HadoopUtil: Deleting /data/lda/output-seq2sparse-normalized/partial-vectors-0
    14/03/24 21:45:11 INFO driver.MahoutDriver: Program took 556420 ms (Minutes: 9.273666666666667)

Running K-Means algorithm on the vectors we generated:

    $ mahout kmeans -i /data/lda/output-seq2sparse-normalized/tfidf-vectors -c /data/lda/output-kmeans-initialclusters -o /data/lda/output-kmeans-clusters -dm org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure -cd 1.0 -k 20 -x 20
    14/03/25 15:05:46 INFO common.AbstractJob: Command line arguments: {--clusters=[/data/lda/output-kmeans-initialclusters], --convergenceDelta=[1.0], --distanceMeasure=[org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure], --endPhase=[2147483647], --input=[/data/lda/output-seq2sparse-normalized/tfidf-vectors], --maxIter=[20], --method=[mapreduce], --numClusters=[20], --output=[/data/lda/output-kmeans-clusters], --startPhase=[0], --tempDir=[temp]}
    14/03/25 15:05:46 INFO common.HadoopUtil: Deleting /data/lda/output-kmeans-initialclusters
    14/03/25 15:05:46 INFO util.NativeCodeLoader: Loaded the native-hadoop library
    14/03/25 15:05:46 INFO zlib.ZlibFactory: Successfully loaded & initialized native-zlib library
    14/03/25 15:05:46 INFO compress.CodecPool: Got brand-new compressor
    14/03/25 15:05:49 INFO kmeans.RandomSeedGenerator: Wrote 20 Klusters to /data/lda/output-kmeans-initialclusters/part-randomSeed
    14/03/25 15:05:49 INFO kmeans.KMeansDriver: Input: /data/lda/output-seq2sparse-normalized/tfidf-vectors Clusters In: /data/lda/output-kmeans-initialclusters/part-randomSeed Out: /data/lda/output-kmeans-clusters Distance: org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure
    14/03/25 15:05:49 INFO kmeans.KMeansDriver: convergence: 1.0 max Iterations: 20 num Reduce Tasks: org.apache.mahout.math.VectorWritable Input Vectors: {}
    14/03/25 15:05:49 INFO compress.CodecPool: Got brand-new decompressor
    Cluster Iterator running iteration 1 over priorPath: /data/lda/output-kmeans-clusters/clusters-0
    14/03/25 15:05:50 INFO input.FileInputFormat: Total input paths to process : 5
    14/03/25 15:05:50 INFO mapred.JobClient: Running job: job_201403241418_0020
    14/03/25 15:05:51 INFO mapred.JobClient:  map 0% reduce 0%
	...
    14/03/25 15:06:31 INFO mapred.JobClient:  map 100% reduce 100%
	...
    14/03/25 15:06:31 INFO driver.MahoutDriver: Program took 45301 ms (Minutes: 0.7550166666666667)
    

Dump cluster points:

    $ mahout clusterdump  -b 10 -n 10  -dt sequencefile -d /data/lda/output-seq2sparse-normalized/dictionary.file-* -i /data/lda/output-kmeans-clusters/clusters-1-final -o ./kmeans-dump
    14/03/25 18:09:22 INFO common.AbstractJob: Command line arguments: {--dictionary=[/data/lda/output-seq2sparse-normalized/dictionary.file-*], --dictionaryType=[sequencefile], --distanceMeasure=[org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure], --endPhase=[2147483647], --input=[/data/lda/output-kmeans-clusters/clusters-1-final], --numWords=[10], --output=[./kmeans-dump], --outputFormat=[TEXT], --startPhase=[0], --substring=[10], --tempDir=[temp]}
    14/03/25 18:09:27 INFO clustering.ClusterDumper: Wrote 20 clusters
    14/03/25 18:09:27 INFO driver.MahoutDriver: Program took 4704 ms (Minutes: 0.0784)


KMeans using Cosine distance measure:

    $ mahout kmeans -i /data/lda/output-seq2sparse-normalized/tfidf-vectors -c /data/lda/output-kmeans-initialclusters -o /data/lda/output-kmeans-cosine-clusters -dm org.apache.mahout.common.distance.CosineDistanceMeasure -cd 0.1 -k 20 -x 20
    14/03/25 18:21:29 INFO common.AbstractJob: Command line arguments: {--clusters=[/data/lda/output-kmeans-initialclusters], --convergenceDelta=[0.1], --distanceMeasure=[org.apache.mahout.common.distance.CosineDistanceMeasure], --endPhase=[2147483647], --input=[/data/lda/output-seq2sparse-normalized/tfidf-vectors], --maxIter=[20], --method=[mapreduce], --numClusters=[20], --output=[/data/lda/output-kmeans-cosine-clusters], --startPhase=[0], --tempDir=[temp]}
    14/03/25 18:21:29 INFO common.HadoopUtil: Deleting /data/lda/output-kmeans-initialclusters
    14/03/25 18:21:29 INFO util.NativeCodeLoader: Loaded the native-hadoop library
    14/03/25 18:21:29 INFO zlib.ZlibFactory: Successfully loaded & initialized native-zlib library
    14/03/25 18:21:29 INFO compress.CodecPool: Got brand-new compressor
    14/03/25 18:21:33 INFO kmeans.RandomSeedGenerator: Wrote 20 Klusters to /data/lda/output-kmeans-initialclusters/part-randomSeed
    14/03/25 18:21:33 INFO kmeans.KMeansDriver: Input: /data/lda/output-seq2sparse-normalized/tfidf-vectors Clusters In: /data/lda/output-kmeans-initialclusters/part-randomSeed Out: /data/lda/output-kmeans-cosine-clusters Distance: org.apache.mahout.common.distance.CosineDistanceMeasure
    14/03/25 18:21:33 INFO kmeans.KMeansDriver: convergence: 0.1 max Iterations: 20 num Reduce Tasks: org.apache.mahout.math.VectorWritable Input Vectors: {}
    14/03/25 18:21:33 INFO compress.CodecPool: Got brand-new decompressor
    Cluster Iterator running iteration 1 over priorPath: /data/lda/output-kmeans-cosine-clusters/clusters-0
    14/03/25 18:21:33 INFO input.FileInputFormat: Total input paths to process : 5
    14/03/25 18:21:34 INFO mapred.JobClient: Running job: job_201403241418_0022
    14/03/25 18:21:35 INFO mapred.JobClient:  map 0% reduce 0%
    ....SKIPPED....
    14/03/25 18:24:28 INFO driver.MahoutDriver: Program took 178941 ms (Minutes: 2.98235)
    

Dump cluster points:

    $ mahout clusterdump  -b 10 -n 10  -dt sequencefile -d /data/lda/output-seq2sparse-normalized/dictionary.file-* -i /data/lda/output-kmeans-cosine-clusters/clusters-4-final -o ./kmeans-cosine-dump
    14/03/25 18:26:06 INFO common.AbstractJob: Command line arguments: {--dictionary=[/data/lda/output-seq2sparse-normalized/dictionary.file-*], --dictionaryType=[sequencefile], --distanceMeasure=[org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure], --endPhase=[2147483647], --input=[/data/lda/output-kmeans-cosine-clusters/clusters-4-final], --numWords=[10], --output=[./kmeans-cosine-dump], --outputFormat=[TEXT], --startPhase=[0], --substring=[10], --tempDir=[temp]}
    14/03/25 18:26:10 INFO clustering.ClusterDumper: Wrote 20 clusters
    14/03/25 18:26:10 INFO driver.MahoutDriver: Program took 3630 ms (Minutes: 0.0605)
    

Fuzzy KMeans

    $ mahout fkmeans -i /data/lda/output-seq2sparse-normalized/tfidf-vectors -c /data/lda/output-fkmeans-squared-initialclusters -o /data/lda/output-fkmeans-squared-clusters -cd 1.0 -k 20 -m 2 -ow -x 20 -dm org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure


Problems with KMeans

 * overlapping ( can be handled with Fuzzy KMeans )
 * non-circular distribution
 * not hierarchical
 

Dirichlet clustering

DisplayDirichlet clustering

    $ mahout org.apache.mahout.clustering.display.DisplayDirichlet
    14/03/28 14:58:30 WARN driver.MahoutDriver: No org.apache.mahout.clustering.display.DisplayDirichlet.props found on classpath, will use command-line arguments only
    14/03/28 14:58:36 INFO display.DisplayClustering: Generating 500 samples m=[1.0, 1.0] sd=3.0
    14/03/28 14:58:36 INFO display.DisplayClustering: Generating 300 samples m=[1.0, 0.0] sd=0.5
    14/03/28 14:58:36 INFO display.DisplayClustering: Generating 300 samples m=[0.0, 2.0] sd=0.1
    14/03/28 14:58:53 INFO driver.MahoutDriver: Program took 23027 ms (Minutes: 0.3837833333333333)
    

*generative algorithm*: fit the mode to the data. using the model, that data can be generated which fits the model. example: LDA

*discriminative algorithm*: fit the data to the model viz. split the data into k sets based on some distance metric. example: hierarchical, k-means, SVM etc.



Generate matrix:

    mahout-distribution-0.9$ bin/mahout rowid -i /data/clustering/reuters-out-sparse/tf-vectors -o /data/clustering/reuters-out-rowid/
    Running on hadoop, using ...hadoop-1.1.1/bin/hadoop and HADOOP_CONF_DIR=
    MAHOUT-JOB: ...mahout-distribution-0.9/mahout-examples-0.9-job.jar
    14/03/31 12:49:36 INFO common.AbstractJob: Command line arguments: {--endPhase=[2147483647], --input=[/data/clustering/reuters-out-sparse/tf-vectors], --output=[/data/clustering/reuters-out-rowid/], --startPhase=[0], --tempDir=[temp]}
    14/03/31 12:49:37 INFO util.NativeCodeLoader: Loaded the native-hadoop library
    14/03/31 12:49:37 INFO zlib.ZlibFactory: Successfully loaded & initialized native-zlib library
    14/03/31 12:49:37 INFO compress.CodecPool: Got brand-new compressor
    14/03/31 12:49:37 INFO compress.CodecPool: Got brand-new compressor
    14/03/31 12:49:39 INFO vectors.RowIdJob: Wrote out matrix with 21578 rows and 57545 columns to /data/clustering/reuters-out-rowid/matrix
    14/03/31 12:49:39 INFO driver.MahoutDriver: Program took 3257 ms (Minutes: 0.054283333333333336)
    

Mahout 0.7

 * dirichlet
 
 * kmeans / fkmeans:  throwing errors with heap space

Mahout 0.9

 * dirichlet doesn't exist

 * kmeans / fkmeans work better without throwing any errors



## clusterpp

Set env variables

    DISTMETRIC=org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure
    TFIDF_VEC=/data/clustering/reuters-out-sparse/tfidf-vectors
    INITCLUSTERS=/data/clustering/reuters-out-kmeans-initialclusters
    CLUSTERS=/data/clustering/reuters-out-kmeans-clusters

Run kmeans

    $ hadoop fs -rmr /data/clustering/reuters-out-kmeans-clusters
    $ mahout kmeans -cl -cd 1.0 -k 20 -x 20 -dm $DISTMETRIC -i $TFIDF_VEC -c $INITCLUSTERS -o $CLUSTERS
    Running on hadoop, using ...hadoop-1.1.1/bin/hadoop and HADOOP_CONF_DIR=
    MAHOUT-JOB: ...mahout-distribution-0.9/mahout-examples-0.9-job.jar
    14/03/31 15:08:33 INFO common.AbstractJob: Command line arguments: {--clusters=[/data/clustering/reuters-out-kmeans-initialclusters], --convergenceDelta=[1.0], --distanceMeasure=[org.apache.mahout.common.distance.SquaredEuclideanDistanceMeasure], --endPhase=[2147483647], --input=[/data/clustering/reuters-out-sparse/tfidf-vectors], --maxIter=[20], --method=[mapreduce], --numClusters=[20], --output=[/data/clustering/reuters-out-kmeans-clusters], --startPhase=[0], --tempDir=[temp]}
    14/03/31 15:08:33 INFO common.HadoopUtil: Deleting /data/clustering/reuters-out-kmeans-initialclusters
    14/03/31 15:08:33 INFO util.NativeCodeLoader: Loaded the native-hadoop library
    .... OUTPUT SKIPPED ...
    14/03/31 15:10:04 INFO driver.MahoutDriver: Program took 91562 ms (Minutes: 1.5260333333333334)
    
    
Run clusterpp

    $ mahout clusterpp -i /data/clustering/reuters-out-kmeans-clusters -o /data/clustering/reuters-out-clusterpp -xm mapreduce -ow


## Classification

The data available can be modeled in terms of records, fields and target variables:

    Record(field1, field2, ... fieldN) -> targetVariable
	
	OR
	
	(features or predictor variables) -> targetVariable


Learning process

    List(features, target) ==> learning algorithm ==> model
	
Classification process

	List(features) --> model ==> target
	

Kinds of Predictor Variables

 * Continuous ( infinite )
 * Categorical ( finite discreet )
 * Word-like ( discreet infinite single words)
 * Text-like


Running and understanding SGD

    $ mahout cat donut.csv
    $ mahout trainlogistic --input donut.csv --output ./model --target color --categories 2 --predictors x y --types numeric --features 20 --passes 100 --rate 50
    20
    color ~ -0.149*Intercept Term + -0.701*x + -0.427*y
          Intercept Term -0.14885
                       x -0.70136
                       y -0.42740
    0 0 0 0 0 0 0 0 0 0 -0.701362221 0 0 -0.148846792 0 0 0 -0.427403872 0 0
	$ mahout runlogistic --input donut.csv --model ./model --auc --confusion
    AUC = 0.57
    confusion: [  [ 27.0,  13.0],
	              [  0.0,   0.0]  ]
    entropy:   [  [ -0.4, -0.3 ],
	              [ -1.2, -0.7 ]  ]

AUC - [area under curve](http://www.mathwords.com/a/area_under_a_curve.htm)

confusion - [confusion matrix](http://en.wikipedia.org/wiki/Confusion_matrix)

entropy 

Add more predictors and passes

    $ mahout trainlogistic --input donut.csv --output model --target color --categories 2 --predictors x y a b c --types numeric --features 20 --passes 100 --rate 50
    20
    color ~ 7.068*Intercept Term + 0.581*a + -1.369*b + -25.059*c + 0.581*x + 2.319*y
          Intercept Term 7.06759
                       a 0.58123
                       b -1.36893
                       c -25.05945
                       x 0.58123
                       y 2.31879
    0 0 0 0 0 -1.368933989 0 0 0 0 0.581234210 0 0 7.067587159 0 0 0 2.318786209 0 -25.059452292

Results improve this time

    $ mahout runlogistic --input donut.csv --model ./model --auc --confusion
    AUC = 1.00
    confusion: [[27.0, 1.0], [0.0, 12.0]]
    entropy: [[-0.1, -1.5], [-4.0, -0.2]]

Running on other data

    $ mahout runlogistic --input donut-test.csv --model ./model --auc --confusion
    AUC = 0.97
    confusion: [[24.0, 2.0], [3.0, 11.0]]
    entropy: [[-0.2, -2.8], [-4.1, -0.1]]


### Different Classification Algorithms in Mahout

SGD / Logistic Regression Algorithms:

 * OnlineLogisticRegression
 * AdaptiveLogisticRegression
 * CrossFoldLearner


Naive-Bayes Algorithm

Complimentary Naive-Bayes

Hidden Markov Model

Random Forest

Others:

[What happened to SVM implementations in Mahout ?](http://stackoverflow.com/questions/10482646/recently-svm-implementation-was-added-into-mahout-i-am-planning-to-use-svm-an)




## Text Mining

Discussion on [Calculate Term-Cooccurence](http://lucene.472066.n3.nabble.com/Calculate-Term-Co-occurrence-Matrix-td1226990.html)

[Apache Mahout Collocations](https://cwiki.apache.org/confluence/display/MAHOUT/Collocations)

High Frequency Terms/Phrases at the Index level [JIRA Ticket LUCENE-474](https://issues.apache.org/jira/browse/LUCENE-474)

[What is the easiest way to implement terms association mining in Solr?](http://stackoverflow.com/questions/7393908/what-is-the-easiest-way-to-implement-terms-association-mining-in-solr)


[Topic Modeling](http://www.cs.princeton.edu/~blei/topicmodeling.html)


## References:

 * [Machine Learning and Data Mining in Ruby and R](http://www.williamhertling.com/2010/04/machine-learning-and-data-mining-in.html)

 * [Machine Learning with Apache Mahout](http://www.slideshare.net/danielglauser/machine-learning-with-apache-mahout)

 * [Introduction to Apache Mahout](http://www.slideshare.net/gsingers/intro-to-apache-mahout)

 * [Apache Taste](http://people.apache.org/~isabel/site/taste.html)
 
 * [Apache Mahout Recommender Tutorial](http://www.slideshare.net/Cataldo/tutoria-mahout-recommendation)
 
 * [First Steps with Apache Mahout - Classification](http://skife.org/mahout/2013/02/14/first_steps_with_mahout.html)

 * [Apache Mahout and MySQL](http://ssc.io/deploying-a-massively-scalable-recommender-system-with-apache-mahout/)
 
 * [Correlation explained](http://www.socialresearchmethods.net/kb/statcorr.php)

 * [Third Generation Tools for Realizing Machine Learning Algorithms](http://strataconf.com/strata2013/public/schedule/detail/27390)

 * [Selecting an appropriate similarity metric & assessing the validity of a k-means clustering model](https://stackoverflow.com/questions/8102515/selecting-an-appropriate-similarity-metric-assessing-the-validity-of-a-k-means)

 * [An Introduction To Mahout's Logistic Regression SGD Classifier](https://blog.trifork.com/2014/02/04/an-introduction-to-mahouts-logistic-regression-sgd-classifier/)

 * [Mahout Scala](http://weatheringthrutechdays.blogspot.com.br/2013/07/scala-dsl-for-mahout-in-core-linear.html)

 * [Mahout SGD Example](http://skife.org/mahout/2013/02/14/first_steps_with_mahout.html)

 * [Converting Similariy to Distance and vice-versa](http://stackoverflow.com/questions/4064630/how-do-i-convert-between-a-measure-of-similarity-and-a-measure-of-difference-di)

 * [Probability Distributions in R](http://www.cyclismo.org/tutorial/R/probability.html)


