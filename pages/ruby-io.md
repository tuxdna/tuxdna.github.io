---
layout: page
title: "Ruby IO"
description: "Ruby IO"
---

{% include JB/setup %}

# IO in Ruby

    man 3 stdout
    
    The  stream  stderr  is  unbuffered.  The stream stdout is line-buffered when it points to a
    terminal.  Partial lines will not appear until fflush(3) or exit(3) is called, or a  newline
    is  printed.   This  can  produce unexpected results, especially with debugging output.  The
    buffering mode of the standard streams (or any other stream) can be changed using  the  set‐
    buf(3) or setvbuf(3) call.  Note that in case stdin is associated with a terminal, there may
    also be input buffering in the terminal  driver,  entirely  unrelated  to  stdio  buffering.
    (Indeed,  normally  terminal  input is line buffered in the kernel.)  This kernel input han‐
    dling can be modified using calls like tcsetattr(3); see also stty(1), and termios(3).
    
    "stdout is line-buffered when it points to a terminal"
    

How buffering works?
http://www.pixelbeat.org/programming/stdio_buffering/

How to set line buffering on pipes?
http://stackoverflow.com/questions/6653603/setting-c-program-to-line-buffer-wont-work
http://coderrr.wordpress.com/2008/12/20/automatically-flushing-redirected-or-piped-stdout/

Issue discussed on Ruby forum:
http://www.ruby-forum.com/topic/152548

Bug filed in Ruby:
http://bugs.ruby-lang.org/issues/3739


    #include <stdio.h>
    int main(int argc, char *argv[])
    {
      int c;
      setvbuf(stdout, NULL, _IOLBF, BUFSIZ);
      while( (c = getchar()) != EOF) {
        putchar(c);
      }
      return 0;
    }


    def rand_char
      ('a'[0].ord + rand( ('z'[0].ord) - ('a'[0].ord) )).chr
    end
    
    STDOUT.sync = true # comment this line to show bug
    sleep_time = 5
    [10, 100, 1000, 10000, 100000].each do |max|
      s = (1..max).map{ rand_char }.join
      msg = "#{max} characters, sleeping for #{sleep_time}s"
      print "Attempting: #{msg} - "
      puts "#{s} : #{max} characters, sleeping for #{sleep_time}s"
      # STDOUT.flush
      STDERR.flush
      STDERR.puts "DONE: #{msg}"
      sleep sleep_time
    end


