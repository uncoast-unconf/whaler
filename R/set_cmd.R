#' Set a command to executed when running the image
#'
#' @param command a command to be passed to the dockerfile
#' @param dockerfile a dockerfile object
#'
#' @return a dockerfile object
#' @export
#'
#' @examples
#'
set_cmd <- function(dockerfile, command, blank = TRUE){
  ret <- dockerfile %>%
    list('CMD' = command)

  if(blank) ret <- ret %>% insert_blank()

  return(ret)
}
