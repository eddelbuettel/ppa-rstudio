#!/usr/bin/r

suppressMessages({
    library(data.table)
    library(docopt)
})

doc <- paste0("Usage: pruneDebs.r [-hv]

-v --verbose    show intermediate data [default: FALSE])
-h --help       show this help text

")
opt <- docopt(doc)			# docopt parsing

srcdir <- "."
if (!dir.exists(srcdir)) q("no")

setwd(srcdir)
files <- list.files(pattern="*.deb", path=".")
df <- data.table(files=files, file.info(files)[,c(1,5)])
#df[, `:=`(package=gsub("(.*-?)-([0-9]*\\.[0-9]*\\.[0-9]*-.*)(-amd64|-x64)?\\.deb", "\\1", files),
#          version=gsub("(.*-?)-([0-9]*\\.[0-9]*\\.[0-9]*((-daily)?-\\d*)?-.*)(-amd64|-x64)?\\.deb", "\\2", files))]
#df[, version := gsub("-daily", "", version)]
df[, `:=`(package=gsub("^([a-zA-Z-]*-?)(-|_)[0-9].*\\.deb", "\\1", files))]
setkey(df, package, ctime)
if (opt$verbose) print(df)

sdf <- df[, .(files, .N, ctime), by=package][N>1, ]
if (opt$verbose) print(sdf)
sdf[, keep := as.logical(files==tail(files,1)), by=package]
if (opt$verbose) print(sdf)
#print(sdf[keep==FALSE,])
#cat("Pruning", sdf[keep==FALSE, .N], "\n")

unlink(sdf[keep==FALSE, files])
