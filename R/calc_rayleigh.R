#' Calculate the Rayleigh Isotope Curve
#'
#' This function calculates the delta values of the residual material
#' along a Rayleigh curve and returns a data.frame of results.
#'
#' @param delta_initial The initial delta value
#' @param epsilon The isotope enrichement factor
#' @param element (optional) The element system, C, Hsmow, N, or Osmow
#' @return data.frame of results
#' @examples
#' calc_rayleigh(-20, -15)
#' calc_rayleigh(-20, -15, "C")

# Standard isotope ratios from https://en.wikipedia.org/wiki/Reference_materials_for_stable_isotope_analysis

calc_rayleigh <- function(delta_initial, epsilon, element = NULL) {
  if (is.null(element)) {
    fraction_remaining <- seq(0.1, 1 , 0.01)
    delta_residual <- delta_initial + epsilon * log(fraction_remaining)
    delta_inst_prod <- delta_residual + epsilon
    return(data.frame(fraction_remaining, delta_residual, delta_inst_prod))
  }
  else if (element == "C") {
    Rstd <-  0.011180
  }
  else if (element == "Hsmow") {
    Rstd <- 0.000155765
  }
  else if (element == "N") {
    Rstd <-  0.0036764
  }
  else if (element == "Osmow") {
    Rstd <-  0.00200525
  }
  alpha <- epsilon/1000 + 1
  fraction_remaining <- seq(0.1, 1 , 0.01)
  ratio_residual <- ((delta_initial/1000)+1)*Rstd * fraction_remaining ^ (alpha - 1)
  delta_residual <- (ratio_residual/Rstd - 1) * 1000
  delta_inst_prod <- (ratio_residual*alpha/Rstd - 1) * 1000
  return(data.frame(fraction_remaining, delta_residual, delta_inst_prod))
}
