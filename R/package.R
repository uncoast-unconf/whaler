utils::globalVariables(c(".", "package", "age"))

#' Docker module object
#'
#' Uses the reticulate framework to access the Docker SDK.
#'
#' @export docker
docker <- NULL

.onLoad <- function(libname, pkgname) {
  docker <<- stevedore::docker_client()
}
