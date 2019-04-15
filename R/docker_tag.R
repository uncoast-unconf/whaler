#' Tag a Docker image
#'
#' Create a tag "target" that refers to "source" image
#'
#' @param source the name of a source image
#' @param target the tag name
#'
#' @return the tagged image
#' @export
#'
#' @examples
#' \dontrun{
#' docker_tag("rocker/tidyverse", "v1.2.3.9000")
#' }
docker_tag <- function(source, target){
  img <- client$images$get(source)
  img$tag(target)
}
