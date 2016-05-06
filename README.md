<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/ranmrdata.svg?branch=master)](https://travis-ci.org/poissonconsulting/ranmrdata) [![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.51110.svg)](http://dx.doi.org/10.5281/zenodo.51110)

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

The package provides a SpatialPointsDataFrame of the mark recapture data and a SpatialPolygons object of the shoreline of Loch Rannoch. Any maps including the shoreline should include the text &gt; Lochs from Land Cover of Scotland data, MLURI 1993.
