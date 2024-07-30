#!/usr/bin/env r
#
# A downloader for Positron
#
# Copyright (C) 2021-2024  Dirk Eddelbuettel
#
# Released under GPL (>= 2)

url <- "https://api.github.com/repos/posit-dev/positron/releases"
res <- jsonlite::fromJSON(url)
files <- res$assets[[1]][, "browser_download_url"]
#deb <- files[grepl("amd64\\.deb$", files)]
deb <- files[grepl("\\.deb$", files)]
tgt <- basename(deb)
if (!file.exists(tgt)) download.file(deb, tgt, quiet=TRUE)
#cat("Downloaded '", deb, "' as '", tgt, "'\n", sep="")
