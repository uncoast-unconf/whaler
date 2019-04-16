addin_run_container <- function() {

  ui <- miniUI::miniPage(
    miniUI::miniContentPanel(
      shiny::textInput(
        inputId = "image",
        label = "Image name",
        value = "trestletech/plumber:latest"
      ),
      shiny::textInput(
        inputId = "name",
        label = "Container name"
      ),
      shiny::actionButton(
        inputId = "run",
        label = "Run"
      )
    )
  )

  server <- function(input, output, session) {
    shiny::observeEvent(input$run, {
      rx <- callr::r_bg(func = function(image, name) {
        docker <- stevedore::docker_client()
        docker$container$run(image = image, name = name)
      }, args = list(image = input$image, name = generate_name()))
      rx
      invisible(shiny::stopApp())
    })

    shiny::observeEvent(input$done, {
      invisible(shiny::stopApp())
    })
  }

  viewer <- shiny::dialogViewer(
    dialogName = "Subset",
    width = 400,
    height = 300
  )
  shiny::runGadget(ui, server, viewer = viewer)
}

generate_name <- function() {
  left <- c(
    "admiring",
    "adoring",
    "affectionate",
    "agitated",
    "amazing",
    "angry",
    "awesome",
    "beautiful",
    "blissful",
    "bold",
    "boring",
    "brave",
    "busy",
    "charming",
    "clever",
    "cocky",
    "cool",
    "compassionate",
    "competent",
    "condescending",
    "confident",
    "cranky",
    "crazy",
    "dazzling",
    "determined",
    "distracted",
    "dreamy",
    "eager",
    "ecstatic",
    "elastic",
    "elated",
    "elegant",
    "eloquent",
    "epic",
    "exciting",
    "fervent",
    "festive",
    "flamboyant",
    "focused",
    "friendly",
    "frosty",
    "funny",
    "gallant",
    "gifted",
    "goofy",
    "gracious",
    "great",
    "happy",
    "hardcore",
    "heuristic",
    "hopeful",
    "hungry",
    "infallible",
    "inspiring",
    "interesting",
    "intelligent",
    "jolly",
    "jovial",
    "keen",
    "kind",
    "laughing",
    "loving",
    "lucid",
    "magical",
    "mystifying",
    "modest",
    "musing",
    "naughty",
    "nervous",
    "nice",
    "nifty",
    "nostalgic",
    "objective",
    "optimistic",
    "peaceful",
    "pedantic",
    "pensive",
    "practical",
    "priceless",
    "quirky",
    "quizzical",
    "recursing",
    "relaxed",
    "reverent",
    "romantic",
    "sad",
    "serene",
    "sharp",
    "silly",
    "sleepy",
    "stoic",
    "strange",
    "stupefied",
    "suspicious",
    "sweet",
    "tender",
    "thirsty",
    "trusting",
    "unruffled",
    "upbeat",
    "vibrant",
    "vigilant",
    "vigorous",
    "wizardly",
    "wonderful",
    "xenodochial",
    "youthful",
    "zealous",
    "zen"
  )
  right <- c(
    "douglas_bates",
    "john_chambers",
    "peter_dalgaard",
    "robert_gentleman",
    "kurt_hornik",
    "ross_ihaka",
    "tomas_kalibera",
    "michael_lawrence",
    "friedrich_leisch",
    "uwe_ligges",
    "thomas_lumley",
    "martin_maechler",
    "martin_morgan",
    "paul_murrell",
    "martyn_plummer",
    "brian_ripley",
    "deepayan_sarkar",
    "duncan_temple_lang",
    "luke_tierney",
    "simon_urbanek"
  )
  paste(sample(left, size = 1), sample(right, size = 1), sep = "_")
}
