---
layout: page
title: "Information Retrieval"
description: "Basics of Information Retrieval"
---

{% include JB/setup %}

# Information Retrieval

Read the paper on information retrieval by Xapian project: term frequency, inverted document frequency

    bm25 weight:  w(t) = log( p(1-q) / q(1-p) )
    
Corpus <-> IR System <-> Query : Relevant documents

Retrieval based on:

 * Proper subject
 * Recent documents
 * Trusted documents
 * Relevant


Text Processing:

 * Stop word removal - the common words which don't contribute to distinction among documents: a, an the, etc.
 * Stemming: reducing the words to a common root or a stem

Indexing:

 * constrct an inverted index - TF, IDF
  - inverted index - word to document pointer

Searching:

Ranking:


Query Operations:

 * Query expansion
 * Quer transformation

Classes of retrieval models

 * boolean ( set theoretic )
 * vector space ( statistical / algebraic )
 * probabilistic


Boolean Model:

 * A document is represented as a "set of words"

Statistical Model:

 * A document is represented as a "bag of words" with frequencies attached.
 * Bag = a set that allows multiple occurences of a word.

Vector-Space Model:

     f = frequency of term in document = [0, T]
     tf = normalized term frequency = f / max(f in document) = [0,1]
     df = document frequency of term = number of documents that contain the term = [0,N]
     idf = inverse document frequency of term = log(N/df) : where N is total number of documents = [0,inf)
    

# References

 * [Page Rank explained in detail](http://www.math.cornell.edu/~mec/Winter2009/RalucaRemus/Lecture3/lecture3.html)

 * [IR Course](http://www.cs.utexas.edu/users/mooney/ir-course/)

 * [Xapian - Introduction to IR](http://xapian.org/docs/intro_ir.html)

