#' Set a command to run in the image
#'
#' @param dockerfile a specification of the contents of the dockerfile
#' @param command a command to run in the shell
#' @param blank boolean indicating whether or not to add a trailing space
#'
#' @return `dockerfile`
#' @export
#'
#' @examples
#' dockerfile() %>%
#'   set_run("-R install.packages('ggplot2')")
set_run <- function(dockerfile, command, blank = TRUE){
  ret <- c(dockerfile,
           list('RUN' = command))

  if(blank) ret <- ret %>% insert_blank()

  return(ret)
}
