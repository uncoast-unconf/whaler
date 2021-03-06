#' Gets packages that are loaded in the current envrionment, their dependencies, and the versions for all
#'
#' @return `tibble` of packages and their required version
#' @export
#'
#' @import tibble
#' @examples
#' get_current_package_dependencies()
get_current_package_dependencies <- function(){

  # Get base and other attached packages
  other_pkgs <- utils::sessionInfo()$otherPkgs
  other_pkgs_versions <- unlist(lapply(other_pkgs, function(x) x$Version))
  tibble::tibble(package = names(other_pkgs), version = other_pkgs_versions)

  other_depends <- lapply(other_pkgs,
                          function(x){
                            if(!is.null(x$Imports)){
                              return(extract_depends(x$Imports))
                            }
                          }) %>%
    dplyr::bind_rows() %>%
    dplyr::group_by(package) %>%
    dplyr::arrange(dplyr::desc(version)) %>%
    dplyr::mutate(age = 1:dplyr::n()) %>%
    dplyr::ungroup() %>%
    dplyr::filter(age == 1) %>%
    dplyr::select(-age)
}

extract_depends <- function(imports_string){
  # Remove \n hanging around
  depends_versions <- imports_string %>%
    gsub("\\\n"," ", .) %>%
    strsplit(',') %>%
    extract2(1) %>%
    gsub('(^ )|(>= )|(\\)$)','', .) %>%
    strsplit(' \\(') %>%
    lapply(function(x){
      package <- x[1]
      version <- NA
      if(length(x) == 2){
        version <- x[2]
      }
      tibble::tibble(package, version)
    }) %>%
    dplyr::bind_rows()
  return(depends_versions)
}
