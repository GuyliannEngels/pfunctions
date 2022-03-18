check_project <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Check my project"),
    miniUI::miniContentPanel(
      shiny::h4("Compilation en html des fichiers Rmd"),
      shiny::tableOutput("render"),
      shiny::hr()
    )
    )

  server <- function(input, output, session) {

    res <- pfunctions::render_all_rmd_project(".")

    output$render <- shiny::renderTable({
        res
      })

    shiny::observeEvent(input$done, {
      res1 <- res[res$check == "ERROR", ]

      if(nrow(res1)>0)
        rstudioapi::navigateToFile(res1$file) ## open files that do not knit

      shiny::stopApp()
    })

    shiny::observeEvent(input$cancel, {
      shiny::stopApp()
    })

  }

  viewer <- shiny::paneViewer(300)
  shiny::runGadget(ui, server, viewer = viewer)

}
