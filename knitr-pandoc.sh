#!/bin/bash

## Run knitr and pandoc sequentially

BASENAME=$(basename $1 .Rmd)

echo
echo -------------------------------------------------------------------
echo Run knitr in $BASENAME.Rmd
echo -------------------------------------------------------------------
echo
RMDFILE=$BASENAME.Rmd
Rscript -e "require(knitr); knit(\"$RMDFILE\")"

echo
echo -------------------------------------------------------------------
echo Run pandoc in $BASENAME.md
echo -------------------------------------------------------------------
echo
PANDOCFILE=$BASENAME.md
pandoc -t beamer $BASENAME.md -V theme:Frankfurt -o $BASENAME.pdf