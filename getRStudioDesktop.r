#!/usr/bin/env r
#
# A simple example to install RStudio Desktop
#
# Copyright (C) 2014 - 2022  Carl Boettiger and Dirk Eddelbuettel
#
# Released under GPL (>= 2)
#
# based on earlier https://raw.githubusercontent.com/rocker-org/rstudio-daily/master/latest.R
#
# todo: cmdline options for different download options

url <- "https://dailies.rstudio.com/rstudio/latest/index.json"
js <- jsonlite::fromJSON(url)
#fileurl <- js$products$desktop$platforms$bionic$link
fileurl <- js$products$electron$platforms$jammy$link
file <- basename(fileurl)
#cat("'", fileurl, "' -> '", file, "'\n", sep="")
download.file(fileurl, file, quiet=TRUE)
