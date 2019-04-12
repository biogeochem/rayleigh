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
  ggplot(df, aes(x = fraction_remaining, y = delta)) +
    geom_point() +
    geom_line() +
    scale_x_reverse() +
    labs(x = "Fraction remaining",
         y = "\u3b4 (\u2030)")
}
