#' Write a dockerfile from a dockerfile object
#'
#' @param dockerfile, an object of class `dockerfile`
#'
#' @return an object of class `dockerfile`
#'
#' @import magrittr
#'
#' @export
#'
#' @examples
#' dockerfile() %>%
#'   insert_blank() %>%
#'   write_dockerfile()
#'
write_dockerfile <- function(dockerfile, file = "Dockerfile", overwrite = FALSE){

  if(file.exists(file) & !overwrite){
    stop("File exists and overwrite = FALSE")
  }

  if(file.exists(file) & overwrite){
    file.remove(file)
  }

  # Loop through dockerfile items
  for(ii in 1:length(dockerfile)){
    # For each item in the dockerfile object, loop through and write out the individual line
    for(jj in 1:length(dockerfile[ii])){
      # For each dockerfile item, write out a line

      # The first line always includes the action word
      if(jj == 1){
        write(x = paste(names(dockerfile)[ii], dockerfile[[ii]][jj]),
              file = file,
              append = TRUE)
      }else{
        write(x = paste(dockerfile[[ii]][jj]),
              file = file,
              append = TRUE)
      }
    }
  }

  # Return the dockerfile, unedited
  return(file)

}
