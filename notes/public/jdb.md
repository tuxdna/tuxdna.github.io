# JDB: Java Debugger

Debugging Java Code:

jdb supports fairly primitive support for debugging, which is sufficient ( in my opinion ) when used as a backend for an IDE ( like NetBeans, Eclipse etc. ).


However when I compare it with GDB ( the GNU Debugger ), as a tool to be used on the terminal, it seems to be pretty old. JDB lacks in features and commands which GDB specializes in. I was mainly interested in abbreviation of commands. Like  s ( step ), c (continue), bt ( backtrace ) etc. Also to see the listing of sourcode, I had to repeatedly type list ( Press Enter ) , again list  ( Press Enter ) , and so on. JDB still shows the same lines ( i.e. where break point ocurred ), where GDB shows lines continually.


Debugging with JDB:

jdb's Core Commands:

    help           --  print all commands jdb can understand
    print object   --  print an object using its toString() method
    list [line number|method]  -- print source code lines
    locals         -- print local variablesâ values
    exit           -- quit the debugger
    where          -- list the history of nest function calls so far
    stop at class:line    -- set a break point where execution will halt
    stop at class.method  -- set a break point at a 'suspect' function
    cont   -- continue execution after a break point has been hit
    step   -- execute a single source code line
    run    -- run the program (stops if there are break points set with stop)
    

Using JDB:

    [shell-prompt]$ jdb MyClass 

When  started this way, jdb invokes a second Java VM with any specified parameters, loads the specified class, and stops the VM before  executing that class's first instruction.


Another way to use jdb is by attaching it to a Java VM that is already running.  A VM that is to be debugged with jdb must be started with the following options:

    -Xdebug
    Enables debugging support in the VM.

    -Xrunjdwp:trans port=dt_socket, server=y,suspend=n
    Loads in-process debugging libraries and specifies the kind of connection to be made.                         


For example, the following command will run the MyClass application and allow jdb to connect to it at a later time:

    [shell-prompt]$ java -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n Class

You can then attach jdb to the VM with the following command:

    [shell-prompt]$ jdb -attach 8000

Note that MyClass is not specified in the jdb command line in this case because  jdb is connecting to an existing VM instead of launching a new one. There are many other ways to connect the debugger to a VM, and  all  of them are supported by jdb.  The Java Platform Debugger Architecture has additional documentation on these connection options.
