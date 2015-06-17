
shinyUI(fluidPage(
  sidebarLayout(
  sidebarPanel(

    textInput("series", "select KSSL Pedon", value="Apron"),
    uiOutput("fetch")
  ),

  mainPanel(
    plotOutput("plot")
    )
)

))

