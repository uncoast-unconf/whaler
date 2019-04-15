#' List Docker images
#'
#' @param name Only show images belonging to the repository name
#' @param all Show intermediate image layers. By default, these are filtered out
#' @param filters Filters to be processed on the image list.
#'
#' @return list of images
#' @export
#'
#' @examples
#' docker_list()
docker_list <- function(name = NULL, all = NULL, filters = NULL) {
  client <- docker$client$from_env()
  client$images$list(name = name, all = all, filters = filters)
}
