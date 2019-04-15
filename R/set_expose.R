#' Set which ports the docker image can expose, and what protocols to use
#'
#' @param dockerfile, an object of class `dockerfile`
#' @param port the port to expose
#' @param protocol charater vector of protocols to use. Defalts to 'tcp', but can take on 'tcp' or 'udp'
#'
#' @return `dockerfile`
#' @export
#'
#' @examples
#' dockerfile() %>%
#' set_expose(8080)
set_expose <- function(dockerfile, port, protocol = c("tcp")){
  values <- as.list(paste0(port, '/', protocol))
  names(values) <- "EXPOSE"

  ret <- c(dockerfile, values) %>%
    insert_blank()

  return(ret)
}
