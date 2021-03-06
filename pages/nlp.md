---
layout: page
title: "Natural Language Processing"
description: "NLP"
---

{% include JB/setup %}

## Language Translator

### Problem Statement:

Enormous data is coming up on the Internet on a daily basis. Since people from different regions of the world are getting the hold of the Internet platform, they express ( or try to express ) in their native language. This leads to a lot of incomprehensible information which is useless until it is presented in a language undersatndible by the reader. If a person surfs Internet, it is normal that he faces text in various different languages. It will be so useful if the language of that text is automatically determined and threrafter translated into the choice of language of the reader.

Abstract Solution:

Build a set of pattern-database for various languages.

Suppose the languages set is represented as :

    L = { language : language in which some text is present on the Internet }

Now for each language  l in set L, there will be a corresponding pattern-database represented as:

    D = { pattern : pattern that corresponds to a language l in L }

So to achieve the above set D, we need a function which maps L -> D.

For each l in L, and d in D:

    f (l) = d


Language Identification <http://www.faganfinder.com/translate/>

Unknown Language Identification <http://complingone.georgetown.edu/~langid/>

<http://www.translation-guide.com/language_identification.htm>


Some concepts:


 * Normalization
   * Assymetric
   * Symmetric
 * Case folding
 * Lemmatization
 * Morphology
 * Stemming
   - Porter's Algorithm ( chop / replace suffixes )

 * Edit Distance
   - Levenstein ( substitution costs 2, insert/delete 1 )
 * Sequence Alignments
   - Backtrace for optimal alignment paths
 * Weighted Min-Edit distance


Lucene Matrix

NLP Techniques

 * Viterbi
 * Naive Bayes, Maxent Classifiers
 * N-gram language modeling
 * Statistical Parsing
 * Inverted Index, TF-IDF, Vector Models of meaning

Practical applications

 * Information Extraction
 * Spelling correction
 * Information Retrieval
 * Sentiment Analysis

## Techniques

**LDA**

 * [Introduction to Latent Dirichlet Allocation](http://blog.echen.me/2011/08/22/introduction-to-latent-dirichlet-allocation/)

 * [Latent Drichlet Allocation](https://en.wikipedia.org/wiki/Latent_Dirichlet_allocation)


LDA in Spark:

 * [SPARK-953](https://spark-project.atlassian.net/browse/SPARK-953)
 * [SPARK-957](https://spark-project.atlassian.net/browse/SPARK-957)
 * [LDA with Gibbs Sampling](https://gist.github.com/waleking/5477002)
 * [LDA on local](https://gist.github.com/mijia/4224451)

Topic Modeling in Python

 * [gensim - topic modeling for humans](http://radimrehurek.com/gensim/index.html)

## Resources

[NLP Class](http://dhgarrette.github.io/nlpclass/)

[Which is most mature NLP tool](http://www.quora.com/Natural-Language-Processing/Which-NLP-engine-among-the-ones-below-is-most-mature-and-should-be-used-by-a-startup-for-its-NLP-needs)

[Text Blob](https://textblob.readthedocs.org/en/latest/)

[MLBase](http://mlbase.org/)

