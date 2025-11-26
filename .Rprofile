## General options
options(
    repos = "https://cran-r.c3sl.ufpr.br",
    ## repos = "https://www.stats.bris.ac.uk/R/",
    pdfviewer = "/usr/bin/evince",
    timeout = 600,
    ## verbose = TRUE,
    ## device = function(file = "Rplots.pdf", ...) {
    ##     grDevices::cairo_pdf(file = file, width = 8, height = 6)
    ## },
    ## NOTE: This ws needed when the default graphic's device got cracked in
    ## GNOME Wayland. With this device, the graphics were just plotted in
    ## Rplots.png, then I had to send dev.off() (binded to C-. in ESS), then
    ## open the file in feh (the only program able to update the images as they
    ## were plotted). After some time, tne graphics device worked again.
    ## device = function(file = "Rplots.png", ...) {
    ##     ragg::agg_png(file = file, width = 800, height = 600,
    ##         pointsize = 12, res = 72 * 1.5, scaling = 1)
    ## },
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
