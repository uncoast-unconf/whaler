
#' Install python docker package
#'
#' @param method Installation method, passed to py_install
#' @param conda Path to conda, passed to py_install
#'
#' @export
#'
#' @examples
#' \dontrun{
#' install_docker()
#' }
install_docker <- function(method = "auto", conda = "auto") {
  reticulate::py_install("docker", method = method, conda = conda)
}
