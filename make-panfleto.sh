#!/usr/bin/bash

set -x

# requires latexmk and pdfjam
command -v latexmk pdfjam >/dev/null 2>&1 || exit 1

# make rosario.pdf
latexmk -f -pdf './rosario.tex'

# make rosario-panfleto.pdf
pdfjam -o './rosario-panfleto.pdf'  --booklet true --landscape --a4paper -- './rosario.pdf'

# cleanup files
latexmk -C
