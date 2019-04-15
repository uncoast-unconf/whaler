docker <- NULL

.onLoad <- function(libname, pkgname) {
  docker <<- reticulate::import("docker", delay_load = TRUE)
}
