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

