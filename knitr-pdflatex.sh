#!/bin/bash
## run knitr and pdflatex sequentially

BASENAME=$(basename $1 .Rnw)
			   
RNWFILE=$BASENAME.Rnw
echo "require(knitr); knit(\"$RNWFILE\")" | R --no-save --no-restore --quiet --slave

LATEXFILE=$BASENAME.tex
echo "$LATEXFILE" | pdflatex