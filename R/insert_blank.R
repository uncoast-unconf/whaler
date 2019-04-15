#' Adds a blank line at the end of the current dockerfile
#'
#' @param dockerfile, a specification of the contents of the dockerfile
#'
#' @return `dockerfile`, a specification of the contents of the dockerfile
#' @export
#'
#' @examples
#' dockerfile() %>%
#'   insert_blank() %>%
#'   write_dockerfile()
insert_blank <- function(dockerfile){
  return(c(dockerfile, ' '=''))
}
