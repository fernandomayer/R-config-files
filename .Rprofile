## General options
options(
    repos = "https://cran-r.c3sl.ufpr.br",
    ## repos = "https://www.stats.bris.ac.uk/R/",
    pdfviewer = "/usr/bin/evince",
    timeout = 600,
    ## verbose = TRUE,
    device = "cairo_pdf",
    browser = "/usr/bin/opera"
)
## papersize="a4",
## width=72)

.Last <- function() {
    if(interactive()) {
        try(savehistory(), silent = TRUE)
    }
}

## if (interactive())
##   try(fortunes::fortune(), silent = TRUE)

## Default packages loaded at startup
# See the environment variable R_DEFAULT_PACKAGE in .Renviron

## Lattice customizations
# WARNING: this will open a new device by default
## lattice::trellis.par.set(box.rectangle = list(col = "black"),
##                 box.umbrella = list(col = "black"),
##                 box.dot = list(pch = "|"),
##                 strip.background = list(col = "lightgray"),
##                 strip.shingle = list(col = "lightgray"),
##                 plot.symbol = list(col = "black"),
##                 plot.line = list(col = "black"),
##                 plot.polygon = list(col = "grey"),
##                 warn = FALSE)
