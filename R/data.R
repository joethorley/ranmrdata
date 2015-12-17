#' Loch Rannoch Shoreline
#'
#' @format A SpatialPolygons object of the shoreline of Loch Rannoch, Scotland.
#' The projection is EPSG:32630.
#' @seealso \code{\link{ranmrdata}}
"rannoch"

#' Rannoch Power Station
#'
#' @format A SpatialPoints object of the location of Rannoch Power Station.
#' The projection is EPSG:32630.
#' @seealso \code{\link{ranmrdata}}
"power_station"

#' Loch Rannoch Ferox Trout Mark-Recapture Data
#'
#' @format A data frame with the following columns:
#' \describe{
#'   \item{Date}{The date of capture or recapture as a Date.}
#'   \item{Fish}{The individual fish identifier as a factor.}
#'   \item{Length}{The fork length of the fish at (re)capture (in mm) as an integer.}
#'   \item{Mass}{The wet mass of the fish at (re)capture (in kg) as a numeric.}
#'   \item{Age}{The scale age of the fish at (re)capture (in yr) as an integer.}
#'   \item{Easting}{The easting (in km of projection EPSG:32630) as a numeric.}
#'   \item{Northing}{The northing (in km of projection EPSG:32630) as a numeric.}
#' }
#' @seealso \code{\link{ranmrdata}}
"ferox"
