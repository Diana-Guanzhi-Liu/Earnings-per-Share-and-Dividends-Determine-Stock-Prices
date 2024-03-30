#### Preamble ####
# Purpose: Cleans the raw data
# Author: Diana Liu
# Date: 18 March 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-requisites: download the data


#### Workspace setup ####
library(tidyverse)
library(dplyr)
#install.packages("arrow")
library(arrow)

#### Clean data ####
#Read in data and save as a data frame
raw_data <- read_parquet("inputs/data/raw_data.parquet")
raw_data <- as.data.frame(raw_data)
largest_companies <- c("MSFT", "AAPL", "NVIDIA", "GOOGL", "AMZN", "META",
                       "BRK.B", "LLY", "AVGO", "V", "TSLA", "JPM", "WMT",
                       "UNH", "XOM", "MA", "PG", "HD", "JNJ", "ORCL", "COST",
                       "MRK", "ABBV", "CRM", "BAC", "CVX", "AMD", "NFLX", "KO",
                       "PEP", "ADBE", "DIS", "TMO", "MCD", "WFC", "CSCO", "ABT",
                       "TMUS", "GE", "QCOM", "DHR", "INTU", "CAT", "INTC",
                       "IBM", "VZ", "AMAT", "CMCSA", "UBER", "AXP")

#Rename variables so they are easier to understand, select the ones needed
cleaned_data <-
  raw_data |>
  rename("Year" = fyear, "Tic" = tic, "Dividends" = dvc, "EPS" = epsfi, 
         "Net_Income" = ni, "Price" = prcc_f)

cleaned_data <-
  cleaned_data |>
  select(Year, Tic, EPS, Dividends, Net_Income, Price)

cleaned_data <-
  cleaned_data |> filter(Dividends >= 0)
cleaned_data <-
  cleaned_data |> filter(Tic %in% largest_companies)

#Create binary variable for dividends
cleaned_data$Paid_Dividend <- case_when(
  cleaned_data$Dividends > 0 ~ "Yes", 
  cleaned_data$Dividends == 0 ~ "No")

#round to two decimal places
cleaned_data$Dividends = round(cleaned_data$Dividends, 2)
cleaned_data$EPS = round(cleaned_data$EPS, 2)
cleaned_data$Net_Income = round(cleaned_data$Net_Income, 2)
cleaned_data$Price = round(cleaned_data$Price, 2)

#omit missing values
cleaned_data <- na.omit(cleaned_data)
head(cleaned_data)

#### Save data ####
write_parquet(cleaned_data, "outputs/data/analysis_data.parquet")
write_csv(cleaned_data, "outputs/data/analysis_data.csv")

