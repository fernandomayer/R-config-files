#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
## if(length(args) == 0) stop("We need args here")

div <- paste0("##", paste(rep("=", 70), collapse=""))

cat("\n ==> START INLA UPDATE\n", div, "\n\n")

INLA::inla.update(testing = TRUE)

cat("\n ==> END INLA UPDATE\n", div, "\n\n")
