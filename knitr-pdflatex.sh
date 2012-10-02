#!/bin/bash

## Objetivo: rodar Knitr e pdflatex com o mesmo comando.

BASENAME=$(basename $1 .Rnw)
			   
RNWFILE=$BASENAME.Rnw
echo "require(knitr); knit(\"$RNWFILE\")" | R --no-save --no-restore --quiet --slave
			       
LATEXFILE=$BASENAME.tex
echo "$LATEXFILE" | pdflatex