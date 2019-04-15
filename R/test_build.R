# library(whaler)
reticulate::use_virtualenv(virtualenv = ".")

build("inst/Dockerfiles/helloworld/")
