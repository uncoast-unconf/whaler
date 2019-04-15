#' Tag a Docker image
#'
#' Create a tag "target" that refers to "source" image
#'
#' @param source
#' @param target
#'
#' @return
#' @export
#'
#' @examples
tag <- function(source, target){
  system2("docker", "tag", )
}
