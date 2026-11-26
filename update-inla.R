#!/usr/bin/env Rscript

## Update INLA (testing), showing the installed and the new version and asking
## before installing

div <- paste0("##", paste(rep("=", 70), collapse = ""))

## Ask a [Y/n] question on the terminal (readline() does not wait in Rscript)
confirm <- function(msg) {
    cat(msg, "[Y/n] ")
    ans <- readLines("stdin", n = 1)
    length(ans) == 1 && grepl("^[YySs]?$", ans)
}

cat("\n ==> START INLA UPDATE\n", div, "\n\n")

repo <- "https://inla.r-inla-download.org/R/testing"
new <- available.packages(repos = repo)["INLA", "Version"]
inst <- if (requireNamespace("INLA", quietly = TRUE)) {
    as.character(packageVersion("INLA"))
} else {
    "not installed"
}

if (inst != "not installed" && package_version(new) <= inst) {
    cat(sprintf(" => INLA %s is already the latest version\n", inst))
} else {
    cat(sprintf(" => INLA installed: %s\n => INLA available: %s\n\n",
        inst, new))
    if (confirm(" => Update INLA?")) {
        INLA::inla.update(testing = TRUE, ask = FALSE)
    } else {
        cat(" => Skipped\n")
    }
}

cat("\n ==> END INLA UPDATE\n", div, "\n\n")
