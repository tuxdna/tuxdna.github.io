---
layout: page
title: "Ruby"
description: "Ruby Programming Language"
---

{% include JB/setup %}

# Ruby Programming Language

 * 1995 - started by Yukihiro Matsumoto
 * 2000 - first english book - Programming Ruby
 * Ruby - influenced by Python, Perl, Lisp, Smalltalk
 * Strongly Typed, Late Binding
 * Runs on VM, Garbage Collected, Object Oriented
 * Single Inheritance, Mxins
 * Duck Typing

Containers, blocks and interators are core concepts in Ruby

## Basic data and variables


local variables:

    name = "tuxdna"
    age = 50

global variables:

    $debug = true
instance variables:

    @id = 10
    @department = "engineering services"

class variables:

    @@total_instances = 10

constant and class names:

    MyClass
    LOG_LEVEL = 10

    var.object_id

## Numbers


    01234 - octal - leading 0
    0d1234 - decimal - leading od
    0b01011 - binary - leading 0b

### Fixnum
### Bignum

    false, true, nil
    %w{abc def ghi}

### Range

    Local Variable : varname, _varname
    Global Variable : $varname, $_varname
    Instance Varialbe : @varname, @_varname
    Class Variable : @@varname, @@_varname
    Constant/Class Name: VarName, VARNAME



## Symbols

A Ruby symbol is a thing that has both a number (integer) representation and a string representation.

   :north
   :east
   :west
   :south


## Strings


String

    * capitalize
    * upcase / upcase!

    use single quotes
    '\\' # becomes "\\" which is actually a single slash

    use double quotes

    "this is a string" # a simple string
    "hello #{name}" # interpolated code in strings

    use %q and %Q with {} or [] or <> opening and closing pairs
    otherwise same character is used

    %q/this is a string/
    %q{this is a string}
    %q[this is a string]
    %q<this is a string>

    <<here document
    
    string = <<END_OF_STRING
    this is
    a stirng
    END_OF_STRING
    

    String.split
    String.scan


## Array

     a = [1, 'adc', 123.4]
     * a.inspect
     a[0..-1]
    
## Hash

     h = {1 => 'adc', "this" => 123.4}
     h = Hash.new
     h = {}
     do_stuff 100, :a => 5, :b => 3 # special case for hash
    

## Range

    low..high  - [low, high] inclusive range
    low...high - [low, high) high exclusinve range
    
    Range as conditions
    while line =gets
      puts line if line =~ /start/ .. line =~ /end/
    end
    
    Range as intervals
    (1..10) === 5 # use  case equality operator ===
    
## Expressions

    In Ruby
     - nil is considered as false
     - number zero (0) and empty string ('') are NOT considered as false.
    

## Control Structures

    if <condition>
     # stmt
    elsif <condition>
     # stmt
    else
     # stmt
    end
    
    while expression
      stmt
    end
    
    stmt if    <expression>     # statement modifier
    stmt while <expression>  # statement modifier
    
    case <expression>
         #  statements...
    when <expression>
         #  statements...
    when <expression>
         #  statements...
    end
    

## Regular Expressions

    /Perl (is|isn't) good/ # /regex/
    
    s =~ /
    
    line.sub(/Perl/, 'Ruby')
    # replace first 'Perl' with 'Ruby'
    line.gsub(/Python/, 'Ruby') # replace every 'Python' with 'Ruby'
    

## Code Blocks


    Two ways to create a block ( do..end):
    do
     stmt
     stmt
    end
    
    And using curly braces:
    { stmt }
    
    def fun; yield("tiger"); end; fun { |v| puts "Hello, #{v.capitalize}" }
    
Blocks can be objects

    def block_object(&block)
      block
    end
    
    bo = block_object { |p| puts "Hello #{p}" }
    
    # Alternatively use lambda / Proc.new
    bo = lambda { |p| puts "Hello #{p}" }
    

Closures:

A closure is a function that is evaluated in an
environment containing one or more bound variables.
When called, the function can access these variables.
The explicit use of closures is associated with functional
programming and with languages such as ML and Lisp.
Constructs such as objects in other languages can also
be modeled with closures.
    ­­ Wikipedia



Blocks can be closures

    def n_times(muxer)
        lambda { |n| n * muxer }
    end
    n_times(6)
    
Blocks can be used for Transactions:

    File.open("/proc/cupinfo","r") { |f| puts f.read }
    

# Methods


Everything ( except fixnums ) is pass-by-reference

Procs vs Lambda

1. Lambda enforces arity.
arity: the number of arguments a function can take

2. return scope of Proc is where the proc is defined
   return scope of lambda is where the lambda is finally used

Message versus Method dispatch: method_missing



# Iterators

    each
    map
    collect
    inject / reduce / fold
    
    Magic?
    [1,2,3].inject(:*) # product of all
    [1,2,3].inject(:+) # sum of all
    
    
ruby 1.9 has enumerators, generators and filters support
There can be parallel iteration of multiple collections in ruby 1.9


## Basic input output
    
    print
    puts
    p
    printf
    gets
    
    
    printf("%04.2f - %-10s\n", 1.23, "Saleem")
    

## Command line arguments

    ARGV

Class

    attr_reader :member1, :member2, :member3
    attr_writer :member1, :member2, :member3
    attr_accessor :member1, :member2, :member3
    
    #getter method
    def member1
        @member1
    end
    
    #setter method
    def member1=(m)
        @member1 = m
    end
    
Access Control: is determined at run time ( contrast with C++/Java )
public - can be called by anyone

protected - defining class and subclass can only access

private - only the current object can call private methods on itself

Instance variables are always private. Only the methods can be public / protected.

One can access private variables like this:

    object.instance_variable_get :@var_name
    
http://stackoverflow.com/questions/2131921/how-to-make-instance-variables-private-in-ruby

Create a clone of an object:

    object.dup
    
Frozen object can't be modified

    object.freeze
    
Inheritance:

    self.class
    self.class.superclass
    

## Modules and mixins

Module provides a namespace

    module MyModule
    end
    

We "include" module into a class to create a mixin


http://railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/
"include" is for adding instance methods 
"extend" is for adding class methods


## Input/Output

    File.open("/proc/cupinfo","r") { |f| puts f.read }
    
    file.each_line # every line
    file.each_byte # every 8-bit byte
    file.foreach   # every line
    file.read # entire file
    file.readlines # array of lines
    
    require 'stringio'
    StringIO.new("")
    

## Unit Testing

http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing


## Exceptions

    begin
      case rand(3)
      when 0
        raise InterfaceException, "some error", caller
      when 1
        raise "bad number"
      when 2
        raise
      end
    rescue InterfaceException
      # handle this one
    rescue "bad number"
      # handle this one
      retry # execute the begin block again
    rescue
      # handle this one
    else
      # no exception occurred
    ensure
    end
    

catch and throw - used to terminate the code move up the call stack

# Fibres, Threads and Processes


Fibers:

    Fiber.new block
    
Threads:

    Thread.new block
    
    Thread.current
    Thread.list
    Thread.alive?
    Thread.status
    Thread.priority=
    thread[]=
    thread.join
    abort_on_exception  / ruby -d
    
    Thread.stop
    Thread.run
    Thread.value
    Thread.join
    


## Ruby Gems

    gem environment

    
## Install ruby documentation

    sudo gem install -V rdoc-data


Ruby References:

 * http://blade.nagaokaut.ac.jp/ruby/ruby-talk/index.shtml
 * http://www.ruby-lang.org/
 * http://www.37signals.com/
 * http://www.ruby-doc.org
 * http://api.rubyonrails.com/
 * http://www.ruby-forum.com/
 * http://www.rubyforums.com/forumdisplay.php?f=1
 * http://www.sitepoint.com/forums/forumdisplay.php?f=227
 * http://railsforum.com/
 * http://www.rubyinside.com/
 * http://redhanded.hobix.com/
 * http://www.rubyist.net/~matz/ <http://www.rubyist.net/%7Ematz/>
 * http://www.planetrubyonrails.com/


Generally, the developers of Ruby should be familiar with the source code
and the style of development used by the team. To be clear, the following
guidelines should be honored when checking into Subversion:


    * All check-ins should be described in the ChangeLog, following the GNU
      conventions. (Many Ruby core developers use Emacs add-log mode, which can be
      accessed with the command C-x 4 a.)
    * Check-in dates should be given in Japan Standard Time (UTC+9).
    * The bulleted points from your ChangeLog should also be placed in the
      Subversion commit message. This message will be automatically mailed to the
      Ruby-CVS list after you commit.
    * K&R function declarations are used throughout Ruby's source code and
      its packaged extensions.
    * Please, do not use C++-style comments (//), Ruby's maintainers instead
      prefer the standard C multiline comment. (/* .. */)



 * [Berkeley Software Engineering for Software as a Service](https://www.coursera.org/saas)
 * [Ruby Trick Shots](http://www.youtube.com/watch?feature=player_embedded&v=gIEMKOI_Y)
 * [An introduction to Proc, Lambdas and Closures in Ruby](http://www.youtube.com/watch?v=VBC-G6hahWA)
 * [Understanding :symbols in Ruby](http://glu.ttono.us/articles/2005/08/19/understanding-ruby-symbols)
 * [Symbols are immutable](http://onestepback.org/index.cgi/Tech/Ruby/SymbolsAreNotImmutableStrings.red)
 * [Daemons](http://daemons.rubyforge.org/classes/Daemonize.html)


    Time.at(Time.local(2007, 10, 5)-Time.now).strftime("%d days %H hours %M minutes and %S seconds")
    


# Ruby caveats

    ================================================================================
    ! and not operator
    ================================================================================
    
    ruby-1.9.2-p0 > v = false
     => false 
    ruby-1.9.2-p0 > ! v
     => true 
    ruby-1.9.2-p0 > ! ! v
     => false 
    ruby-1.9.2-p0 > not v
     => true 
    ruby-1.9.2-p0 > not not v
     => false 
    ruby-1.9.2-p0 > k = !!v
     => false 
    ruby-1.9.2-p0 > k = not not v
    SyntaxError: (irb):7: syntax error, unexpected keyword_not, expecting '('
    k = not not v
               ^
    	from /home/sansari/.rvm/rubies/ruby-1.9.2-p0/bin/irb:17:in `<main>'
    ruby-1.9.2-p0 > k = (not not v)
     => false 
    ruby-1.9.2-p0 > # Same happens with Ruby 1.8.7 as well.
    ruby-1.9.2-p0 > def hello(*args); end
     => nil 
    ruby-1.9.2-p0 > hello {}
     => nil 
    ruby-1.9.2-p0 > hello {:a => 1}
    SyntaxError: (irb):4: syntax error, unexpected tASSOC, expecting '}'
    hello {:a => 1}
                ^
    	from /home/sansari/.rvm/rubies/ruby-1.9.2-p0/bin/irb:17:in `<main>'
    ruby-1.9.2-p0 > hello { || hello :a => 1 }
     => nil 
    ruby-1.9.2-p0 > hello { ||  }
     => nil 
    ruby-1.9.2-p0 > [1,2].each { || nil }
     => [1, 2] 
    ruby-1.9.2-p0 > 
    
# How to create a Ruby Gem?

## Using gem tool

    bundle gem <gem_name>

## OR by create a Gem spec file

    hello_gem.gemspec
    ========================================
    Gem::Specification.new do |s|
      s.name = "hello_gem"
      s.version = "0.0.1"
      s.summary = "Hello Gem!"
      s.description = "This is a Hello Gem!"
      s.authors = ["Saleem Ansari"]
      s.email = "tuxdna@gmail.com"
      s.files = "lib/hello.rb"
      s.homepage = "http://tuxdna.in/"
    end
    ========================================
    

## Create a gem out of it:

    gem build hello_gem.gemspec
    
This will create a gem file:

    hello_gem-0.0.1.gem
    
Add testcases:

    test/test_hello.rb
    Rakefile
    
Add documentation


# More

Gems

SysAdmin:

 FileUtils

 NetSSH

 Ruby One-liners

    ruby -rzlib -e 'print Zlib::Inflate.new.inflate(STDIN.read)' < ./74/c757240ec596063af8cd273ebd9f67073e1208

 Pipes and Fifo

 CLI Arguments

 Ruby On Android

 Ruboto / JRuby

 <http://stackoverflow.com/questions/133719/how-can-i-read-a-password>

Where is Ruby used at present?
 * web
 * system admin 
 * tooling
 * text processing

Basic Data Types / Variables
 * String
 * Numeric
 * Array
 * Hash
 * Symbol

Control Structures
 * if / elsif / else / end
 * while / end
 * case / when / end

Regular Expressions

Code Blocks
 * curly braces
 * do / end

Lambda / Proc / yield

Continuations

Methods

Everything ( except fixnums ) is pass-by-reference

Iterators

Basic IO

CLI

Exeption Handling

JRuby

Ruby On Rails
