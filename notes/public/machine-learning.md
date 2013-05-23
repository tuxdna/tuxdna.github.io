# Machine Learning


## What is Machine Learning?

1959 - Field of study that gives computers the ability to learn without being explicitly programmed.

1998 - A computer program is said to learn from experience E with respect to some task T and some performance P, if its performance on T, as measured by P, improves with experience E.


## Kinds of Learning

### Supervised - given a dataset where right answers were known

 * Regression - predict continuous valued output

   * linear regression

    * with one variable - univariate

    * multiple variables - multivariate

    * hypotheses, cost function and its minimization

   * gradient descent algorithm; convex function; batch gradient descent

   * normal equation

 * Classification - discreete valued output

### Unsupervised

#### Clustering

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


## References:

 * [Machine Learning and Data Mining in Ruby and R](http://www.williamhertling.com/2010/04/machine-learning-and-data-mining-in.html)


