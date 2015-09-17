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

intersect_bbox <- function(sp, xmin = NULL, xmax = NULL, ymin = NULL, ymax = NULL) {
  assert_that(is.null(xmin) || is.number(xmin))
  assert_that(is.null(xmax) || is.number(xmax))
  assert_that(is.null(ymin) || is.number(ymin))
  assert_that(is.null(ymax) || is.number(ymax))

  bbox <- bbox(sp)

  if (!is.null(xmin))
    bbox["x","min"] <- xmin
  if (!is.null(xmax))
    bbox["x","max"] <- xmax
  if (!is.null(ymin))
    bbox["y","min"] <- ymin
  if (!is.null(ymax))
    bbox["y","max"] <- ymax

  bbox <- matrix(c(bbox["x",c("min", "min", "max", "max", "min")],
                   bbox["y",c("min", "max", "max", "min", "min")]), ncol = 2)

  bbox %<>% sp::Polygon() %>% list() %>% sp::Polygons(ID = "id") %>% list() %>%
    sp::SpatialPolygons(proj4string=sp::CRS(sp::proj4string(sp)))
  sp %<>% rgeos::gIntersection(bbox, byid = TRUE)
}


scotland <- readOGR(dsn = "data-raw/scotland", layer = "european_region_region")
scotland <- scotland[scotland$CODE == "S15000001" & scotland$HECTARES >= 1000,]
scotland %<>% spTransform(CRS("+init=epsg:27700"))
scotland %<>% gSimplify(tol = 100, topologyPreserve = TRUE)

scotland %<>% intersect_bbox(ymax =  0.98 * 10 ^ 6)

use_data(scotland, overwrite = TRUE)
