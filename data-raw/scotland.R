library(rgdal)
library(rgeos)
library(magrittr)
library(sp)
library(ggplot2)
library(dplyr)
library(devtools)
library(assertthat)
library(ranmr)

rm(list = ls())

scotland <- readOGR(dsn = "data-raw/scotland", layer = "european_region_region")
scotland <- scotland[scotland$CODE == "S15000001" & scotland$HECTARES >= 1000,]
scotland %<>% spTransform(CRS("+init=epsg:27700"))
scotland %<>% gSimplify(tol = 100, topologyPreserve = TRUE)

scotland %<>% intersect_bbox(ymax =  0.98 * 10 ^ 6)

use_data(scotland, overwrite = TRUE)
