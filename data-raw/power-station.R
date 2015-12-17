library(rgeos)
library(maptools)
library(ggplot2)
library(magrittr)
library(sp)
library(dplyr)
library(devtools)

rm(list = ls())

power_station <- getKMLcoordinates("data-raw/rannoch.kml")
power_station <- power_station[[1]][,1:2, drop = FALSE]

power_station %<>% SpatialPoints(proj4string=CRS("+init=epsg:4326"))
power_station %<>% spTransform(CRS("+init=epsg:32630"))

use_data(power_station, overwrite = TRUE)
