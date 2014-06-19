#!/bin/bash

## Install asciidoctor
## Ubuntu: sudo apt-get install rubygem-asciidoctor
## Fedora: sudo yum install -y rubygem-asciidoctor


OUTPUT_DIR=html
mkdir -p $OUTPUT_DIR

for f in asciidoc/*.asciidoc
do
    FN=`basename $f`
    asciidoctor -a toc2 -o $OUTPUT_DIR/${FN%.*}.html $f
done
