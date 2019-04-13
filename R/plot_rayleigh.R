#' Plot the Rayleight Isotope Curve
#'
#' Plot the Rayleigh Isotope Curve
#'
#' This function takes a simple data.frame and plots
#' the delta values of the residual material along a Rayleigh
#' curve and returns a ggplot object.
#'
#' @param df The data.frame returned by calc_rayleigh

plot_rayleigh <- function(df) {
  ggplot2::ggplot(df, ggplot2::aes(x = fraction_remaining, y = delta)) +
    ggplot2::geom_point() +
    ggplot2::geom_line() +
    ggplot2::geom_hline(yintercept = df %>% dplyr::filter(fraction_remaining == 1) %>% dplyr::select(delta) %>% as.numeric()) +
    ggplot2::scale_x_reverse() +
    ggplot2::labs(x = "Fraction remaining",
         y = "\u3b4 (\u2030)")
}
