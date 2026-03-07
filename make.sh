#!/usr/bin/bash

# argument is doc
DOC=$1

# requires latexmk and pdfjam
command -v latexmk pdfjam >/dev/null 2>&1 || exit 1

# make base document
latexmk -f -pdf "${DOC}.tex"
latexmk -c

# make booklet
pdfjam -o "${DOC}.pdf"  --booklet true --landscape --a4paper -- "${DOC}.pdf"