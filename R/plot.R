#' Plot Scotland
#'
#' Plots Scotland and Western Isles with Loch Rannoch shaded.
#'
#' @return A ggplot2 object.
#' @export
#' @examples
#' plot_scotland()
plot_scotland <- function() {

  scotland <- NULL
  rannoch <- NULL

  data(list = "scotland", package = "ranmr", envir = environment())
  data(list = "rannoch", package = "ranmr", envir = environment())

  ggplot2::ggplot(data = scotland,  ggplot2::aes_string(x = "long / 1000", y = "lat / 1000")) +
    ggplot2::geom_polygon(fill = "grey70", color = "grey50", ggplot2::aes_string(group = "id")) +
    ggplot2::geom_polygon(data = rannoch, fill = "black", color = "black") +
    ggplot2::coord_equal() + ggplot2::xlab("Easting (km)") + ggplot2::ylab("Northing (km)")
}

#' Plot Loch Rannoch
#'
#' @return A ggplot2 object.
#' @export
#' @examples
#' plot_rannoch()
plot_rannoch <- function() {

  rannoch <- NULL
  power_station <- NULL

  data(list = "rannoch", package = "ranmr", envir = environment())
  data(list = "power_station", package = "ranmr", envir = environment())

  rannoch %<>% ggplot2::fortify() %>%
    dplyr::rename_(.dots = setNames(list(~long, ~lat), c("Easting", "Northing"))) %>%
    dplyr::mutate_(.dots = setNames(list(~Easting / 1000, ~Northing / 1000), c("Easting", "Northing")))

  power_station %<>% as.data.frame() %>%
    dplyr::rename_(.dots = setNames(list(~coords.x1, ~coords.x2), c("Easting", "Northing"))) %>%
    dplyr::mutate_(.dots = setNames(list(~Easting / 1000, ~Northing / 1000), c("Easting", "Northing")))

  ggplot2::ggplot(data = rannoch,  ggplot2::aes_string(x = "Easting", y = "Northing")) +
    ggplot2::geom_polygon(fill = "grey70", color = "grey50") +
    ggplot2::geom_point(data = power_station, shape = 15, color = "blue") +
    ggplot2::coord_equal() + ggplot2::xlab("Easting (km)") + ggplot2::ylab("Northing (km)")
}
