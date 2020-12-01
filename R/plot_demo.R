#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
plot_demo = function(x) {
  ggplot(survey_demo, aes(x = .data[[x]], fill=.data[[x]]) ) +
    geom_bar()
}

