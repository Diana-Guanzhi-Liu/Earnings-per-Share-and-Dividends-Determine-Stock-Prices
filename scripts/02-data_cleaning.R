#### Preamble ####
# Purpose: Cleans the raw data
# Author: Diana Liu
# Date: 9 March 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-requisites: download the data

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")



#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
