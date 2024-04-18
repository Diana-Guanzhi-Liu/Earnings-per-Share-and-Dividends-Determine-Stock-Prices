# What Determines Stock Prices
## Overview
This repo contains all data, scripts, and code for the paper "What Determines Stock Prices? Analysis of the Relationship Between Stock Price, Earnings Per Share, and Dividends of the Largest 50 North American Companies from 2013 to 2023". To replicate this paper, first run the scripts in order which simulates, downloads, cleans, tests the data, and creates the models. Then use the file paper.qmd found in the outputs folder to recreate the paper.
## Abstract
This study examines the relationship between Earnings per Share (EPS), dividends, and stock prices in publicly traded companies. Findings indicate a positive correlation between EPS and stock price, with each dollar increase in EPS associated with a $26.59 rise in stock price. Conversely, dividend payments are linked to a decrease in stock price, mitigating the impact of EPS on price. These insights enable investors to predict stock prices, informing their investment strategies, as well as guide managerial decisions balancing pleasing existing shareholders by paying dividends, ensuring long-term growth of the company, and keeping the stock attractive to new investors.
## LLM Usage
LLM (Chat GPT) was used in the writing of this paper, documentation can be found in inputs/llm/usage.txt
## File Structure
This repo is structured as:
* input/data contains the data sources used in analysis including the raw data
* outputs/data contains the cleaned dataset that was constructed.
* outputs/paper contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
* scripts contains the R scripts used to simulate, download and clean data
