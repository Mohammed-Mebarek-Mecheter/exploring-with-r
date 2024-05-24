# Load the necessary library
library(dplyr)

# Read the CSV file into a data frame
incidents_data <- read.csv("data/police-department-incidents.csv")

# Drop the specified columns
incidents_data <- incidents_data %>%
  select(
    -SF.Find.Neighborhoods.2.2,
    -Current.Police.Districts.2.2,
    -Current.Supervisor.Districts.2.2,
    -Analysis.Neighborhoods.2.2,
    -DELETE...Fire.Prevention.Districts.2.2,
    -DELETE...Police.Districts.2.2,
    -DELETE...Supervisor.Districts.2.2,
    -DELETE...Zip.Codes.2.2,
    -DELETE...Neighborhoods.2.2,
    -DELETE...2017.Fix.It.Zones.2.2,
    -Civic.Center.Harm.Reduction.Project.Boundary.2.2,
    -Fix.It.Zones.as.of.2017.11.06..2.2,
    -DELETE...HSOC.Zones.2.2,
    -Fix.It.Zones.as.of.2018.02.07.2.2,
    -CBD..BID.and.GBD.Boundaries.as.of.2017.2.2,
    -Areas.of.Vulnerability..2016.2.2,
    -Central.Market.Tenderloin.Boundary.2.2,
    -Central.Market.Tenderloin.Boundary.Polygon...Updated.2.2,
    -HSOC.Zones.as.of.2018.06.05.2.2,
    -OWED.Public.Spaces.2.2,
    -Neighborhoods.2
  )

# Save the cleaned data frame as a CSV file, overwriting the original file
write.csv(incidents_data, "data/police-department-incidents.csv", row.names = FALSE)
