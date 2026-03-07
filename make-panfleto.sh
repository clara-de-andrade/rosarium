#!/usr/bin/bash

# argument is doc
DOC=$1

# requires latexmk and pdfjam
command -v latexmk pdfjam >/dev/null 2>&1 || exit 1

# make base document
latexmk -f -pdf "${DOC}.tex"

# make booklet
pdfjam -o "${DOC}-panfleto.pdf"  --booklet true --landscape --a4paper -- "${DOC}.pdf"

# cleanup files
latexmk -C

# symlink booklet
ln -sf "${DOC}-panfleto.pdf" "${DOC}.pdf"