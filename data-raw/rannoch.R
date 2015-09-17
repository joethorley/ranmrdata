library(rgeos)
library(maptools)
library(ggplot2)
library(magrittr)
library(sp)
library(dplyr)
library(devtools)

rm(list = ls())

rannoch <- getKMLcoordinates("data-raw/rannoch.kml")
rannoch <- Polygon(rannoch[[2]][,1:2]) %>% list() %>% Polygons(ID = "rannoch") %>% list() %>%
  SpatialPolygons(proj4string=CRS("+init=epsg:4326"))

rannoch %<>% spTransform(CRS("+init=epsg:27700"))

use_data(rannoch, overwrite = TRUE)
