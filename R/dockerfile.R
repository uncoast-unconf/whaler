#' dockerfile creates a basic, empty docker object
#'
#' @return `dockerfile`, a specification of the contents of the dockerfile
#'
#' @export
#'
#' @examples
#' dockerfile()
#'
dockerfile <- function(){
  ret <- list()
  class(ret) <- "dockerfile"
  return(ret)
}
