#!/bin/bash

## -- update and install r and jsonlite needed below, and apt-utils for repo
## apt update -qq
## apt install --no-install-recommends r-cran-littler r-cran-jsonlite apt-utils

cd docs

## we explicitly remove exiting ones
for d in *.deb; do
    git rm ${d}
done

## the scripts are currently / for now copies from littler that do not do setwd()
../getRStudioDesktop.r
../getRStudioServer.r
../getQuartoCli.r

## create repo files
apt-ftparchive packages . > Packages
cat Packages | gzip - > Packages.gz
apt-ftparchive release . > Release
