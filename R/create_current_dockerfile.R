create_current_dockerfile <- function(){
  # Gets the current R version
  ver <- strsplit(R.version.string, split=" ")[[1]][3]

  dockerfile() %>%
    set_from(paste("rocker/r-ver:", ver)) %>%
    add_environ_packages() %>%
    write_dockerfile(overwrite = TRUE)

}
