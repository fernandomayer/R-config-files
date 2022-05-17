#!/bin/bash

echo
echo Uninstall current R? [ 0/1 ]
echo
read opt
if [ $opt -eq 1 ] ; then
    echo Current version number:
    read Rcur
    if [ -e ~/R/R-$Rcur ]; then
        echo Uninstaling from ~/R/R-$Rcur
        cd ~/R/R-$Rcur
        sudo make uninstall
        cd ..
        rm -rf R-$Rcur
    else
        echo ~/R/R-$Rcur not found
        exit
    fi
fi
echo
echo Download and install R? [ 0/1 ]
read opt
if [ $opt -eq 1 ] ; then
    echo Downloading R from cran-r.c3sl.ufpr.br
    echo
    echo New version number:
    read Rver
    cd ~/R
    wget -O R-$Rver.tar.gz https://cran-r.c3sl.ufpr.br/src/base/R-4/R-$Rver.tar.gz
    echo
    echo Extracting R-$Rver.tar.gz
    tar -zxvf R-$Rver.tar.gz
    echo
    cd R-$Rver
    echo
    echo Configuring R with Intel MKL
    echo
    MKL_LIB_PATH=/opt/intel/mkl/lib/intel64
    export LD_LIBRARY_PATH=$MKL_LIB_PATH
    MKL="-L${MKL_LIB_PATH} -lmkl_gf_lp64 -lmkl_core -lmkl_sequential"
    ./configure --with-blas="$MKL" --with-lapack --enable-R-shlib
    echo
    echo Is this Ok? [ 0/1 ]
    read opt
    if [ $opt -eq 1 ] ; then
        echo Ok, going on
        echo
        make
        echo
    else
        exit
    fi
    echo
    echo Install? [ 0/1 ]
    read opt
    if [ $opt -eq 1 ] ; then
        echo
        sudo make install
        echo
    else
        exit
    fi
    echo
    echo Changing CHOWN of /usr/local/lib64/R {library, doc}
    echo
    sudo chown -R mayer:users /usr/local/lib64/R/library
    sudo chown -R mayer:users /usr/local/lib64/R/doc
    echo
fi
exit
