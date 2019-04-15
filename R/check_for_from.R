#' check_for_from
#'
#' @param dockerfile object from dockerfile()
#'
#' @return `from_check`list of true/false checks
#'
#' @export
#'
#' @examples dockerfile() %>% set_from(., "debian:stretch") %>% check_for_from()
#'
check_for_from <- function(dockerfile) {

  file_element <- ifelse(is.null(dockerfile()$FROM), TRUE, FALSE)
  docker_image <- ifelse(nchar(gsub(" ","",dockerfile$FROM)) > 4, TRUE, FALSE)

  from_check <- list(FromElement = file_element, FromImage = docker_image)

  return(from_check)

}
