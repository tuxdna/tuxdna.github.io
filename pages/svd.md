---
layout: page
title: "SVD"
description: "Notes on SVD"
---

{% include JB/setup %}

# Singlular Value Decomposition

**What is [Singular value decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition) ?**

Given a matrix `M` of order `m x n` over a field K, ( K can be real or complex ), there exists a factorization of the form:

    M = U x S x V*
	
Here the matrix M is decomposed into three matrices which are:

 * `U`  is a `m x m` unitary matrix

 * `S`  is a `m x n` rectangular diagonal matrix with non-negative real numbers on diagonal

 * `V*` ( conjugate transpose of `V` ) is a `n x n` unitary matrix

The diagonal entries of `S` are called singular values.


**How to think it in visual terms?**

The wikipedia article explains it in terms of three operations `V*`, `S`, and `U`. 

 * `V*` is an initial rotation
 * `S`  is a scaling along the coordinate axes
 * `U`  is a final rotation


**Examples**

A simple example in Octave follows

Sample data file:

    $ cat svd-octave.dat
    1 1 1.0
    1 2 1.0
    1 7 1.0
    2 2 1.0
    2 3 1.0
    3 1 1.0
    4 4 1.0
    4 5 1.0
    4 6 1.0
    5 4 1.0
    5 6 1.0
    5 7 1.0

Finding SVD in Octave:

    Z = load('svd-octave.dat','-ascii')
	A = spconvert(Z)
	clear Z
	B = full(A)
	[U, S, V] = svd(B)

Sample run through:


    octave:23> Z = load('svd-octave.dat');
    octave:24> A = spconvert(Z)
    A =

    Compressed Column Sparse (rows = 5, cols = 7, nnz = 12 [34%])

      (1, 1) ->  1
      (3, 1) ->  1
      (1, 2) ->  1
      (2, 2) ->  1
      (2, 3) ->  1
      (4, 4) ->  1
      (5, 4) ->  1
      (4, 5) ->  1
      (4, 6) ->  1
      (5, 6) ->  1
      (1, 7) ->  1
      (5, 7) ->  1
    
    octave:25> B = full(A)
    B =
    
       1   1   0   0   0   0   1
       0   1   1   0   0   0   0
       1   0   0   0   0   0   0
       0   0   0   1   1   1   0
       0   0   0   1   0   1   1
    
    octave:26> [U,S,V] = svd(B)
    U =
    
       3.8846e-01   7.3615e-01   2.5786e-01   2.1279e-16   4.9060e-01
       1.1762e-01   4.2502e-01  -8.5164e-01  -1.7180e-16  -2.8325e-01
       9.0281e-02   2.6945e-01   3.6983e-01  -5.7735e-01  -6.7018e-01
       5.9636e-01  -4.2502e-01  -2.2395e-01  -5.7735e-01   2.8325e-01
       6.8664e-01  -1.5557e-01   1.4588e-01   5.7735e-01  -3.8693e-01
    
    S =
    
    Diagonal Matrix
    
       2.30278         0         0         0         0         0         0
             0   1.93185         0         0         0         0         0
             0         0   1.30278         0         0         0         0
             0         0         0   1.00000         0         0         0
             0         0         0         0   0.51764         0         0
    
    V =
    
       2.0790e-01   5.2054e-01   4.8181e-01  -5.7735e-01  -3.4691e-01   8.5825e-17   2.3675e-16
       2.1977e-01   6.0106e-01  -4.5579e-01  -1.5552e-16   4.0058e-01  -2.1285e-02  -4.7092e-01
       5.1076e-02   2.2000e-01  -6.5371e-01   4.8396e-17  -5.4720e-01   2.1285e-02   4.7092e-01
       5.5715e-01  -3.0053e-01  -5.9928e-02  -2.8189e-18  -2.0029e-01  -7.1703e-01  -2.0353e-01
       2.5897e-01  -2.2000e-01  -1.7190e-01  -5.7735e-01   5.4720e-01   2.1285e-02   4.7092e-01
       5.5715e-01  -3.0053e-01  -5.9928e-02  -5.8330e-17  -2.0029e-01   6.9574e-01  -2.6739e-01
       4.6687e-01   3.0053e-01   3.0991e-01   5.7735e-01   2.0029e-01   2.1285e-02   4.7092e-01

    octave:15> U * S * V'
    ans =
    
       1.0000e+00   1.0000e+00   4.2799e-17  -9.8923e-17  -2.0630e-16  -9.8923e-17   1.0000e+00
       2.8994e-16   1.0000e+00   1.0000e+00   1.9135e-16   4.7454e-17   1.9135e-16   4.2104e-16
       1.0000e+00   8.0804e-16   6.3736e-16   4.5225e-17   5.2543e-17   7.7277e-17  -4.4170e-16
      -3.8552e-16  -3.5372e-17  -2.4470e-16   1.0000e+00   1.0000e+00   1.0000e+00   6.6787e-16
      -3.4179e-17  -5.6844e-16   2.2321e-16   1.0000e+00   4.9946e-16   1.0000e+00   1.0000e+00


Another SVD Example:

     
    octave:19> M = [1 0 0 0 2; 0 0 3 0 0; 0 0 0 0 0; 0 4 0 0 0]
    M =
    
       1   0   0   0   2
       0   0   3   0   0
       0   0   0   0   0
       0   4   0   0   0
    
    octave:20> [U,S,V] = svd(M)
    U =
    
       0   0   1   0
       0   1   0   0
       0  -0   0  -1
       1  -0   0   0
    
    S =
    
    Diagonal Matrix
    
       4.00000         0         0         0         0
             0   3.00000         0         0         0
             0         0   2.23607         0         0
             0         0         0   0.00000         0
    
    V =
    
      -0.00000  -0.00000   0.44721   0.00000  -0.89443
       1.00000  -0.00000   0.00000   0.00000   0.00000
      -0.00000   1.00000   0.00000   0.00000   0.00000
       0.00000   0.00000   0.00000   1.00000   0.00000
       0.00000   0.00000   0.89443  -0.00000   0.44721
    

Using the matricies U, S and V, we can obtain the original matrix M:

    octave:28> U * S * V'
    ans =
    
       1.00000   0.00000   0.00000   0.00000   2.00000
       0.00000   0.00000   3.00000   0.00000   0.00000
       0.00000   0.00000   0.00000   0.00000   0.00000
       0.00000   4.00000   0.00000   0.00000   0.00000


Sparse SVD Example:


    octave:21> MS = sparse(M)
    MS =
    
    Compressed Column Sparse (rows = 4, cols = 5, nnz = 4 [20%])
    
      (1, 1) ->  1
      (4, 2) ->  4
      (2, 3) ->  3
      (1, 5) ->  2
    
    octave:22> [U, S, V] = svds(MS, 3)
    U =
    
       0.00000  -0.00000  -1.00000
      -0.00000  -1.00000   0.00000
       0.00000   0.00000  -0.00000
      -1.00000   0.00000   0.00000
    
    S =
    
    Diagonal Matrix
    
       4.0000        0        0
            0   3.0000        0
            0        0   2.2361
    
    V =
    
       3.9252e-17   1.5701e-16  -4.4721e-01
      -1.0000e+00   3.7290e-16   3.9252e-17
      -5.4953e-16  -1.0000e+00  -1.5701e-16
       9.8131e-18   3.9252e-17   1.9626e-17
       7.8505e-17   1.5701e-16  -8.9443e-01
    

Using the matricies U, S and V, we can obtain the original matrix MS. Note that the values are in close approximation to original the matrix M:

    octave:37> R = U * S * V' # Note that the real values are same as original values
    R =
    
       1.0000e+00  -1.8650e-15  -9.4424e-16  -3.5108e-16   2.0000e+00
      -7.4579e-16  -3.5818e-16   3.0000e+00  -3.5327e-16  -8.3656e-16
       1.7414e-16   1.3373e-15   4.7103e-16   1.1470e-17   3.0545e-16
      -6.8692e-16   4.0000e+00   1.6130e-16  -6.4812e-16   7.0654e-16

    octave:40> int8(R) # convert to integers
    ans =
    
      1  0  0  0  2
      0  0  3  0  0
      0  0  0  0  0
      0  4  0  0  0




## LSI - Latent Semantic Indexing

[SVD and LSI Tutorial 1: Understanding SVD and LSI ](http://blog.csdn.net/pi9nc/article/details/8100410) and its [PDF](http://manuel.midoriparadise.com/public_html/svd-lsi-tutorial.pdf)
