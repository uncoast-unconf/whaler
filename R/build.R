#' Build a Docker image
#'
#' @param path file path to the Dockerfile, defaults to the current working
#' directory
#'
#' @return
#' @export
#'
#' @examples
build <- function(path = ".") {
  system2("docker", "build", path)
}
