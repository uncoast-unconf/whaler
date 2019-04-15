#' Pre-formats and opens a new dockerfile
#'
#' @param name, the name of the dockerfile to be created
#'
#' @return nothing
#' @export
#'
#' @examples
#'  basic_dockerfile("my.dockerfile")
#'
basic_dockerfile <- function(open = TRUE){
  fileConn <- file("Dockerfile")
  writeLines( text = c(
    "# Specify the base image from which you are building off of.",
    "# Any image can be your base image.",
    "# Images can be found at https://hub.docker.com/search/?type=image",
    "FROM debian:stretch"),
    con = fileConn
  )
  if(open){
    file.edit("Dockerfile")
  }
}
