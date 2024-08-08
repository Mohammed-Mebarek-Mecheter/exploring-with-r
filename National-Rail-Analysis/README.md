# National Rail Analytics Dashboard

## Project Overview

This Shiny app provides an interactive dashboard for analyzing National Rail data in the UK. It offers insights into popular routes, peak travel times, revenue analysis, and on-time performance.

## Features

1. **Popular Routes**: Visualize and list the most frequently traveled routes.
2. **Peak Travel Times**: Analyze travel patterns using heatmaps and line plots.
3. **Revenue Analysis**: Examine revenue distribution by ticket type and class.
4. **On-Time Performance**: Assess punctuality and reasons for delays.

## Project Structure

```
National-Rail-Analysis/
│
├── app.R
├── data/
│   └── railway.csv
├── www/
│   └── custom.css
├── R/
│   ├── server.R
│   └── ui.R
└── README.md
```

- `app.R`: Main entry point for the Shiny app
- `data/railway.csv`: Dataset containing National Rail information
- `www/style.css`: Custom styling for the app
- `R/server.R`: Server logic for data processing and visualization
- `R/ui.R`: User interface definition for the app

## Installation and Running the App

1. Ensure you have R and RStudio installed on your system.
2. Install the required packages by running the following commands in R:

```R
install.packages(c("shiny", "ggplot2", "dplyr", "readr", "lubridate", "DT"))
```

3. Clone or download this repository to your local machine.
4. Open the `app.R` file in RStudio.
5. Click the "Run App" button in RStudio, or run the following command in the R console:

```R
shiny::runApp("path/to/National-Rail-Analysis")
```

## Using the Dashboard

- **Popular Routes**: Select the number of top routes to display using the dropdown menu.
- **Peak Travel Times**: Use the date range picker to focus on specific periods.
- **Revenue Analysis**: Choose ticket types to include in the analysis using the checkboxes.
- **On-Time Performance**: Switch between overall performance and reasons for delay using the dropdown menu.

## Data Source

The data used in this dashboard is a mock dataset representing train ticket sales for National Rail in the UK from January to April 2024. It includes information such as ticket types, journey details, pricing, and performance metrics.

## Customization

To modify the app's appearance, edit the `www/style.css` file. For functional changes, update the `R/server.R` and `R/ui.R` files as needed.

## Contributing

Contributions to improve the dashboard are welcome. Please fork the repository and submit a pull request with your proposed changes.
