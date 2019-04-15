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
#' @examples dockerfile() %>% set_from(., "debian:stretch")
#'
set_from <- function(dockerfile, image) {

  FROM <- list(FROM = image)
  dockerfile <- c(dockerfile, FROM) %>%
    insert_blank()

}
