docker_list_addin <- function() {
  imgs <- docker_images()
  tbl <- do.call(rbind.data.frame, lapply(imgs, docker_image_info))

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar(title = "Docker Images", left = NULL),
    miniUI::miniContentPanel(
      shiny::dataTableOutput("tbl")
    )
  )

  server <- function(input, output, session) {
    output$tbl <- shiny::renderDataTable(
      tbl
    )

    shiny::observeEvent(input$done, {
      shiny::stopApp()
    })
  }

  shiny::runGadget(ui, server)
}

#' Get info about a Docker iamge
#'
#' @param img a Docker image object
#'
#' @return list of the image attributes
docker_image_info <- function(img) {
  RepoTags <- img$attrs$RepoTags
  if (is.null(RepoTags)) {
    repository <- NULL
    tag <- NULL
  } else {
    parts <- strsplit(RepoTags, split = ":")[[1]]
    repository <- parts[1]
    if (length(parts) > 1) {
      tag <- parts[2]
    } else {
      tag <- NULL
    }
  }
  size <- utils:::format.object_size(
    x = img$attrs$Size,
    units = "auto",
    standard = "SI"
  )
  list(
    "repository" = repository,
    "tag" = tag,
    "imageid" = substr(img$attrs$Id, 8, 19),
    "created" = img$attrs$Created,
    "size" = size
  )
}
