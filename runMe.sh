#!/bin/bash

## -- if needed, update and install r and jsonlite as needed below, and
##    apt-utils for repo tool apt-ftparchive
##
## apt update -qq
## apt install --no-install-recommends r-cran-littler r-cran-jsonlite apt-utils

## assume we have a directory for the ppa, here called docs, which you can then
## symlink into ~/www or whereever you serve http content from
test -d docs || exit 1

## operate in docs/
cd docs

## we explicitly remove exiting ones
#for d in *.deb; do
#    rm -f ${d}
#done

## the scripts are currently / for now simple (minimally modified) copies of
## the variant in the littler repo
../getRStudioDesktop.r
../getRStudioServer.r
../getQuartoCli.r

## create repo files
apt-ftparchive packages . > Packages
cat Packages | gzip - > Packages.gz
apt-ftparchive -c repo.conf release . > Release
