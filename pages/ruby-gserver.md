---
layout: page
title: "Ruby GServer"
description: "A simple server in Ruby"
---

{% include JB/setup %}

# A simple server in Ruby

I created a simple TCP server using GServer in ruby:

File: server.rb

    require 'gserver'
    class LogServer < GServer
      @@LOGFILE = "/var/log/boot.log" 
      def initialize
        super(12345)
      end
    
      def serve(client)
        client.puts get_end_of_logfile
      end
    
      private
      def get_end_of_logfile
        s = ''
        begin
          File.open(@@LOGFILE) do |log|
            log.seek(-1000, IO::SEEK_END)
            log.gets
            s = log.read
          end
        rescue => e
          puts "Failed to read the log file."
          s=''
        end
        return s
      end
    end
    
    server = LogServer.new
    server.audit = true
    server.start
    server.join
    
I am using Ruby version 1.8.7.

Now lets start the server:

    $ ruby server.rb

Now that the server is waiting for connection from client, lets connect to it from a separate terminal.

    $ for f in 1 2 3 4 5 6; do telnet 127.0.0.1 12345; done

