# Load necessary libraries
library(ggplot2)
library(ggmap)
library(dplyr)

# Load the datasets
calls <- read.csv("data/police-department-calls-for-service.csv")
incidents <- read.csv("data/police-department-incidents.csv")

# Filter data for relevant crime categories (optional)
# Filter for a specific category, e.g., "GRAND THEFT FROM LOCKED AUTO"
auto_calls <- calls_data %>% filter(Descript == "GRAND THEFT FROM LOCKED AUTO")
auto_incidents <- incidents_data %>% filter(Descript == "GRAND THEFT FROM LOCKED AUTO")

# Read in the preprocessed map of San Francisco (assuming it's saved locally as sf_map.RDS)
sf_map <- readRDS("datasets/sf_map.RDS")

# Plot a heatmap for calls data
ggmap(sf_map) +
  stat_density_2d(
    aes(x = X, y = Y, fill = ..level..), alpha = 0.5,
    size = 0.01, bins = 30, data = auto_calls,
    geom = "polygon"
  ) +
  scale_fill_gradient(low = "yellow", high = "red") +
  labs(title = "Heatmap of Grand Theft Auto Calls in San Francisco",
       x = "Longitude", y = "Latitude")

# Plot a heatmap for incidents data
ggmap(sf_map) +
  stat_density_2d(
    aes(x = X, y = Y, fill = ..level..), alpha = 0.5,
    size = 0.01, bins = 30, data = auto_incidents,
    geom = "polygon"
  ) +
  scale_fill_gradient(low = "yellow", high = "red") +
  labs(title = "Heatmap of Grand Theft Auto Incidents in San Francisco",
       x = "Longitude", y = "Latitude")

# Plot density plots for comparison (calls)
ggmap(sf_map) +
  geom_point(data = auto_calls, aes(x = X, y = Y), alpha = 0.3, color = "blue") +
  labs(title = "Density Plot of Grand Theft Auto Calls in San Francisco",
       x = "Longitude", y = "Latitude")

# Plot density plots for comparison (incidents)
ggmap(sf_map) +
  geom_point(data = auto_incidents, aes(x = X, y = Y), alpha = 0.3, color = "red") +
  labs(title = "Density Plot of Grand Theft Auto Incidents in San Francisco",
       x = "Longitude", y = "Latitude")
