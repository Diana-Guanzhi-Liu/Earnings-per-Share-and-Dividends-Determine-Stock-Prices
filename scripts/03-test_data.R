#### Preamble ####
# Purpose: Tests financial statement data
# Author: Diana Liu
# Date: 19 March 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-requisites: downloaded and cleaned data


#### Workspace setup ####
library(tidyverse)


#### Test data ####
analysis_data <- read_parquet("outputs/data/analysis_data.parquet")

# 1. Tests if the ticker symbol is a character
if (all(analysis_data$Tic |>
        unique() %>% class() == "character")) {
  "Pass: The cleaned Tic symbols are the correct class"
} else {
  "Fail: Not all of the Tic symbols have been cleaned completely"
}

# 2. Tests if the ticker symbol has 6 or less characters
if (all(analysis_data$Tic |>
        nchar() <= 6)) {
  "Pass: The cleaned Tic symbols are the correct length"
} else {
  "Fail: Not all of the Tic symbols have been cleaned completely"
}

# 3. Tests if the Year is positive
if (all(analysis_data$Year |>
        min() > 0)) {
  "Pass: The cleaned Years are positive"
} else {
  "Fail: Years have not been cleaned completely"
}

# 4. Tests if the Year is greater than or equal to 2013
if (all(analysis_data$Year |>
        min() >= 2013)) {
  "Pass: The cleaned Years are greater than or equal to 2013"
} else {
  "Fail: Years have not been cleaned completely"
}

# 5. Tests if the Year is less than or equal to 2023
if (all(analysis_data$Year |>
        max() <= 2023)) {
  "Pass: The cleaned Years are less than or equal to 2023"
} else {
  "Fail: Years have not been cleaned completely"
}

# 6. Tests if Dividends are numbers
if (all(analysis_data$Dividends |>
        unique() %>% class() == "numeric")) {
  "Pass: The cleaned Dividends are the correct class"
} else {
  "Fail: Not all of the Dividends have been cleaned completely"
}

# 7. Tests if the Dividends are positive or zero
if (all(analysis_data$Dividends |>
        min() >= 0)) {
  "Pass: The cleaned Dividends are positive"
} else {
  "Fail: Dividends have not been cleaned completely"
}

# 8. Tests if Price are numbers
if (all(analysis_data$Price |>
        unique() %>% class() == "numeric")) {
  "Pass: The cleaned Price are the correct class"
} else {
  "Fail: Not all of the Price have been cleaned completely"
}

# 9. Tests if Net Income are numbers
if (all(analysis_data$Net_Income |>
        unique() %>% class() == "numeric")) {
  "Pass: The cleaned Net Income are the correct class"
} else {
  "Fail: Not all of the Net Income have been cleaned completely"
}

# 10. Tests if EPS are numbers
if (all(analysis_data$EPS |>
        unique() %>% class() == "numeric")) {
  "Pass: The cleaned EPS are the correct class"
} else {
  "Fail: Not all of the EPS have been cleaned completely"
}

