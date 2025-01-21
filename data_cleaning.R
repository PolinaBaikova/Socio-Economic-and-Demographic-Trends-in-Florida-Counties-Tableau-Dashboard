install.packages("tidyverse")
library(tidyverse)
library(stringr)

# Clean and restructure the population data
population <- readxl::read_excel("population.xlsx")
population <- population |>
  slice(-c(1:4, 72:77)) |>
  select(-2) |>
  setNames(c("CountyName", "2020", "2021", "2022", "2023")) |>
  mutate(
    CountyName = gsub("^\\.|, Florida| County", "", CountyName), 
    State = "Florida", 
    across(`2020`:`2023`, as.numeric)   
  ) |>
  pivot_longer(
    cols = `2020`:`2023`,    
    names_to = "Year",         
    values_to = "Population"   
  ) |>
  mutate(Year = as.character(Year)) |>
  select(CountyName, State, Year, Population)  

# Load the crime data for 2020, 2021, and 2022
crime2020 <- readxl::read_excel("crime2020.xlsx")
crime2021 <- readxl::read_excel("crime2021.xlsx")
crime2022 <- readxl::read_excel("crime2022.xlsx")

# Store the datasets in a list
crime_data_list <- list(crime2020, crime2021, crime2022)

# Function to process and clean crime data
process_crime_data <- function(data) {
  data <- select(data, -c(3, 5))  # Remove columns 3 and 5
  data <- slice(data, -c(1, 2))   # Remove the first row
  colnames(data) <- c("CountyName", "CrimeCount", "CrimeRate")  # Set new column names
  return(data)
}

# Apply the function to each dataset in the list
crime_data <- lapply(crime_data_list, process_crime_data)

# Extract the cleaned crime datasets from the list
crime2020 <- crime_data[[1]]
crime2021 <- crime_data[[2]]
crime2022 <- crime_data[[3]]

# Add the Year column to each crime dataset and reorder columns
crime2020 <- crime2020 |>
  mutate(Year = as.character("2020")) |>
  select(CountyName, CrimeCount, CrimeRate, Year)

crime2021 <- crime2021 |>
  mutate(Year = as.character("2021")) |>
  select(CountyName, CrimeCount, CrimeRate, Year)

crime2022 <- crime2022 |>
  mutate(Year = as.character("2022")) |>
  select(CountyName, CrimeCount, CrimeRate, Year)


# Combine the crime datasets into one dataset
crime_data <- bind_rows(crime2020, crime2021, crime2022)

# Join the population data with the combined crime data by CountyName and Year
population <- left_join(population, crime_data, by = c("CountyName", "Year"))

# Load the political party affiliation data for 2020 to 2023
pol_party2020 <- readxl::read_excel("affiliation_2020.xlsx")
pol_party2021 <- readxl::read_excel("affiliation_2021.xlsx")
pol_party2022 <- readxl::read_excel("affiliation_2022.xlsx")
pol_party2023 <- readxl::read_excel("affiliation_2023.xlsx")

# Add the Year column to each political party dataset
pol_party2020 <- pol_party2020 |>
  mutate(Year = as.character("2020"))
pol_party2021 <- pol_party2021 |>
  mutate(Year = as.character("2021"))
pol_party2022 <- pol_party2022 |>
  mutate(Year = as.character("2022"))
pol_party2023 <- pol_party2023 |>
  mutate(Year = as.character("2023"))

pol_party_data <- bind_rows(pol_party2020, pol_party2021, pol_party2022, pol_party2023)
pol_party_data <- pol_party_data |>
  mutate(County = str_to_title(tolower(County)))

# Join the population data with the political party data on CountyName and Year
population <- left_join(population, pol_party_data, by = c("CountyName"="County", "Year"))

write.csv(population, "C:/Users/polin/Documents/Polina/aFirstSemester/DataVisualization/project/final_data/population_data.csv", row.names = FALSE)

# Clean and restructure the restaurants data 
restaurants <- read_csv("C:/Users/polin/Documents/Polina/food.csv")
restaurants <- restaurants |> 
  relocate(countyStateName)


restaurants <- restaurants %>%
  mutate(countyStateName = str_replace_all(countyStateName, "[\"\\(\\),]", ""))

# Split countyStateName into county and state
restaurants <- restaurants %>%
  mutate(countyStateName = str_trim(countyStateName)) %>%
  separate(countyStateName, into = c("county", "state"), sep = " ", extra = "merge", fill = "right")

restaurants <- restaurants |>
  filter(state == "FL")

restaurants <- restaurants |>
  relocate(totalRestaurants)

rests_final <- restaurants |>
   pivot_longer(
     cols = -c(totalRestaurants, mostDominantFood, oneZip, lat, lng, county, state),  # Exclude columns that should not be pivoted
     names_to = "Restaurant_Type",
     values_to = "Count",
     mutate(Restaurant_Type = str_replace_all(Restaurant_Type, "Comma", ", ")) )
write.csv(rests_final, "C:/Users/polin/Documents/Polina/restaurants_final.csv", row.names = FALSE)


home <- read_csv("prices_housing.csv")
home_long <- home %>%
  pivot_longer(cols = starts_with("1/") | starts_with("2/") | starts_with("3/") | starts_with("4/") |
                 starts_with("5/") | starts_with("6/") | starts_with("7/") | starts_with("8/") |
                 starts_with("9/") | starts_with("10/") | starts_with("11/") | starts_with("12/"), 
               names_to = "Date", 
               values_to = "Value")
home_long <- home_long %>%
  mutate(Year = sub(".*/", "", Date))  # Extract everything after the last "/"
home_long <- home_long %>%
  mutate(RegionName = str_replace(RegionName, " County", ""))
write.csv(home_long, "C:/Users/polin/Documents/Polina/housing_final.csv", row.names = FALSE)

#Clean and restructure the schools data 
schools <- read_csv("C:/Users/polin/Documents/Polina/schools_fl.csv")
schools <- schools |>
  mutate(COUNTY = str_to_title(tolower(COUNTY))) 
sc <- schools %>% distinct(COUNTY)
write.csv(schools, "C:/Users/polin/Documents/Polina/schools_final.csv", row.names = FALSE)
