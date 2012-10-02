#!/bin/bash
## run Sweave and pdflatex sequentially
## This script is based in an example from Dirk Eddelbuettel in R-help
## mailing list
## https://stat.ethz.ch/pipermail/r-help/2003-April/033125.html

BASENAME=$(basename $1 .Rnw)
			   
RNWFILE=$BASENAME.Rnw
echo "Sweave(\"$RNWFILE\")" | R --no-save --no-restore --quiet --slave

LATEXFILE=$BASENAME.tex
echo "$LATEXFILE" | pdflatex