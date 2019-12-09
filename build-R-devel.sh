#!/bin/bash
cd ~/R-devel-build
R_PAPERSIZE=letter                \
R_BATCHSAVE="--no-save --no-restore"         \
R_BROWSER=xdg-open                \
PAGER=/usr/bin/pager                \
PERL=/usr/bin/perl                \
R_UNZIPCMD=/usr/bin/unzip            \
R_ZIPCMD=/usr/bin/zip                \
R_PRINTCMD=/usr/bin/lpr                \
LIBnn=lib                    \
AWK=/usr/bin/awk                                \
CC="ccache gcc"                    \
CFLAGS="-ggdb -pipe -std=gnu99 -Wall -pedantic" \
CXX="ccache g++"                \
CXXFLAGS="-ggdb -pipe -Wall -pedantic"         \
FC="ccache gfortran"                   \
F77="ccache gfortran"                \
MAKE="make -j4"                    \
../r-devel/R/configure                     \
    --prefix=/home/mm/local/lib/R-devel         \
    --enable-R-shlib                 \
    --with-blas                 \
    --with-lapack                 \
    --with-readline                 \
    --without-recommended-packages
#CC="clang -O3"                                  \
#CXX="clang++ -03"                \
#make svnonly
make 
echo "*** Done -- now run 'make install'"
make install

