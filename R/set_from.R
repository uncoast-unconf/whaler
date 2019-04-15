#' Title
#'
#' @param dockerfile `character` dockerfile() output
#' @param image `character`
#'
#' @return an object of class `dockerfile`
#' @export
#'
#' @examples
#'
set_from <- function(dockerfile, image) {

  FROM <- list(FROM = paste("FROM ", image))
  dockerfile <- c(file, FROM)

  return(dockerfile)

}
