#' sets environment variables in the docker image
#'
#' @param dockerfile an object of class `dockerfile`
#' @param env_vars A named vector of environment variables and their values
#'
#' @return `dockerfile`, a specification of the contents of the dockerfile
#' @export
#'
#' @examples
#' dockerfile() %>%
#'   set_env(c("S6_VERSION" = "${S6_VERSION:-v1.21.7.0}",
#'             "S6_BEHAVIOUR_IF_STAGE_2_FAILS", "2")) %>%
#'   write_dockerfile()
#'
set_env <- function(dockerfile, env_vars){
  # Creates the new list to be appended
  new_items <- vector("list", length(env_vars))
  # Names the new elements. They should all be 'ENV'
  names(new_items) <- rep("ENV", length(env_vars))

  # Loops through the new items, builds the text, and adds to the list
  for(ii in 1:length(env_vars)){
    new_items[[ii]] <- paste0(names(env_vars)[ii], '=', env_vars[[ii]])
  }

  # Combines old and new, adds a blank, and returns
  ret <- c(dockerfile, new_items) %>%
    insert_blank()
  return(ret)
}
