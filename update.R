#!/usr/bin/env Rscript

## Update CRAN packages, showing which ones have a new version and asking before
## installing. Remote packages (GitHub) given as arguments are updated after:
## Rscript update.R [user/repo ...]

args <- commandArgs(trailingOnly = TRUE)

div <- paste0("##", paste(rep("=", 70), collapse = ""))

## Change repos according to location
c3sl <- "https://cran-r.c3sl.ufpr.br"
bris <- "https://www.stats.bris.ac.uk/R"
options(repos = c3sl)

## Ask a [y/N] question on the terminal (readline() does not wait in Rscript)
confirm <- function(msg) {
    cat(msg, "[y/N] ")
    ans <- readLines("stdin", n = 1)
    length(ans) == 1 && grepl("^[YySs]$", ans)
}

cat(div, "\n", "==> Packages with a new version\n\n")
old <- old.packages()

if (is.null(old)) {
    cat(" => No packages to be updated\n")
} else {
    ## Package names go in a column: the row names repeat when a package is in
    ## more than one library, and data.frame() then drops them all
    print(data.frame(Package = old[, "Package"],
        Installed = old[, "Installed"],
        New = old[, "ReposVer"],
        Library = old[, "LibPath"],
        row.names = NULL))
    cat("\n")
    if (confirm(sprintf(" => Update these %d packages?", nrow(old)))) {
        cat(div, "\n", "==> Update packages\n\n")
        if ("arrow" %in% old[, "Package"]) {
            cat("\n => `arrow` detected, installing it first\n\n")
            source("https://raw.githubusercontent.com/apache/arrow/master/r/R/install-arrow.R")
            install_arrow()
            old <- old[old[, "Package"] != "arrow", , drop = FALSE]
            cat("\n => continuing other packages\n\n")
        }
        if (nrow(old) > 0) {
            update.packages(oldPkgs = old, ask = FALSE)
        }
    } else {
        cat(" => Skipped\n")
    }
}

if (length(args) != 0) {
    cat("\n", div, "\n", "==> Update remotes\n")
    for (i in seq_along(args)) {
        cat("\n", sprintf(" => Updating %s", args[i]),
            "--------------------", "\n\n")
        remotes::install_github(args[i])
    }
} else {
    cat(" => No Remotes specified\n")
}

cat("\n ==> END UPDATE\n", div, "\n\n")
