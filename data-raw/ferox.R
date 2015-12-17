library(dplyr)
library(magrittr)
library(sp)
library(devtools)

rm(list = ls())

ferox <- read.csv("data-raw/ferox.csv")

ferox %<>% mutate(Date = as.Date(Date),
               Fish = as.factor(FishID),
               Length = as.integer(Length * 10),
               Mass = round((Weightlb + Weightoz / 16) / 2.2, 2))

ferox %<>% filter(Group == "ferox85" & Deformed == "no")
ferox$Fish %<>% droplevels()

ferox$Latitude <- as.numeric(sub("^\\w(\\d\\d).*", "\\1", ferox$Position, perl = TRUE))
ferox$Latitude <- ferox$Latitude + as.numeric(sub("^\\w\\d\\d\\s([\\S]+).*", "\\1", ferox$Position, perl = TRUE)) / 60
ferox$Longitude <- as.numeric(sub(".*\\s\\w(\\d)\\s.*", "\\1", ferox$Position, perl = TRUE))
ferox$Longitude <- ferox$Longitude + as.numeric(sub(".*\\s\\w\\d\\s([.\\d]+)$", "\\1", ferox$Position, perl = TRUE)) / 60

pos <- SpatialPoints(cbind(ferox$Longitude * -1, ferox$Latitude), proj4string=CRS("+proj=longlat +init=epsg:27700"))
pos %<>% spTransform(CRS=CRS("+init=epsg:32630"))

ferox$Easting <- as.integer(data.frame(pos)[,1])
ferox$Northing <- as.integer(data.frame(pos)[,2])

ferox %<>% select(Date, Fish, Length, Mass, as.integer(Age), Easting, Northing) %>%
  mutate(Easting = Easting / 1000, Northing = Northing / 1000)

use_data(ferox, overwrite = TRUE)
