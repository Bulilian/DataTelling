#### Preamble ####
# Purpose: Clean the survey data downloaded from https://www.abs.gov.au/statistics/people/people-and-communities/general-social-survey-summary-results-australia/latest-release#data-download
# Author: Bu Xu
# Data: 20 March 2022
# Contact: bu.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
# Read in the raw data. 
overall_lifesatisfac <- readr::read_csv("inputs/data/Graph 1_ Overall life satisfaction by Age, 2014 - 2020.csv", show_col_types = FALSE)
rush_feeling <- readr::read_csv("inputs/data/Graph 2_ Always or often feels rushed for time, by Age and Sex.csv", show_col_types = FALSE)
facecontact_state <- readr::read_csv("inputs/data/Graph 3_ Face to face contact with family or friends living outside their household by State-Territory, 2019 and 2020.csv", show_col_types = FALSE)
facecontact_age <- readr::read_csv("inputs/data/Graph 4_ Face to face contact with family or friends living outside their household by Age, 2019 and 2020.csv", show_col_types = FALSE)
parti_unpaid_volun <- readr::read_csv("inputs/data/Graph 5_ Participation in unpaid voluntary work through an organisation, by Age.csv", show_col_types = FALSE)


# Clean data
overall_lifesatisfac <- overall_lifesatisfac %>% 
  select(-c(,2)) %>% 
  pivot_longer(-`Age group (years)`, names_to = "Year", values_to = "Life satisfaction")

rush_feeling <- rush_feeling %>% 
  pivot_longer(-`Age group (years)`, names_to = "Gender", values_to = "Percentage of feeling rushed")

facecontact_age <- facecontact_age %>% 
  pivot_longer(-`Age group (years)`, names_to = "Year", values_to = "Face to face contact")
         

# Write csv
write_csv(overall_lifesatisfac, file = "overall_lifesatisfac.csv")
write_csv(rush_feeling, file = "rush_feeling.csv")
write_csv(facecontact_age, file = "facecontact_age.csv")
write_csv(parti_unpaid_volun, file = "parti_unpaid_volun.csv")