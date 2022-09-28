#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
## if(length(args) == 0) stop("We need args here")

div <- paste0("##", paste(rep("=", 70), collapse=""))

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
