#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
plot_demo = function(x) {
  ggplot(factored_demo, aes(x = .data[[x]], fill=.data[[x]]) ) +
    geom_bar()+theme(legend.position="none")+theme(axis.text.x = element_text(angle = 15,hjust = 0.5, size =7))+
    scale_x_discrete(labels = function(x) str_wrap(x, width = 8))
}

