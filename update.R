#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
## if(length(args) == 0) stop("We need args here")

div <- paste0("##", paste(rep("=", 70), collapse=""))

## Change repos according to location
c3sl <- "https://cran-r.c3sl.ufpr.br"
bris <- "https://www.stats.bris.ac.uk/R"
options(repos = c3sl)

cat(div, "\n", "==> Package status\n\n")
(up <- packageStatus())
ups <- summary(up)

cat("\n\n ==> Number of packages to be updated\n\n")
nup <- lapply(ups$Libs, function(x) x$upgrade)
nup$Total <- length(unlist(nup))
nup

Sys.sleep(5)

if(nup$Total == 0) {
    cat(" => No packages to be updated\n")
} else {
    cat(div, "\n", "==> Update packages\n\n")
    if("arrow" %in% nup) {
        cat("\n => `arrow` detected, installing it first\n\n")
        source("https://raw.githubusercontent.com/apache/arrow/master/r/R/install-arrow.R")
        install_arrow()
        cat("\n => continuing other packages\n\n")
    }
    update.packages(ask = FALSE)
}

if(length(args) != 0) {
    cat("\n", div, "\n", "==> Update remotes\n")
    for(i in seq_along(args)) {
        cat("\n", sprintf(" => Updating %s", args[i]),
            "--------------------", "\n\n")
        remotes::install_github(args[i])
    }
} else {
    cat(" => No Remotes specified\n")
}

cat("\n ==> END UPDATE\n", div, "\n\n")
