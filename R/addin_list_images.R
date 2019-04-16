addin_list_images <- function() {

  ui <- miniUI::miniPage(
    style = "background: #F8FDFF",
    miniUI::gadgetTitleBar(title = "Docker Images", left = NULL,
                           right = miniUI::miniTitleBarButton("done", "Done", primary = FALSE)),
    miniUI::miniContentPanel(
      shiny::dataTableOutput("images_df")
    )
  )

  server <- function(input, output, session) {
    output$images_df <- shiny::renderDataTable(
      docker$image$list()
    )

    shiny::observeEvent(input$done, {
      shiny::stopApp()
    })
  }

  shiny::runGadget(ui, server)
}
