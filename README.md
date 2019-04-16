
<!-- README.md is generated from README.Rmd. Please edit that file -->

# whaler

<!-- badges: start -->

<!-- badges: end -->

whaler is a package for interfacing with Docker from
R.

## Installation

<!-- You can install the released version of whaler from [CRAN](https://CRAN.R-project.org) with: -->

<!-- ``` r -->

<!-- install.packages("whaler") -->

<!-- ``` -->

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("uncoast-unconf/whaler")
```

## Usage

There are a few basic commands that are analagous to their Docker CLI
counterparts:

``` r
library(whaler)

# List images
docker_images()

# Run echo command in the alpine image
docker_run("alpine:latest", "echo hello world")

# Build Dockerfile in directory
docker_build("path/to/directory")
```

## Todo

In the dockerfile generation, we sill need set\_\* functions for:

  - CMD
  - ADD
  - COPY
  - ENTRYPOINT
  - VOLUME
  - USER
  - WORKDIR
  - ARG
  - ONBUILD
  - STOPSIGNAL
  - HEALTHCHECK
  - SHELL

And we have set\_\* functions
for:

  - ENV
  - EXPOST
  - FROM
  - LABEL
  - RUN

<!-- ## Example -->

<!-- This is a basic example which shows you how to solve a common problem: -->

<!-- ```{r example} -->

<!-- library(whaler) -->

<!-- ## basic example code -->

<!-- ``` -->

<!-- What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so: -->

<!-- ```{r cars} -->

<!-- summary(cars) -->

<!-- ``` -->

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. -->

<!-- You can also embed plots, for example: -->

<!-- ```{r pressure, echo = FALSE} -->

<!-- plot(pressure) -->

<!-- ``` -->

<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub! -->
