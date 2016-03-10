### An idea was suggested at Unconferenz 2016 to develop a visualization prototype to show how the approved budget 
### of the State of Hawaii gets used by matching budget and expenditure data sets

### A team from Code for Hawaii identified budget related data from data.hawaii.gov and 
### two separate and independent data sets (approved budget and expendure) were downloaded.

### The data appeared to be organized and itemized in different formats across datasets, but both included
### department names (under different column names)
### The expenditure data appear to have more detailed breakdowns of expenditures 
### compared to the approved budget data.  In addition, the years of available data varied.

### For this prototype, we plan to develop a sankey diagram to show the flow of approved budget into each expenditure
### category by department.  A data visualization can be done in various ways, however, to 
### simplify the project for prototype purposes, and to show what can be achieved, we decided to summarize data 
### at department level only

### This R script is used to
### 1. subset data for FY2015
### 2. clean out white spaces for department names
### 3. merge budget and expenditure datasets into one dataset called MergedData

### Data source:
# Expenditure data : https://data.hawaii.gov/dataset/Expenditures/mkz8-mgjp
# Approved budget data: https://data.hawaii.gov/dataset/Hawaii-Operating-Budget/p8xe-w4xh

library(reshape)
library(plyr)
library(stringr)

## importing csc data files
exp <- read.csv("data/HawaiiBudgetExpenditures/data/Expenditures.csv")
op <- read.csv("data/projs/HawaiiBudgetExpenditures/data/budget.csv")

## trimming white spaces
exp$Department <- str_trim(exp$Department, side=c("both"))
op$Department <- str_trim(op$Department, side=c("both"))

## subset data for 2015 and sum the total expenditure amount by department and category (Expenditure data)
dep_cat_exp15 <- ddply(exp[exp$Fiscal_Year==2015, ], .(Department, Expense_Category), summarize, Expediture_DepCat15 = sum(Amount))

## subset data for 2015 and sum the total approved budget amount by department (Budget)
dep_cat_op15 <- ddply(op[op$Fiscal.Year==2015,], .(Department), summarize, Budget_Dep15 = sum(approvedAmount))

## Merging data by Department
mergedData <- join(dep_cat_exp15, dep_op_15, by=c('Department') , type="left")

## write to csv file
write.csv(mergedData, "data/StateSpending15_final.csv") 
