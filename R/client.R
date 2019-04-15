
#' Docker Client
#'
#' an interface to the docker engine
#'
#' @return
#' @export
#'
#' @examples
client <- function(){
  docker$client$from_env()
}
