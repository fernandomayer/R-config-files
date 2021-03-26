#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
if(length(args) == 0) stop("We need args here")

div <- paste0("##", paste(rep("=", 70), collapse=""))

cat(div, "\n", "==> Package Status\n\n")
(up <- packageStatus())
ups <- summary(up)

cat("\n\n ==> Número de pacotes a serem atualizados\n\n")
nup <- lapply(ups$Libs, function(x) x$upgrade)
nup$Total <- length(unlist(nup))
nup

Sys.sleep(5)

cat(div, "\n", "==> Update Packages\n\n")

if(length(unlist(nup)) == 0) {
    cat(" => Nenhum pacote a ser atualizado\n")
} else {
    update.packages(ask = FALSE)
}

cat("\n", div, "\n", "==> Update Remotes\n")

for(i in seq_along(args)) {
    cat("\n", sprintf(" => Atualizando %s", args[i]),
        "--------------------", "\n\n")
    remotes::install_github(args[i])
}

cat("\n ==> END UPDATE\n", div, "\n\n")
