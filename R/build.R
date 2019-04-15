#' Build an image from a Dockerfile
#'
#' @param path A file path to the Dockerfile, defaults to the current working
#' directory
#' @param tag A tag to add to the final image
#'
#' @return the built Docker image object
#' @export
#'
#' @examples
#' build(path = "Dockerfiles/helloworld")
build <- function(path = ".", tag = NULL) {
  client <- docker$client$from_env()
  client$images$build(path = path, tag = tag)
}
