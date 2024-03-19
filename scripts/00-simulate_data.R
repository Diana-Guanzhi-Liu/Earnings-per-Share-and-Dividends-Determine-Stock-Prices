#### Preamble ####
# Purpose: Simulates financial statement data of North American Companies
# Author: Diana Liu
# Date: March 7 2024
# Contact: guanzhi.liu@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(knitr)

#### Simulate data ####
tic1 <- sample(letters, 100, TRUE)
tic2 <- sample(letters, 100, TRUE)
tic3 <- sample(letters, 100, TRUE)
tic <- paste(tic1, tic2, tic3)

financial_data <-
  tibble(
    tic,
    net_income = round(abs(rnorm(100, mean = 10000, sd = 5000)), 2),
    dividends = round(abs(rnorm(100, mean = 5, sd = 100)), 2),
    eps = round(abs(rnorm(100, mean = 5, sd = 2)), 2),
    price = round(abs(rnorm(100, mean = 75, sd = 100)), 2)
  )

financial_data



