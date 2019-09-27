#!/bin/bash

## Run knitr and pdflatex sequentially

BASENAME=$(basename $1 .Rnw)

echo
echo -------------------------------------------------------------------
echo Run knitr in $BASENAME.Rnw
echo -------------------------------------------------------------------
echo
RNWFILE=$BASENAME.Rnw
Rscript -e "knitr::knit(\"$RNWFILE\")"

echo
echo -------------------------------------------------------------------
echo Run pdfLaTeX in $BASENAME.Rnw
echo -------------------------------------------------------------------
echo
LATEXFILE=$BASENAME.tex
echo "$LATEXFILE" | pdflatex

rm *.aux *.log *.out *.tex
