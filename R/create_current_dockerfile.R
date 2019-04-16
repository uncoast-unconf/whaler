#' Creates a dockerfile that mirrors the current environment
#'
#' @param `String` output dockerfile location and name, defaults to "Dockerfile"
#'
#' @return
#' @export `String` outputs dockerfile location and anme
#'
#'
#' @examples
#' create_current_dockerfile()
create_current_dockerfile <- function(file = "Dockerfile"){
  # Gets the current R version
  ver <- strsplit(R.version.string, split=" ")[[1]][3]

  dockerfile() %>%
    set_from(paste("rocker/r-ver:", ver)) %>%
    add_environ_packages() %>%
    write_dockerfile(file = file, overwrite = TRUE)

}
