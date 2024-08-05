# National Rail Shiny App

## Project Overview
This Shiny app provides insights into the National Rail data, including popular routes, peak travel times, revenue analysis, and on-time performance.

1. **Install required R packages**:
   ```R
   install.packages(c("shiny", "ggplot2", "dplyr", "readr", "lubridate", "DT"))
   ```

2. **Run the Shiny app**:
   ```R
   shiny::runApp("app.R")
   ```

## Usage
- **Popular Routes**: View the top 10 most popular train routes.
- **Peak Travel Times**: Analyze peak travel times using heatmaps and line plots.
- **Revenue Analysis**: Examine revenue distribution by ticket type and class.
- **On-Time Performance**: Investigate on-time performance and reasons for delays.
