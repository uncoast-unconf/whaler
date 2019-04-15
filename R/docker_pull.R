#' Pull a Docker image from a repository
#'
#' @param repository the repository to pull
#' @param tag the tag to pull (optional)
#'
#' @export
#'
#' @examples
#' docker_pull("rocker/tidyverse")
docker_pull <- function(repository, tag = "latest") {
  client <- docker$client$from_env()
  client$images$pull(repository, tag = tag)
}
