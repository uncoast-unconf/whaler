readDcf <- function(...) {
  loc <- Sys.getlocale('LC_CTYPE')
  on.exit(Sys.setlocale('LC_CTYPE', loc))
  read.dcf(...)
}

cleanupWhitespace <- function(df) {
  for (i in seq_along(df)) {
    if (is.character(df[[i]]))
      df[[i]] <- sub('^\\s*(.*?)\\s*$', '\\1', df[[i]])
  }
  return(df)
}
