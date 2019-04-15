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
#' docker_build(path = "Dockerfiles/helloworld")
docker_build <- function(path = here::here(), tag = NULL) {
  client <- docker$client$from_env()
  client$images$build(path = path, tag = tag)
}
