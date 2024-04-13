#### Preamble ####
# Purpose: Models stock price data with a linear model
# Author: Diana Liu
# Date: 11 April 12 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-requisites: downloaded, cleaned, and tested data


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet(here::here("outputs/data/analysis_data.parquet"))

### Model data ####
model_1 <-
  lm(
    Price ~ EPS,
    data = analysis_data
  )

model_2 <-
  stan_glm(
    formula = Price ~ EPS + Paid_Dividend,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(0, 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 12345
  )

#### Save model ####
saveRDS(
  model_1,
  file = "~/Stock-Prices/outputs/models/model_1.rds"
)

saveRDS(
  model_2,
  file = "~/Stock-Prices/outputs/models/model_2.rds"
)



