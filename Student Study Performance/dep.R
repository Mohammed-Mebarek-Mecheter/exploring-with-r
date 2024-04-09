# Load libraries
library(tidyverse)
library(ggplot2)

# Load the dataset
data <- read.csv("data/study_performance.csv")

# Check the structure of the loaded data
str(data)

# Display the first few rows of the dataset
head(data)

# Summarize the dataset
summary(data)

# Check for missing values
any(is.na(data))

# Check for duplicates
any(duplicated(data))

# Function to detect and remove outliers
detect_and_remove_outliers <- function(data) {
  for (col in c("math_score", "reading_score", "writing_score")) {
    # Calculate the lower and upper bounds for outliers
    q1 <- quantile(data[[col]], 0.25)
    q3 <- quantile(data[[col]], 0.75)
    iqr <- q3 - q1
    lower_bound <- q1 - 1.5 * iqr
    upper_bound <- q3 + 1.5 * iqr

    # Remove outliers
    data <- data[data[[col]] >= lower_bound & data[[col]] <= upper_bound, ]
  }
  return(data)
}

# Apply the function to remove outliers
data_clean <- detect_and_remove_outliers(data)

# Save the cleaned dataset to a new file
write.csv(data_clean, "study_performance_cleaned.csv", row.names = FALSE)