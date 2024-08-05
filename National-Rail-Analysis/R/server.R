# R/server.R
library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(readr)
library(lubridate)  # Added lubridate for handling date and time

server <- function(input, output) {
  # Load and prepare the data
  data <- read_csv("data/railway.csv")
  
  # Reactive expressions for data processing
  popularRoutes <- reactive({
    data %>%
      count(Route, sort = TRUE) %>%
      top_n(10, n)
  })
  
  peakTravelTimes <- reactive({
    data %>%
      count(`Departure Hour`, wday(`Date of Journey`), sort = TRUE)
  })
  
  revenueAnalysis <- reactive({
    data %>%
      group_by(`Ticket Type`, `Ticket Class`) %>%
      summarise(TotalRevenue = sum(Price), .groups = 'drop')
  })
  
  onTimePerformance <- reactive({
    data %>%
      count(`Journey Status`) %>%
      filter(`Journey Status` %in% c("On Time", "Delayed"))
  })
  
  # Generate plots and tables
  output$popularRoutesPlot <- renderPlot({
    ggplot(popularRoutes(), aes(x = reorder(Route, n), y = n)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      labs(title = "Top 10 Popular Routes", x = "Route", y = "Number of Journeys")
  })
  
  output$popularRoutesTable <- renderTable({
    popularRoutes()
  })
  
  output$peakTravelTimesHeatmap <- renderPlot({
    ggplot(peakTravelTimes(), aes(x = wday(`Date of Journey`), y = `Departure Hour`, fill = n)) +
      geom_tile() +
      labs(title = "Peak Travel Times", x = "Day of the Week", y = "Hour of the Day")
  })
  
  output$peakTravelTimesLine <- renderPlot({
    ggplot(peakTravelTimes(), aes(x = `Departure Hour`, y = n, color = factor(wday(`Date of Journey`)))) +
      geom_line() +
      labs(title = "Peak Travel Times by Hour", x = "Hour of the Day", y = "Number of Journeys")
  })
  
  output$revenueBarPlot <- renderPlot({
    ggplot(revenueAnalysis(), aes(x = `Ticket Type`, y = TotalRevenue, fill = `Ticket Class`)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(title = "Revenue by Ticket Type and Class", x = "Ticket Type", y = "Total Revenue")
  })
  
  output$revenuePieChart <- renderPlot({
    ggplot(revenueAnalysis(), aes(x = "", y = TotalRevenue, fill = `Ticket Type`)) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar("y") +
      labs(title = "Revenue Distribution by Ticket Type")
  })
  
  output$onTimePerformancePlot <- renderPlot({
    ggplot(onTimePerformance(), aes(x = `Journey Status`, y = n, fill = `Journey Status`)) +
      geom_bar(stat = "identity") +
      labs(title = "On-Time Performance", x = "Journey Status", y = "Number of Journeys")
  })
  
  output$delayReasonsTable <- renderTable({
    data %>%
      filter(`Journey Status` == "Delayed") %>%
      count(`Reason for Delay`, sort = TRUE)
  })
}
