# server.R

server <- function(input, output, session) {
  # Load the data
  railway_data <- reactive({
    df <- read_csv("data/railway.csv")
    df$`Date of Journey` <- as.Date(df$`Date of Journey`)
    df$`Departure Time` <- as.POSIXct(df$`Departure Time`, format = "%H:%M:%S")
    return(df)
  })
  
  # Popular Routes
  output$popular_routes_plot <- renderPlot({
    req(input$route_top_n)
    top_routes <- railway_data() %>%
      count(Route, sort = TRUE) %>%
      top_n(input$route_top_n)
    
    ggplot(top_routes, aes(x = reorder(Route, n), y = n)) +
      geom_bar(stat = "identity", fill = "skyblue") +
      coord_flip() +
      labs(title = paste("Top", input$route_top_n, "Most Popular Routes"), x = "Route", y = "Number of Journeys") +
      theme_minimal()
  })
  
  output$popular_routes_table <- renderDT({
    req(input$route_top_n)
    railway_data() %>%
      count(Route, sort = TRUE) %>%
      top_n(input$route_top_n) %>%
      rename("Number of Journeys" = n)
  })
  
  # Peak Travel Times
  output$peak_times_heatmap <- renderPlot({
    req(input$date_range)
    railway_data() %>%
      filter(`Date of Journey` >= input$date_range[1] & `Date of Journey` <= input$date_range[2]) %>%
      mutate(Hour = hour(`Departure Time`),
             Weekday = wday(`Date of Journey`, label = TRUE)) %>%
      count(Hour, Weekday) %>%
      ggplot(aes(x = Hour, y = Weekday, fill = n)) +
      geom_tile() +
      scale_fill_viridis_c() +
      labs(title = "Heatmap of Departures by Hour and Day", x = "Hour of Day", y = "Day of Week", fill = "Number of Departures") +
      theme_minimal()
  })
  
  output$peak_times_line <- renderPlot({
    req(input$date_range)
    railway_data() %>%
      filter(`Date of Journey` >= input$date_range[1] & `Date of Journey` <= input$date_range[2]) %>%
      mutate(Hour = hour(`Departure Time`)) %>%
      count(Hour, `Peak Travel`) %>%
      ggplot(aes(x = Hour, y = n, color = `Peak Travel`)) +
      geom_line() +
      geom_point() +
      labs(title = "Number of Departures by Hour and Peak Time", x = "Hour of Day", y = "Number of Departures") +
      theme_minimal()
  })
  
  # Revenue Analysis
  output$revenue_by_type_class <- renderPlot({
    req(input$ticket_types)
    railway_data() %>%
      filter(`Ticket Type` %in% input$ticket_types) %>%
      group_by(`Ticket Type`, `Ticket Class`) %>%
      summarise(Total_Revenue = sum(Price), .groups = "drop") %>%
      ggplot(aes(x = `Ticket Type`, y = Total_Revenue, fill = `Ticket Class`)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(title = "Revenue by Ticket Type and Class", x = "Ticket Type", y = "Total Revenue") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  output$ticket_type_distribution <- renderPlot({
    req(input$ticket_types)
    railway_data() %>%
      filter(`Ticket Type` %in% input$ticket_types) %>%
      count(`Ticket Type`) %>%
      ggplot(aes(x = "", y = n, fill = `Ticket Type`)) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar("y", start = 0) +
      labs(title = "Distribution of Ticket Types", fill = "Ticket Type") +
      theme_void()
  })
  
  # On-Time Performance
  output$ontime_vs_delayed <- renderPlot({
    req(input$performance_metric)
    if (input$performance_metric == "On-Time vs Delayed") {
      railway_data() %>%
        count(`Journey Status`) %>%
        ggplot(aes(x = `Journey Status`, y = n, fill = `Journey Status`)) +
        geom_bar(stat = "identity") +
        labs(title = "On-Time vs Delayed Journeys", x = "Journey Status", y = "Number of Journeys") +
        theme_minimal()
    } else {
      railway_data() %>%
        filter(`Journey Status` != "On Time") %>%
        count(`Reason for Delay`) %>%
        ggplot(aes(x = reorder(`Reason for Delay`, n), y = n)) +
        geom_bar(stat = "identity", fill = "coral") +
        coord_flip() +
        labs(title = "Reasons for Delay", x = "Reason", y = "Number of Delays") +
        theme_minimal()
    }
  })
  
  output$delay_reasons_table <- renderDT({
    railway_data() %>%
      filter(`Journey Status` != "On Time") %>%
      count(`Reason for Delay`, sort = TRUE) %>%
      rename("Number of Delays" = n)
  })
}