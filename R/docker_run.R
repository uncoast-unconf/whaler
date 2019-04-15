#' Run a Docker container
#'
#' @param image the name of the Docker container to run
#' @param command the command to run in the container (optional)
#'
#' @return the container output
#' @export
#'
#' @examples
#' docker_run("alpine", "echo hello world")
docker_run <- function(image, command=NULL) {
  client <- docker$client$from_env()
  client$containers$run(image = image, command = command)
}
