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
	  


## References:

 * [Machine Learning and Data Mining in Ruby and R](http://www.williamhertling.com/2010/04/machine-learning-and-data-mining-in.html)

 * [Machine Learning with Apache Mahout](http://www.slideshare.net/danielglauser/machine-learning-with-apache-mahout)

 * [Introduction to Apache Mahout](http://www.slideshare.net/gsingers/intro-to-apache-mahout)

 * [Apache Taste](http://people.apache.org/~isabel/site/taste.html)
 
 * [Apache Mahout Recommender Tutorial](http://www.slideshare.net/Cataldo/tutoria-mahout-recommendation)
 
 * [First Steps with Apache Mahout - Classification](http://skife.org/mahout/2013/02/14/first_steps_with_mahout.html)

 * [Apache Mahout and MySQL](http://ssc.io/deploying-a-massively-scalable-recommender-system-with-apache-mahout/)
 
 
