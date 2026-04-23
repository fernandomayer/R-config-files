# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code)
when working with code in this repository.

## Overview

Collection of personal configuration files, shell scripts, and
R scripts for installing, updating, and working with R. Includes
document-processing pipelines (Sweave/knitr to PDF via pdflatex
or pandoc) and CSS themes for knitr/Beamer presentations.

## Key scripts

- `r-install.sh` / `r-install-fedora.sh` — Interactive scripts
  to compile and install R from source with Intel MKL BLAS.
  Arch uses `/opt/intel/mkl/...`, Fedora uses
  `/opt/intel/oneapi/mkl/...`.
- `update.R` — Update all CRAN packages and optionally
  GitHub remotes: `Rscript update.R [user/repo ...]`
- `update-inla.R` — Update the INLA package (testing branch).
- `check-package.R` — Reference script (not meant to be
  sourced wholesale) showing R CMD check, devtools, and rhub
  workflows for package checking.
- `knitr-pandoc.sh` — `.Rmd` -> knitr -> pandoc -> Beamer PDF.
- `knitr-pdflatex.sh` — `.Rnw` -> knitr -> pdflatex -> PDF.
- `sweave-pdflatex.sh` — `.Rnw` -> Sweave -> pdflatex -> PDF.

## CSS themes

`beamer.css`, `beamer2.css`, `beamer3.css`, `FPM-theme.css`
are knitr highlight themes for Beamer. Install by copying to
the `knitr/themes` directory.
