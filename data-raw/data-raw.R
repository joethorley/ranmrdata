library(dplyr)
library(magrittr)
library(rgdal)
library(sp)
library(devtools)

rm(list = ls())

rannoch <- readOGR(dsn = file.path("data-raw", "LochRannoch"), layer = "LochRannoch")
rannoch <- SpatialPolygons(rannoch@polygons,proj4string=rannoch@proj4string)
rannoch %<>% spTransform(CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))

use_data(rannoch, overwrite = TRUE)

ferox <- read.csv("data-raw/ferox.csv")

ferox %<>% filter(Group == "ferox85" & Deformed == "no")

ferox$Fish %<>% sprintf("%02d", .) %>% paste0("F", .) %>% factor()

ferox %<>% mutate(Date = as.Date(Date),
               Length = as.integer(Length * 10),
               Age = as.integer(Age),
               Mass = round((Weightlb + Weightoz / 16) / 2.2, 2))

ferox$Latitude <- as.numeric(sub("^\\w(\\d\\d).*", "\\1", ferox$Position, perl = TRUE))
ferox$Latitude <- ferox$Latitude + as.numeric(sub("^\\w\\d\\d\\s([\\S]+).*", "\\1", ferox$Position, perl = TRUE)) / 60
ferox$Longitude <- as.numeric(sub(".*\\s\\w(\\d)\\s.*", "\\1", ferox$Position, perl = TRUE))
ferox$Longitude <- ferox$Longitude + as.numeric(sub(".*\\s\\w\\d\\s([.\\d]+)$", "\\1", ferox$Position, perl = TRUE)) / 60

pos <- SpatialPoints(cbind(ferox$Longitude * -1, ferox$Latitude), proj4string = CRS("+proj=longlat +init=epsg:27700"))
pos %<>% spTransform(CRS = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"))

ferox$Latitude <- data.frame(pos)[,2]
ferox$Longitude <- data.frame(pos)[,1]

ferox %<>% select(Date, Fish, Length, Mass, Age, Latitude, Longitude)

ferox %<>% as.tbl()

use_data(ferox, overwrite = TRUE)
