<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/ranmrdata.svg?branch=master)](https://travis-ci.org/poissonconsulting/ranmrdata) [![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.45222.svg)](http://dx.doi.org/10.5281/zenodo.45222)

Loch Rannoch Ferox Trout Mark-Recapture Data
============================================

`ranmrdata` is the companion R data package for Thorne et al.'s manuscript The Low Abundance and High Catchability of Large Piscivorous Ferox Trout (Salmo trutta) in Loch Rannoch, Scotland.

Installation
------------

To install the package execute the following code at the R terminal:

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/ranmrdata")
```

Information
-----------

The package provides a tbl data frame of the mark recapture data and a SpatialPolygons object of the shoreline of Loch Rannoch. Any maps including the shoreline should include the text &gt; Lochs from Land Cover of Scotland data, MLURI 1993.

``` r
library(dplyr) # for nice printing of tbl data frames
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(ranmrdata)
ferox
#> Source: local data frame [84 x 7]
#> 
#>          Date   Fish Length  Mass   Age Latitude Longitude
#>        (date) (fctr)  (int) (dbl) (int)    (dbl)     (dbl)
#> 1  1994-07-03    F01    610  3.01    10 56.67987 -4.343289
#> 2  1994-08-25    F02    630  3.44    10 56.68001 -4.338390
#> 3  1994-09-15    F03    480  1.16    11 56.68971 -4.271416
#> 4  1994-09-22    F04    620  3.18    10 56.68801 -4.282331
#> 5  1994-09-22    F05    595  2.50    11 56.68821 -4.281298
#> 6  1994-09-25    F06    520  1.59     9 56.68881 -4.243086
#> 7  1994-09-25    F07    510  1.51    10 56.68924 -4.335174
#> 8  1995-05-06    F08    630  2.41    11 56.69364 -4.310311
#> 9  1995-06-18    F09    660  2.73    10 56.67987 -4.331424
#> 10 1995-06-18    F10    765  3.81    14 56.68119 -4.357021
#> ..        ...    ...    ...   ...   ...      ...       ...
```
