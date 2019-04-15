#' set_from
#'
#' @param dockerfile, an object of class `dockerfile`
#' @param image an object of class `character`
#'
#' @import magrittr
#'
#' @return an object of class `dockerfile`
#'
#' @export
#'
#' @examples dockerfile() %>% setfrom(., "debian:stretch")
#'
set_from <- function(dockerfile, image) {

  FROM <- list(FROM = paste("FROM ", image))
  dockerfile <- c(file, FROM)

}
