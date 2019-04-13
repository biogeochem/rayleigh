#' Calculate the Rayleigh Isotope Curve
#'
#' This function calculates the delta values of the residual material
#' along a Rayleigh curve and returns a data.frame of results.
#'
#' @param delta_initial The initial delta value
#' @param epsilon The isotope enrichement factor

calc_rayleigh <- function(delta_initial, epsilon) {
  fraction_remaining <- seq(0.1, 1 , 0.01)
  delta_residual <- delta_initial + epsilon * log(fraction_remaining)
  delta_inst_prod <- delta_residual + epsilon
  data.frame(fraction_remaining, delta_residual, delta_inst_prod)
}
