# Dependency: must be working with an RStudio Project
# TODO: Remove packrat dependency; initial run of packrat::init is overkill

library(packrat)
library(dplyr)
library(httr)
library(jsonlite)
library(purrr)

source("utils.R")

get_packages_list <- function(project_dir = getwd()) {
  # Init or snapshot to create or update the packrat.lock file
  lock_file <- paste0(project_dir, "/packrat/packrat.lock")
  if (!file.exists(lock_file)) {
    packrat::init(project = project_dir, options = list(), enter = FALSE)
  } else {
    packrat::snapshot(project_dir, prompt = FALSE, snapshot.sources = FALSE, infer.dependencies = TRUE)
  }
  # Read packrat.lock file to get df of packages and versions in use
  df <- as.data.frame(readDcf(lock_file), stringsAsFactors = FALSE)
  df <- cleanupWhitespace(df)
  df <- df %>% select(RVersion, Package, Version)
  # Create list with two elements: R version, and df of packages and versions
  r_version <- df[1,1]
  r_packages <- df[-1, 2:3]
  packages_list <- list("r_version" = r_version, "r_packages" = r_packages)
  packages_list
}

#
# WARNING: This API is currently down (15-Apr 2019) so this function does not work
#
# Use https://sysreqs.r-hub.io/ to get system requirements for the vector of R packages
# Pass in a dataframe of packages and versions, and the operating system for which you want the list of dependencies
# packages_df can be the second element of the list output of get_packages_list(), e.g.,
#
# package_list <- get_packages_list()
# packages_df <- package_list$r_packages
#
# The function takes the entire dataframe and parses out packages_df$Package explicitly,
# in case the packages_df$Version becomes useful later.
#
get_pkg_sys_deps <- function(packages_df, os) {
  endpoint <- "https://sysreqs.r-hub.org/pkg/"
  calls <- paste0(endpoint, packages_df$Package, "/", os)
  sysdeps <- map(calls, httr::GET)
  # TODO: when API is back up, may need to clean up the responses before outputting from this function
  sysdeps
}
