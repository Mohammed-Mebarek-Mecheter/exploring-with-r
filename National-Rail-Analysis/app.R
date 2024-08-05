# app.R
library(shiny)

# Source UI and server components
source("R/ui.R")
source("R/server.R")

# Run the application 
shinyApp(ui = ui, server = server)
