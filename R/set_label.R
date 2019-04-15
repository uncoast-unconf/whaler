#' Add label metadata to an image
#'
#' @param dockerfile a specification of the contents of the dockerfile
#' @param label_vars A named vector of labels and their values
#'
#' @return `dockerfile`, a specification of the contents of the dockerfile
#' @export
#'
#' @examples
#' dockerfile() %>%
#' set_label(c("label_1"="value_1", "label_2"="value_2"))
#'
set_label <- function(dockerfile, label_vars){
  dockerfile
}
