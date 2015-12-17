#' Plot Loch Rannoch
#'
#' @return A ggplot2 object.
#' @export
#' @examples
#' plot_rannoch()
plot_rannoch <- function() {

  rannoch <- NULL
  power_station <- NULL

  data(list = "rannoch", package = "ranmrdata", envir = environment())
  data(list = "power_station", package = "ranmrdata", envir = environment())

  rannoch %<>% ggplot2::fortify() %>%
    dplyr::rename_(.dots = setNames(list(~long, ~lat), c("Easting", "Northing"))) %>%
    dplyr::mutate_(.dots = setNames(list(~Easting / 1000, ~Northing / 1000), c("Easting", "Northing")))

  power_station %<>% as.data.frame() %>%
    dplyr::rename_(.dots = setNames(list(~coords.x1, ~coords.x2), c("Easting", "Northing"))) %>%
    dplyr::mutate_(.dots = setNames(list(~Easting / 1000, ~Northing / 1000), c("Easting", "Northing")))

  ggplot2::ggplot(data = rannoch,  ggplot2::aes_string(x = "Easting", y = "Northing")) +
    ggplot2::geom_polygon(fill = "grey70", color = "grey50") +
    ggplot2::geom_point(data = power_station, shape = 15, color = "blue") +
    ggplot2::coord_equal() + ggplot2::scale_x_continuous("Easting (km)", labels = scales::comma) +
    ggplot2::scale_y_continuous("Northing (km)", labels = scales::comma)
}
