
## ppa-rstudio

### Motivation

Ever wanted to do `apt install rstudio rstudio-server` ?  Me too.  

Ever wanted to just `apt update; apt upgrade` and get updated RStudio
binaries? Me too.  

### HowTo

The scripts to do this had been included in the [littler
package](https://github.com/eddelbuettel/littler) (for `r`) for many years (or months
in the case of the `quarto` package).  What was
missing was putting three lines to together to make it a repo that `apt` can
access: a `PPA` so to speak.  

Having set up a few other ones here (and of course on Launchpad where this
cannot run as it accesses remote URLs) it became clear that this was a good
idea.  But with the 100mb file limit at GitHub we cannot host such a repo
here. Cue a sad trombone.

So I am doing it at my own server for my own use. And make the scripts
available here.  Just create a subdirectory you serve for `apt` over http and
call `runMe.sh` from it. 

### Author 

Dirk Eddelbuettel

### License

GPL (>= 2)
