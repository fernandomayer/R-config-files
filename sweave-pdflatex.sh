#!/bin/bash

## Objetivo: rodar Sweave e pdflatex com o mesmo comando.

## Este script foi baseado no script postado por Dirk Eddelbuettel na
## lista do R. Siga esse link:
## https://stat.ethz.ch/pipermail/r-help/2003-April/033125.html

BASENAME=$(basename $1 .Rnw)
			   
RNWFILE=$BASENAME.Rnw
echo "Sweave(\"$RNWFILE\")" | R --no-restore --slave
			       
LATEXFILE=$BASENAME.tex
echo "$LATEXFILE" | pdflatex