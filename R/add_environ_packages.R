#' Add packages from current environment to dockerfile
#'
#' @param dockerfile, a `dockerfile` object
#'
#' @return a dockerfile object
#' @export
#'
#' @examples
#' dockerfile() %>%
#'   get_current_package_dependencies()
#'
add_environ_packages <- function(dockerfile){
  # Get package dependencies
  pkg_depends <- get_current_package_dependencies()

  # Don't do anything if there aren't any dependencies
  if(nrow(pkg_depends) > 0){

    dockerfile <- dockerfile %>%
      set_run('R -e "install.packages(\'devtools\', dependencies=TRUE, repos=\'http://cran.rstudio.com/\'"', blank = FALSE)

    for(ii in 1:nrow(pkg_depends)){
      dockerfile <- dockerfile %>%
        set_run(create_install_command(pkg_depends$package[ii], pkg_depends$version[ii]), blank = FALSE)
    }

  }
  dockerfile
}

create_install_command <- function(package, version){
  if(is.null(version)){
    version="NULL"
  }
  paste0('R -e "install.version(\'', package, '\', version=', version, ', dependencies=\'Imports\', upgrade=FALSE)')
}
