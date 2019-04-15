#' Tag a Docker image
#'
#' Create a tag "target" that refers to "source" image
#'
#' @param source the name of a source image
#' @param target the tag name
#'
#' @return
#' @export
#'
#' @examples
tag <- function(source, target){
  img <- client$images$get(source)
  img$tag(target)
}
