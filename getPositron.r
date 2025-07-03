#!/usr/bin/env r
#
# A downloader for Positron
#
# Copyright (C) 2021-2024  Dirk Eddelbuettel
#
# Released under GPL (>= 2)

url <- "https://api.github.com/repos/posit-dev/positron/releases"
res <- jsonlite::fromJSON(url)
#files <- res$assets[[1]][, "browser_download_url"]
#deb <- files[grepl("amd64\\.deb$", files)]
#deb <- files[grepl("\\.deb$", files)]

## hidden in body text
#deb <- gsub(".*(https://cdn.posit.co/positron/dailies/deb/x86_64/Positron-.*x64.deb).*", "\\1", res$body[1])
## now releases rather than dailies
deb <- gsub(".*(https://cdn.posit.co/positron/releases/deb/x86_64/Positron-.*x64.deb).*", "\\1", res$body[1])

tgt <- basename(deb)
if (!file.exists(tgt)) download.file(deb, tgt, quiet=TRUE)
#cat("Downloaded '", deb, "' as '", tgt, "'\n", sep="")
