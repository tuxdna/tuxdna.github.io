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
