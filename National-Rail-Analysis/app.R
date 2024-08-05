# app.R

# Load required libraries
library(shiny)
library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)
library(DT)

# Source UI and server files
source("R/ui.R")
source("R/server.R")

# Run the application
shinyApp(ui = ui, server = server)