library(soilDB)
library(plotrix)

shinyServer(function(input, output) {
  
output$fetch <- renderUI({
  kssl <- fetchKSSL(input$series)
  checkboxGroupInput("pedon_id", "Choose Pedons you want to keep", 
                     choices  = kssl$pedon_id, selected = kssl$pedon_id)
  })


#output$plot.ui <- renderUI({
#  plotOutput('plot')
#})

output$plot <- renderPlot({
  kssl <- fetchKSSL(input$series)
  #if(is.null(input$pedon_id))
  #  return()
  # Get the Pedon_Id's set
  dat <- get(input$pedon_id)
  # columns will initially be for the previous data set
  #if (is.null(input$pedon_id) || !(input$pedon_id %in% names(dat)))
  #  return()
  # Keep the selected columns
  dat <- dat[, input$pedon_id, drop = FALSE]
  kssl <- kssl[grep(pattern=dat, kssl$pedon_id, ignore.case=TRUE), ]
  plot(kssl, name='hzn_desgn', color='clay')
})

## This works, but only displays 1 plot at a time
#output$plot <- renderPlot({
#  kssl <- fetchKSSL(input$series)
#  kssl <- kssl[grep(pattern=input$pedon_id, kssl$pedon_id, ignore.case=TRUE), ]
#  plot(kssl, name='hzn_desgn', color='clay')
#})

})

# This only works if I load the kssl data, first. The Shiny app will not run. 
#kssl <- fetchKSSL(series='gladstone')

#dat <- get(kssl$pedon_id)
