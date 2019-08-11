# Exploratory data analysis process in R. 
# Code developed by Danielle Lynch

library(funModeling)
library(tidyverse)
library(Hmisc)
library(DataExplorer)
library(psych)

# understand data properties ~~~~~~~~~~~~
# basic structure and metrics
class(data)
names(data)
plot_str(data)
introduce(data)
glimpse(data) # or str(data) # tells you the structure of the obj.
summary(data)
describe(data)
profiling_num(data)

# univariate analysis ~~~~~~~~~~~~~~~~
# analyze numerical variables - distibution
plot_histogram(data)
plot_density(data)
plot_bar(data)
plot_qq(data)

# analyze data quality ~~~~~~~~~~~~~
# identify missing values
df_status(data)
plot_intro(data)
plot_missing(data)

# analyze categorical variables - frequency
plot_boxplot(data, by = "variable")
plot_scatterplot(data, by = "variable")
freq(data) 

# multivariate analysis ~~~~~~~~~~~~~~~
# correlation analysis
plot_correlation(na.omit(data))

