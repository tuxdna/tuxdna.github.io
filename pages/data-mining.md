---
layout: page
title: "Data Mining"
description: "Notes on Data Mining"
---

{% include JB/setup %}


# Data Mining

## What is Data Mining?

It refers to extracting or mining knowledge from large amounts of data.

Steps in Data Mining:
* Data cleaning
* Data integration
* Data selection
* Data transformation
* Data mining
* Pattern evaluation
* Knowldege presentation

Data Mining is an interdiciplinary field which is a confluence of:

* Database systems
* Statistics
* Machine Learning
* Visualization
* Information Science


## What kind of patterns can be mined?

* Concept/Class Description: Characterization and Discrimination
* Mining Frequent Patterns, Associations, and Correlations
* Classification and Prediction
* Cluster Analysis
* Outlier Analysis
* Evolution Analysis

## Are all patterns interesting?

### What makes a pattern interesting?
* A pattern is interesting if it is easily understood by humans, is valid, is useful and is novel.
* A pattern is also interesting if it validates a hypothesis that the user sought to confirm.

Two elementary measures of interestingness:
* `Support(X => Y)    = P(X u Y)` - Probability that a transaction contains both X and Y.
* `Confidence(X => Y) = P(Y | X)` - Prpbabiity that a transaction with X also contains Y.

### Can a data mining system generate all of the interesting patterns?
It is often unrealistic and inefficient to generate all of the possible patterns.

### Can a data mining system generate only interesting patterns?
This is an optimization problem and is highly desirable, however, such an optimizaion remains a challenging issue in data mining.


## Data Summarization
### Measuring the Central Tendency
* Geometric Mean

