# ui.R
library(DT)

ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  titlePanel("National Rail Analytics Dashboard"),
  
  tabsetPanel(
    tabPanel("Popular Routes",
             sidebarLayout(
               sidebarPanel(
                 width = 3,  # Reduce sidebar width
                 selectInput("route_top_n", "Number of top routes to display:", 
                             choices = c(5, 10, 15, 20), selected = 10)
               ),
               mainPanel(
                 width = 9,  # Increase main panel width
                 plotOutput("popular_routes_plot"),
                 DTOutput("popular_routes_table")
               )
             )
    ),
    tabPanel("Peak Travel Times",
             sidebarLayout(
               sidebarPanel(
                 width = 3,  # Reduce sidebar width
                 dateRangeInput("date_range", "Select Date Range:",
                                start = as.Date("2024-01-01"),
                                end = as.Date("2024-04-30"))
               ),
               mainPanel(
                 width = 9,  # Increase main panel width
                 fluidRow(
                   column(6, plotOutput("peak_times_heatmap")),
                   column(6, plotOutput("peak_times_line"))
                 )
               )
             )
    ),
    tabPanel("Revenue Analysis",
             sidebarLayout(
               sidebarPanel(
                 width = 3,  # Reduce sidebar width
                 checkboxGroupInput("ticket_types", "Select Ticket Types:",
                                    choices = c("Advance", "Off-Peak", "Anytime"),
                                    selected = c("Advance", "Off-Peak", "Anytime"))
               ),
               mainPanel(
                 width = 9,  # Increase main panel width
                 fluidRow(
                   column(6, plotOutput("revenue_by_type_class")),
                   column(6, plotOutput("ticket_type_distribution"))
                 )
               )
             )
    ),
    tabPanel("On-Time Performance",
             sidebarLayout(
               sidebarPanel(
                 width = 3,  # Reduce sidebar width
                 selectInput("performance_metric", "Select Performance Metric:",
                             choices = c("On-Time vs Delayed", "Reasons for Delay"),
                             selected = "On-Time vs Delayed")
               ),
               mainPanel(
                 width = 9,  # Increase main panel width
                 plotOutput("ontime_vs_delayed"),
                 DTOutput("delay_reasons_table")
               )
             )
    )
  )
)