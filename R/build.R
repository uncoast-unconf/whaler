#' Build an image from a Dockerfile
#'
#' @param path A file path to the Dockerfile, defaults to the current working
#' directory
#' @param tag A tag to add to the final image
#'
#' @return
#' @export
#'
#' @examples
#' build()
build <- function(path = ".", tag = NULL) {
  client <- docker$client$from_env()
  client$images$build(path = path, tag = tag)
}
