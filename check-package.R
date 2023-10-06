##======================================================================
## General script to test a package in several platforms
##======================================================================

##======================================================================
## Check with R CMD

## The traditional way for checking a package
## Only checks locally

## To build the package tarball
# $ R CMD build <pkg>

## To check the tarball
# $ R CMD check --as-cran <pkg.tar.gz>

##======================================================================
## Check with devtools
library(devtools)

## Devtools has some wrappers for R CMD check
load_all()
document()
check_man()
check()
## To make the check equivalent to R CMD check --as-cran, use
check(manual = TRUE, remote = TRUE)

## Checks for Windows, using the https://win-builder.r-project.org
check_win_oldrelease()
check_win_release()
check_win_devel()

## Checks for macOS, using the
## https://mac.r-project.org/macbuilder/submit.html
check_mac_release()

## Check remotely via https://builder.r-hub.io
## This is a wrapper for rhub::check_for_cran (see below). The default
## call will send the package to be tested in:
## Platform:   Windows Server 2022, R-devel, 64 bit
## Platform:   Ubuntu Linux 20.04.1 LTS, R-release, GCC
## Platform:   Fedora Linux, R-devel, clang, gfortran
## However, this can be changed according to rhub::platforms()
check_rhub()

##======================================================================
## Check with rhub

## You may also need to install sysreqs
## devtools::install_github("r-hub/sysreqs")
library(rhub)

## There are two ways of using rhub:
## 1) Online checks via https://builder.r-hub.io
## 2) Local checks with docker

##----------------------------------------------------------------------
## 1) Online checks via https://builder.r-hub.io
## See https://r-hub.github.io/rhub/articles/rhub.html

## For the first time, tou will need to validate your email
## validate_email(email = "fernando.mayer@mu.ie")

## Check available platforms
rhub::platforms()
(plats <- rhub::platforms()$name)

## Run a check. If platforms is not specified, then a menu prompt will
## appear. You can select one or more platforms at the same time.
chk_online <- rhub::check("geslaR_1.0-1.tar.gz", platforms = plats[3:5],
    show_status = FALSE)

chk_online$browse()
chk_online$print()
chk_online$livelog()
chk_online$urls()

## Check for CRAN ------------------------------------------------------
## check_for_cran() runs checks on platforms that are closest to
## platforms used by CRAN on submission:
## - Fedora Linux, R-devel, clang, gfortran
## - Ubuntu Linux 16.04 LTS, R-release, GCC
## - Windows Server 2008 R2 SP1, R-devel, 32/64 bit
chk_cran <- check_for_cran("geslaR_1.0-1.tar.gz",
    show_status = FALSE)

## This would be the same as
plats_cran <- c("fedora-clang-devel", "ubuntu-gcc-release",
    "windows-x86_64-devel")
chk_online <- rhub::check("geslaR_1.0-1.tar.gz", platforms = plats_cran,
    show_status = FALSE)

##----------------------------------------------------------------------
## 2) Local checks with docker
## See https://r-hub.github.io/rhub/articles/local-debugging.html

## See available images
local_check_linux_images()
imgs <- paste0("rhub/", local_check_linux_images()$name)

chk_local <- local_check_linux("geslaR_1.0-1.tar.gz",
    image = imgs[1])
