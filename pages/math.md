---
layout: page
title: "Mathematics"
description: "Notes on Mathematics"
---

{% include JB/setup %}

# Mathematics

## Functions and Mappings

 * Domain: All possible input argument values

 * Co-Domain: The domain in which the function's image would map

 * Image: Output of the function applied to domain arguments

 * Surjective: Image and co-doamain are equal

 * Injective: Every element of the codomain is mapped to by at most one element of the domain.

 * Bijection, Injection, Surjection, Onto, one-to-one, argument, image, domain, codomain: [Bijection, injection and surjection](http://en.wikipedia.org/wiki/Bijection,_injection_and_surjection) on Wikipedia


## Probabililty 

Rules of Addition: A or B occuring together

 * Exclusive events

      P(A or B) = P(A) + P(B)

 * Non-exclusive events

      P(A or B) = P(A) + P(B) - P(A and B)

### Conditional Probability
 
   Probability of event E is called the *conditional probability* of E given that F has already occured and is denoted by `P(E|F)`:
   
    P(E|F) = n(E n F) / n(F) = P(E n F) / P(F)
   
    Here: (A n B) means ( A intersection B), and (A u B) means ( A union B)

    Properties:

    Property 1:
    S = sample space; E and F are events in space S.

    P(S|F) = P(F|F) = 1

    Property 2:
    A and B are events in space S. F is an event such tat P(F) = 0, then:

    P( (A u B) | F) = P(A|F) + P(B|F) - P( (A n B) | F )
    
    P( (A u B) | F) = P( (A u B) n F ) / P(F)
                    = P( (A n F) u (B n F) ) / P(F)
                    = ( P( P(A n F) + P(B n F) - P(A n B n F) ) / P(F)
                    = P(A n F) / P(F) + P(B n F) / P(F) - P(A n B n F) / P(F)
                    = P(A|F) + P(B|F) - P( A n B | F)

    If A and B are disjoint events:

    P( (A u B) | F) = P(A|F) + P(B|F)

    Property 3:

    P(E'|F) = 1 - P(E|F)

    P(S|F) = 1 = P( (E u E') | F ) = P(E|F) + P(E'|F) => P(E'|F) = 1 - P(E|F)
		    

 * Multiplication Rule

 * Independence of Events

 * Random variable and its probability distrubtion
 
 * Mean and variance of a probability distrubtion
 
 * Discrete probability distribution - Binomial distribution

 * Bayes Theorem
 

 * [Gaussian or Normal Distribution](http://en.wikipedia.org/wiki/Normal_distribution)

 * [Log Likelihood Ratio](http://tdunning.blogspot.in/2008/03/surprise-and-coincidence.html)

 * [Mahout - Log likelihood test explanation](https://mail-archives.apache.org/mod_mbox/mahout-user/201105.mbox/%3CBANLkTi=TeA56NLOjmquveNxwB_C5HQAFEQ@mail.gmail.com%3E)
