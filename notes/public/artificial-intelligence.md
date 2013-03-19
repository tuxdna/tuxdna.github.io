# Artificial Intelligence

## Topic: Bayes Networks

Binary Events, Probability, Simple Bayes Networks, Conditional Independence,
Bayes Networks, D-Separation, Parameter Counts, Independence in Bayes Networks

### Bayes Networks - Diagnostics, Prediction, Machine Learning

      Also used in - finance, google, robotics
      Particle filters, HMM, MDP-POMDPs, KALMAN filters

### Topic: Probabilities

    probability of independent events: P(x,y) = P(x)*P(y)

#### Probability of dependent events

     total probability: after an event X, another event Y happens
      P(Y) = P(Y|X)*P(X) + P(Y|~X)*P(~X)

#### Joint probabilities

#### Bayes Rule:

      P(A|B) = P(B|A) * P(A) / P(B)
      OR
      POSTERIOR = LIKELIHOOD * PRIOR / MARGINAL_LIKELIHOOD

#### Conditional Independence

      P(A|BC) = P(A|C) - event A is independent of event B but depends on C

#### General Bayes network

      Number of paramaters for a node = 2^incoming_nodes

#### D-Separation
      

### Topic: Probabilistic Inference

    INPUT or EVIDENCE -> HIDDEN VARIABLES -> OUTPUT or QUERY

    P(Q1, Q2, ... | E1 = e1, E2 = e2...) 

Speeding up Enumeration
 * Pulling out terms
 * Maximize independence
 * Bayesian networks are efficent for inference when 
   they are represented in Causal Direction

Variable Elimination
   - Joining factors

Approximate Inrefence
   - Sampling
   - rejection sampling
   - likelihood weighting

Gibbs Sampling
   - Markov Chain Monte Carlo - MCMC

Monty Hall Problem

Monty Hall Letter


## Predicitive Matching of Document Reviewers

For every Document and Topics, find the correlation among them.
 * Document d1 has k percentage of Topic t1
 * Document d1 has k percentage of Topic t2
 * Document d1 has k percentage of Topic t3 etc.

Important keywords:
 * precision
 * recall
 * response

Glossary: <http://ai.stanford.edu/~ronnyk/glossary.html>
