#' Set a command to run in the image
#'
#' @param dockerfile a specification of the contents of the dockerfile
#' @param command a command to run in the shell
#'
#' @return `dockerfile`
#' @export
#'
#' @examples
#' dockerfile() %>%
#'   set_run("-R install.packages('ggplot2')")
set_run <- function(dockerfile, command){
  ret <- c(dockerfile,
           list('RUN', command)) %>%
    insert_blank()

  return(ret)
}
