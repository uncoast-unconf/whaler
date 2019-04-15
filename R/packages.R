# Dependency: must be working with an RStudio Project
# TODO: Remove packrat dependency; initial run of packrat::init is overkill

library(packrat)
library(dplyr)

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
