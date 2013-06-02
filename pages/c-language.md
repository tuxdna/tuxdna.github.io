---
layout: page
title: "GCC / GlibC"
description: "GCC and Memory Allocation in GlibC"
---

{% include JB/setup %}

## GlibC Memory Allocation

fragmentation

best-fit

free-list

malloc state at the head of heap

    echo m > /proc/sysrq-trigger
    less /var/log/messages
    

## GCC Internals

Dump data of intermediate passes

    gcc -fdump-tree-all -S  hello.c


RTL generation

    gcc -fdump-rtl-all -S foo.c


machine description ./gcc/config/i386/i386.md


## GCC Workshop

Think in terms register and memory operations in machine instructions.

Dynamic plugin

    int plugin_is_GPL_compatible;
    int plugin_init();

Static plugin

    plugin_init and plugin_is_GPL_compatible not required


## Linking with GCC

Static and Dynamic Linking with GCC, assuming you are using the GNU binutils, do

    # gcc a.o -Wl,-Bstatic -lfoo -Wl,-Bdynamic -lbar

This is largely (and on many platforms, entirely) a function of the
linker, not the compiler per se.  The compiler driver ("gcc" or "g++",
etc) can pass arbitrary (comma-separated) options to the linker with -Wl,
so you need to read the man page for the linker you're using[\*], figure out
which options to pass to it, and then feed those to gcc/g++.  For example,
on Solaris it's something like

    gcc a.o b.o ... z.o -Wl,-B,static -lfoo -Wl,-B,dynamic -lbar

and the linker receives

    ld ..... -B static -lfoo -B dynamic -lbar ....


Run 'gcc --print-prog-name=ld' to get the full path to ld; then you
can investigate that binary and determine which one is in use.

setenv LD_OPTIONS      -Bstatic

The simplest way to set the load path is through the environment variable LD_LIBRARY_PATH. 
