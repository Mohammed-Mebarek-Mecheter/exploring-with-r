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
                 selectInput("route_top_n", "Number of top routes to display:", 
                             choices = c(5, 10, 15, 20), selected = 10)
               ),
               mainPanel(
                 fluidRow(
                   column(6, plotOutput("popular_routes_plot")),
                   column(6, DTOutput("popular_routes_table"))
                 )
               )
             )
    ),
    tabPanel("Peak Travel Times",
             sidebarLayout(
               sidebarPanel(
                 dateRangeInput("date_range", "Select Date Range:",
                                start = as.Date("2024-01-01"),
                                end = as.Date("2024-04-30"))
               ),
               mainPanel(
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
                 checkboxGroupInput("ticket_types", "Select Ticket Types:",
                                    choices = c("Advance", "Off-Peak", "Anytime"),
                                    selected = c("Advance", "Off-Peak", "Anytime"))
               ),
               mainPanel(
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
                 selectInput("performance_metric", "Select Performance Metric:",
                             choices = c("On-Time vs Delayed", "Reasons for Delay"),
                             selected = "On-Time vs Delayed")
               ),
               mainPanel(
                 fluidRow(
                   column(12, plotOutput("ontime_vs_delayed")),
                   column(12, DTOutput("delay_reasons_table"))
                 )
               )
             )
    )
  )
)