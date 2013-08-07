#!/bin/bash

## Run Sweave and pdflatex sequentially

BASENAME=$(basename $1 .Rnw)

echo
echo -------------------------------------------------------------------
echo Run Sweave in $BASENAME.Rnw
echo -------------------------------------------------------------------
echo
RNWFILE=$BASENAME.Rnw
Rscript -e "Sweave(\"$RNWFILE\")"

echo
echo -------------------------------------------------------------------
echo Run pdfLaTeX in $BASENAME.Rnw
echo -------------------------------------------------------------------
echo
LATEXFILE=$BASENAME.tex
echo "$LATEXFILE" | pdflatex
