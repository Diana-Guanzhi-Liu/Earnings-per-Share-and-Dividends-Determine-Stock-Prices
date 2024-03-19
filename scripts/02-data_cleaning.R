#### Preamble ####
# Purpose: Cleans the raw data
# Author: Diana Liu
# Date: 18 March 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-requisites: download the data

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
#Read in data and save as a data frame
raw_data <- read_csv("inputs/data/raw_data.csv")
raw_data <- as.data.frame(raw_data)

#Rename variables so they are easier to understand, select the ones needed, and
#round to two decimal places
cleaned_data <-
  raw_data |>
  rename("Year" = fyear, "Tic" = tic, "Dividends" = dvc, "EPS" = epsfi, 
         "Net_Income" = ni, "Price" = prcc_f)
cleaned_data <-
  cleaned_data |>
  select(Year, Tic, Dividends, EPS, Net_Income, Price)
cleaned_data$Dividends = round(cleaned_data$Dividends, 2)
cleaned_data$EPS = round(cleaned_data$EPS, 2)
cleaned_data$Net_Income = round(cleaned_data$Net_Income, 2)
cleaned_data$Price = round(cleaned_data$Price, 2)

#omit missing values
cleaned_data <- na.omit(cleaned_data)
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
