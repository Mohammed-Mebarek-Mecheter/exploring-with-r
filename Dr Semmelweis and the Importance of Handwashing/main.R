# Imported libraries
library(tidyverse)

# Load data
yearly <- read_csv("data/yearly_deaths_by_clinic.csv")
monthly <- read_csv("data/monthly_deaths.csv")

# Check the structure and content of the data frames
# Check data types
str(yearly)
str(monthly)
# Check for missing values
summary(yearly)
summary(monthly)
# Print the first 5 rows of each data frame
head(yearly)
head(monthly)

# Add a proportion_deaths column to each df
yearly <- yearly %>%
  mutate(proportion_deaths = deaths / births)

monthly <- monthly %>%
  mutate(proportion_deaths = deaths / births)

# Create two ggplot line plots
# Yearly plot
yearly_plot <- ggplot(yearly, aes(x = year, y = proportion_deaths, color = factor(clinic))) +
              geom_line() +
              labs(title = "Yearly Proportion of Deaths by Clinic",
                   x = "Year",
                   y = "Proportion of Deaths")

# Monthly plot
monthly_plot <- ggplot(monthly, aes(x = date, y = proportion_deaths)) +
               geom_line() +
               labs(title = "Monthly Proportion of Deaths",
                    x = "Date",
                    y = "Proportion of Deaths") +
			    theme_bw()

# Plot
yearly_plot
monthly_plot

# Plot the new df with different colored lines depending on handwashing_started
# Add handwashing column
monthly$handwashing_started <- as.Date(monthly$date) >= as.Date('1847-06-01')

# Updated monthly plot
monthly_plot_updated <- ggplot(monthly, aes(x = date, y = proportion_deaths,
                                    color = handwashing_started)) +
               geom_line() +
               labs(title = "Monthly Proportion of Deaths",
                    x = "Date",
                    y = "Proportion of Deaths") +
               scale_color_manual(values = c("TRUE"="blue", "FALSE"="red")) +
			   theme_bw()

monthly_plot_updated

# Calculate the mean proportion of deaths before and after handwashing from the monthly data

# Calculate mean proportion deaths before handwashing
before <- mean(monthly$proportion_deaths[!monthly$handwashing_started])

# Calculate mean proportion deaths after handwashing
after <- mean(monthly$proportion_deaths[monthly$handwashing_started])

# Create dataframe
monthly_summary <- data.frame(
  handwashing_started = c("Before", "After"),
  mean_proportion_deaths = c(before, after)
)

# View summary dataframe
monthly_summary

# the first 12 rows and 5 columns of the yearly_data DataFrame
print(head(select(yearly, 1:5), 12))
