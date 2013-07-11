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

       * `T1, T1 = distance thresholds such that T1 > T2`

     * (2) Pick a point at random from S i.e. `A = S.random()`

     * (3) For each of the points P in S:

       * `if ( distance(A,P) > T1 ) ignore P else if ( distance(A,P) <= T1 ) select P`

       * `if ( distance(A,P) < T2) then S.remove(P)`

     * (4) Repeat 2-3 steps until S is empty

   * [K-Means Clustering](http://en.wikipedia.org/wiki/K-means_clustering)

     * (1) Take an initial set of k points as means

     * (2) Make k clusters by associating every point with the nearest mean-point.

     * (3) For each of the k clusters formed in previous step, find the centroid of the cluster.

     * (4) Repeat 2-3 steps until centroid have converged, or until a limit on iterations has reached.

        Step 2 is the expectation step, and step 3 is the maximization step. Therefore, this algorithm is also a variant of generalized [exptectation-maximization algorithm](http://en.wikipedia.org/wiki/Expectation-maximization_algorithm).


#### Recommender Systems

 * Collaborative Filtering

#### Reinforcement Learning


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
	  


### Basic Algorithm

Basic algorithm:

    for every item i that u has no preference for yet
      for every other user v that has a preference for i
        compute a similarity s between u and v
        incorporate v's preference for i, weighted by s, into a running average
    return the top items, ranked by weighted average
	
Basic algorithm with a user neighbourhood:

    for every other user w
      compute a similarity s between u and w
      retain the top users, ranked by similarity, as a neighborhood n

    for every item i that some user n has a perference for, but tha u has no preference for yet
      for every other user v in n that has a preference for i
        compute a similarity s between u and v
        incorporate v's preference for i, weighted by s, into a running average
    
    return the top items, ranked by weighted average

Kind of neighbourhood metrics:

 * fixed size

 * threshold based

It is also possible to infer values for missing preferences in Mahout. This is achieveable using `PreferenceInferer` implementation such as `AveragePreferenceInferer`.

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

Euclidean distance is geometric distance between two n-dimensional points. This is a distance metric, so to convert it into a similarity metric, it is difined as

    s = 1 / (1 + d )
	where s = similarity
	and d = euclidean distance
	
#### Cosine measure

Cosine measure is the `cos(theta)` of angle `theta` between two points with respect to originx. This is essentially implemented as Pearson Correlation metric in Mahout, mentioned above.

#### Spearman correlation

Spearman correlation - difining similarity by relative rank

#### Tanimoto coefficient

Also know as Jackard coefficent is: 

    tc = intersection of preferences / union of preferences

#### Log likelihood test

Log Likelihood test: an expression of how unlikely it is for two users to have so much overlap, given the total number of items out there and the number of items each user has a preference for.


### Components and their compatibility

Boolean Preference Data Model 

 * is not compatible with PearsonCorrelation / EuclideanDistance

 * is compatible with LogLikelihood
 

In case of zero difference in estimate and actual preference, by the evauluator, we can always do a precision / recall evaluation -- using IRStats evaluator.

### Slope One recommender

Algorithm


    Preprocessing

      for every item i
        for every other item j
          for every user u expressing preference for both i and j
            add the difference in u's preference for i and j to an average

    SlopeOne Algorithm(u)
    
      for every item i the user u expresses no preference for
        for every item j that user u expresses a preference for
          find the average preference between j and i
          add this diff to u's preference value for j
          add this to a running average
       return the top items, raned by these averages


    How to implement?
    
    Following Code is Scala'ish
    

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
    

SlopeOne Gotchas

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


## References:

 * [Machine Learning and Data Mining in Ruby and R](http://www.williamhertling.com/2010/04/machine-learning-and-data-mining-in.html)

 * [Machine Learning with Apache Mahout](http://www.slideshare.net/danielglauser/machine-learning-with-apache-mahout)

 * [Introduction to Apache Mahout](http://www.slideshare.net/gsingers/intro-to-apache-mahout)

 * [Apache Taste](http://people.apache.org/~isabel/site/taste.html)
 
 * [Apache Mahout Recommender Tutorial](http://www.slideshare.net/Cataldo/tutoria-mahout-recommendation)
 
 * [First Steps with Apache Mahout - Classification](http://skife.org/mahout/2013/02/14/first_steps_with_mahout.html)

 * [Apache Mahout and MySQL](http://ssc.io/deploying-a-massively-scalable-recommender-system-with-apache-mahout/)
 
 * [Correlation explained](http://www.socialresearchmethods.net/kb/statcorr.php)

