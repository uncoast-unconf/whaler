#' Docker module object
#'
#' Uses the reticulate framework to access the Docker SDK.
#'
#' @export docker
docker <- NULL

.onLoad <- function(libname, pkgname) {
  docker <<- reticulate::import("docker", delay_load = TRUE)
}
