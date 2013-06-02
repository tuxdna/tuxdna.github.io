---
layout: page
title: "Functional Programming"
description: "FP Concepts"
---

{% include JB/setup %}

# Functional Programming

Functional programming at a glance
 * functional paradigm or style
 * program is viewed as a collection of expression
 * each expression has a type
 * computation is drive by evalutaiton of expessions
  - contrast with imperative programming driven by squential statemnents
 * functions only apply on the data supplied
  - not on the global state ( or global variables )
  - idempotent - a function with given parameter values will always have the same return value or effect
  - functions can be passed as data to other functions - higher order functions

Haskell

 - general purpose, pure functional, non strict
 - strongly typed, type inference, ensure program correctness
 - high order functions, polymorphic types
 - built-in memory management

Pure functional

 - no assignments
 - vairables bound to expressions and not memory locations, immutable by default
 - no side effects

Non strict

 - evaluation order of expressions - closely related to semantics
 - outer to inner evaluations - a + ( b / ( ( c + d ) - f ) ) - evalauation starts at a
 - lazy evaluation - nothing is evaluated until required

GHC suite

Haskell on Fedora
