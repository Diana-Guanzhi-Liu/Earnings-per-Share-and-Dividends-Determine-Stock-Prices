#### Preamble ####
# Purpose: Downloads and saves the data from WRDS Database
# Author: Diana Liu
# Date: 2023 March 8
# Contact: guanzhi.liu@mail.utoronto.ca


#### Workspace setup ####
#install.packages("parquetize")
library(parquetize)

#### Download Financial Statement Data ####
# Log in to Warton Research Data Services
# Select Compustat - Capital IQ, North America, Fundamentals Annual
# Query for 2014 January to 2024 January, Ticker Symbol (tic), entire database
# Select price close, net income, dividends, earnings per share, company name
# Submit query
# Download resulting csv package

csv_to_parquet(
  path_to_file = "inputs/data/raw_data.csv",
  path_to_parquet = "inputs/data/raw_data.parquet")
