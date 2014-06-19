#!/bin/bash

## Install inotify-tools and nc
## Ubuntu: sudo apt-get install inotify-tools netcat6
## Fedora: sudo yum install -y inotify-tools nc6

## Watch for modifications
while inotifywait -r -e modify asciidoc/*.asciidoc
do
  # put your command here to generate the html from modified files
  ./build.sh

  # now refresh the browser
  echo "BrowserReload();" | nc localhost 4242  > /dev/null
done

