
#' Docker Client
#'
#' an interface to the docker engine
#'
#' @return a docker client
#'
#' @examples
client <- function(){
  docker$client$from_env()
}
