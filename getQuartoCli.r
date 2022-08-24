#!/usr/bin/env r
#
# A downloader for Quarto
#
# Copyright (C) 2021  Dirk Eddelbuettel
#
# Released under GPL (>= 2)
#
# TODO: Maybe make the .deb filter an option

url <- "https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest"
res <- jsonlite::fromJSON(url)
files <- res$assets[, "browser_download_url"]
deb <- files[grepl("\\.deb$", files)]
tgt <- basename(deb)
if (!file.exists(tgt)) download.file(deb, tgt, quiet=TRUE)
#cat("Downloaded '", deb, "' as '", tgt, "'\n", sep="")
