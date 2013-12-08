---
layout: page
title: "Scala"
description: "Notes on Scala Programming Language"
---

{% include JB/setup %}

# Scala Programming Language

## Introduction to Scala
### What is Scala?

What is Scala?

The name Scala stands for *"scalable language"*. The language is so named because it was designed to grow with the demands of its users.

### What makes Scala a *Scalable Language* ?

Statically typed language with OOP + FP both.

 * Fast, expressive, and peasant to use.
 * Excellent type inference.
 * Runs on JVM.

### Whats more?

Scala is compatible with Java
 * Scala is concise
 * Scala is high level
 * Scala is statically typed ( vs dynamically typed )

## Does Scala make you a better Java programmer?
 
This is a very interesting question. For the one thing is that yes Scala does make you a better programmer with its beautiful and concise syntax for FP as compared to Java. For second, when you talk about becoming a better Java programmer. Yes it does. Now, I try to think of functions in Java as function objects, which can be passed around and, can be treated as first order functions.

### What can you do with Scala today?

 * Write web applications: [Play](http://www.playframework.com/) and [Lift](http://liftweb.net/) web frameworks
 * Write code that scales to huge amounts of data: [Spark Project](http://spark-project.org/) and  [Scalding](https://github.com/twitter/scalding)
 * Process huge number of concurrent tasks: [Akka](http://akka.io/) 

 * Natural Language Processing and Machine Learning: [ScalaNLP](http://www.scalanlp.org/)

 * And anything you could do in Java, now more concisely :-)

## Setting up Scala

Install the Scala Complier

    yum install scala

Install your faviourite Editor / IDE

    yum install emacs

OR install Eclipse ( ScalaIDE )

Scala compiler is 
 * `scalac` ( just like javac command )
 * `scala` ( just like java command )
 * `fsc` ( fast scala compiler )

## Absolute Scala basics

### Hello Scala World

    object HelloWorld {
      def main(args: Array[String]) = {
        println("Hello Scala World!")
      }
    }


### Compile and run Hello Scala World

    $ scalac helloworld.scala
    $ ls
    helloworld.scala
    HelloWorld.class
    HelloWorld$.class
    $ scala HelloWorld
    Hello Scala World!


### Values and Variables

#### An example in Ruby ( or maybe Python ) a dynamically typed language

    counter = Counter.new
    counter = AtomicCounter.new
    counter = File.new # this works here!

### Scala's static type system, avoids runtime overhead of dynamic types. The method dispatch is fast in a statically typed language.

    var counter = new Counter()
    counter = new AtomicCounter() // this has to be a Counter
    counter = new File() // this doesn't work in Scala

### Data Types

#### Almost everything is same as Java

Basic Data Types: ( all integers are signed two's complement )
 * Integers: *Byte* (8bit), *Short* (16bit), *Int* (32bit), *Long* (64bit)
 * *Char* (16 bit unicode character), *String* (squence of Chars)
 * Reals:  *Float* (32bit), *Double* (64bit)
 * *Boolean*: true / false

Literals
 * Basic data types: `1`, `0.123`, `12L`, `'a'`, `"String"`
 * Symbol literal: `'identifier`

### More Concepts

Data Containers
* Array
* List
* Set
* Map
* Tuple

Programming Abstraction Tools
* Class
* Object
* Scala App
* Package

### Expressions

Every thing is an expression
* Basic expression: 1+2
* An assignment is an expression
* A function is an expression

### Control Constructs

Control Constructs in Scala
* if-else
* while
* do-while
* for
* match-case
* try-catch-finally

## Functional Paradigm in Scala
### Matematical Logic

[Lambda Calculus](http://en.wikipedia.org/wiki/Lambda_calculus)

<img src="http://upload.wikimedia.org/wikipedia/commons/3/3a/Greek_lc_lamda_thin.svg" height="10%"/>

## Factorial Function

[Factorial](http://en.wikipedia.org/wiki/Factorial) expressed as mathematical logic

<img src="http://upload.wikimedia.org/math/a/1/9/a193e2aad488f09d34cbd01bcb6b9504.png"/>

### FP is guided by two main ideas:

Functions are *fist-class values*

Functions have *no side effects* i.e. they can be replaced with their values


### Hallmarks of Functional Programming

 * mapping
 * filtering
 * folding
 * reducing

## Object Oriented Programming in Scala

### Object Oriented

 * Decompose the problem into entities and interactions among entities
 * Each entity and their interaction is represented using class/object
  * internal state is the member variables
  * interactions are the member functions

### Functions

    def factorial(n:Int): Int =
      if(n<=0) 1 else n*factorial(n-1)

#### Placeholder syntax
#### Partially applied functions
#### Closures

### Traits

    trait PartTime {
      // trait definition
    }


### Classes

    class Employee(name: String, age: Int) {
      override def toString = name + ", " + age
    }
    class Supervisor(name: String, age: Int
      ) extends Employee(name, age) with PartTime
      {
      override def toString = name + ", " + age
    }

When a class doesn't extend anyother class, scala.AnyRef class is implicitly used as the parent class.

### Objects

    object Employee {
      override def toString = name + ", " + age
    }

### Packages

Example: `pacakge-example.scala`

    package in.tuxdna.scala
    class Employee(name: String, age: Int) {
      override def toString = name + ", " + age
    }

    object Main extends App {
      val emp1 = new Employee("Tom", 21)
      println("Employee 1: "+emp1)
    }

Output:

    $ scalac pacakge-example.scala
    Employee 1: Tom, 21

### Features to be convered later

There is more to Scala
 * XML Processing
 * Actors
 * Case Classes
 * Properties
 * Extistential Types
 * Implicits
 * Lazy Evaluation
 * Parser Combinations
 * Monads
 * Annotations

#### Case Classes

How does a `class` differ from a `case class`?
 * new keyword is not mamdatory to create instances of case classes
 * constructor parameters get getter functions by default
 * `equals` and `hashCode` have a default implementation based on instance structure; also for `toString`
 * can be used in pattern matching construct to capture values
 * Generics

### Using Scala as a scripting language

Example: `employee.scala`

    class Employee(name: String, age: Int) {
      override def toString = name + ", " + age
   }

    val emp1 = new Employee("Tom", 21)
    println("Employee 1: "+emp1)

Ouptput:

    $ scala employee.scala
    Employee 1: Tom, 21


## Extended Backus Naur form (EBNF)

    | denotes an alternative
    [...] an option ( 0 or 1 ) times
    {...} a repetition ( 0 or more) times

    Type         = SimpleType | FunctionType
    FunctionType = SimpleType '=>' Type
                   | '(' [Types] ')' '=>' Type
    SimpleType   = Ident
    Types        = Type {',' Type}

    Expr         = InfixExpr | FunctionExpr
                   | if '(' Expr ')' Expr else Expr
    InfixExpr    = PrefixExpr | InfixExpr Operator InfixExpr
    Operator     = ident
    PrefixExpr   = [ '+' | '-' | '!' | '~' ] SimpleExpr
    SimpleExpr   = ident | literal | SimpleExpr '.' ident | Block
    FunctionExpr = Bindings '=>' Expr
    Bindings     = ident [ ':' SimpleType ]
                   | '(' [Binding { ',' Binding}] ')'
    Binding      = ident [ ':' Type ]
    Block        = '{' { Def ';' } Expr '}'
    Def          = FunDef | ValDef
    FunDef       = def ident { '(' [ Parameters ] ')' }
                    [ ':' Type ] '=' Expr
    ValDef       = val ident [':' Type] '=' Expr
    Parameter    = ident ':' [ '=>' ] Type
    Parameters   = Parameter {',' Parameter}
    



## More Notes TBD

 * Functional Programming
 * Equational Reasoning: replace function with its value
 * Functional Language: functions are fist class falues, encourages immutability
 * Every statement has a return value ( and a type ) - `val a = 10`
 * Compound expression has a return type as well
 * Type inference
 * Classes and Objects
 * Class Inheritance
 * Default constructor
 * Predef object
 * Case classes
 * Functional Objects - those objects that do not have mutable state
 * File processing

## Scala caveats

 * Scala Development tools are not so great yet.
 * Compilation is relatively slow

## sbt: Simple Build Tool

 [Setup SBT](http://www.scala-sbt.org/release/docs/Getting-Started/Setup.html)

## Where to learn more Scala

### Books

 * [*Scala for the Impatient*](http://blog.typesafe.com/free-pdf-from-typesafe-scala-for-the-impatien-64715) (free) 
 * [*Programming Scala*](http://ofps.oreilly.com/titles/9780596155957) (free) 
 * [*Programming in Scala 2nd Ed.*](http://www.amazon.com/Programming-Scala-Comprehensive-Step-Step/dp/0981531644)
 * [*Functional Programming Principles in Scala*](https://www.coursera.org/course/progfun) ( free online course ) 
 * [Getting Started with Scala](http://www.scala-lang.org/node/198)

### Blogs

### Forums

### Other Resources

 * [ScalaConf Japan 2013](http://scalaconf.jp/en/program/index.html)
 * [Unit Test Java code from Scala](http://blog.tmorris.net/posts/automated-unit-testing-your-java-using-scalacheck/)
 * [Code Examples for Programming in Scala](http://www.cs.helsinki.fi/u/wikla/OTS/Sisalto/examples/)
 * [Solutions to the Exercises in the "Scala By Example" Manual](http://metagear.de/articles/scala-exercises/index.html)

## References

 * [Scala: A Scalable Language](http://www.artima.com/scalazine/articles/scalable-language.html)
 * [Scala by-name parameters](http://locrianmode.blogspot.in/2011/07/scala-by-name-parameter.html)
 * [Scala assert/requre/assume](http://daily-scala.blogspot.in/2010/03/assert-require-assume.html)
 * [Ordered trait](http://daily-scala.blogspot.in/2010/03/assert-require-assume.html)
 * [_root_ package](http://stackoverflow.com/questions/687071/what-is-the-root-package-in-scala)
 * [Nothing in Scala](http://www.scala-lang.org/api/current/index.html#scala.Nothing)
 * [Partially applied functions](http://sandrasi-sw.blogspot.in/2012/03/understanding-scalas-partially-applied.html)
 * [Currying in Scala](http://www.scala-lang.org/old/node/135)
 * [Static variables and Scala](http://stackoverflow.com/questions/1888716/what-replaces-class-variables-in-scala)
 * [Same method and variable name in Scala](http://stackoverflow.com/questions/6569132/scala-class-variable-name-hides-method-parameter-name)
 * [Package namespace in Scala and C Sharp](http://alvinalexander.com/scala/scala-csharp-style-package-syntax-examples-curly-braces)
 * [Trait extends class and vice-versa](http://stackoverflow.com/questions/12854941/why-can-a-scala-trait-extend-a-class)
 * [Sealed classes](http://www.scala-lang.org/old/node/123)
 * [Futures and Promises](http://docs.scala-lang.org/overviews/core/futures.html)
 * [StackOverflow: Dependency Injection in Scala](http://stackoverflow.com/questions/2563929/how-would-one-do-dependency-injection-in-scala)
 * [Real-World Scala Dependency Injection](http://jonasboner.com/2008/10/06/real-world-scala-dependency-injection-di/)
 * [Immutable R-Tree for Scala](http://making.meetup.com/post/64387936554/archery-an-immutable-r-tree-for-scala) 
 * [Scala Community](http://www.scalacommunity.com/)

