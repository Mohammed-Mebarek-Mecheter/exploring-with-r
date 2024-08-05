# R/ui.R
library(shiny)

ui <- fluidPage(
  titlePanel("National Rail Analysis"),
  includeCSS()
  sidebarLayout(
    sidebarPanel(
      helpText("Analyze National Rail data to identify popular routes, peak travel times, revenue analysis, and on-time performance.")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Popular Routes", plotOutput("popularRoutesPlot"), tableOutput("popularRoutesTable")),
        tabPanel("Peak Travel Times", plotOutput("peakTravelTimesHeatmap"), plotOutput("peakTravelTimesLine")),
        tabPanel("Revenue Analysis", plotOutput("revenueBarPlot"), plotOutput("revenuePieChart")),
        tabPanel("On-Time Performance", plotOutput("onTimePerformancePlot"), tableOutput("delayReasonsTable"))
      )
    )
  )
)
