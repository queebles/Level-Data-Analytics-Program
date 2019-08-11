# Favorite R packages
# Danielle Lynch
# May 5, 2019

# Miscellaneous
install.packages("beepr") # Plays a sound at the end of script in RStudio.
install.packages("pacman") # Installs multiple R packages at once.
install.packages("devtools") # Tools to make an R developer's life easier.
install.packages("tidyverse") # Makes it easy to install and load multiple 'tidyverse' packages in a single step.
install.packages("purrr") # Extends R's functional programming capabilities.

# To import data
install.packages("readxl") # Makes it easy to get data out of Excel and into R
install.packages("readr") # A fast and friendly way to read tabular data into R.
install.packages("xlsx") # My personal go-to for working with Excel files.
install.packages("openxlsx") # The same as xlsx but without the dependency on Java.

# Missing data handling/imputation
install.packages("missForest") # Nonparametric missing value imputation using Random Forest.
install.packages("VIM") # Visualization and Imputation of Missing Values.
install_github("njtierney/naniar") # Data structures, summaries, and visualisations for missing data. 
install.packages("missMDA") # Handling missing values with Multivariate Data Analysis.
install.packages("Amelia") # Multiple imputation of incomplete multivariate data.
install.packages("mice") # Multivariate Imputation by Chained Equations.

# To manipulate data
install.packages('dplyr') # Fast data frames manipulation and database query.
install.packages("plyr") # Tools for Splitting, Applying and Combining Data
install.packages("janitor") # Simple functions for examining and cleaning dirty data.
install.packages("lubridate") # A set of functions to work with dates and times.
install.packages("reshape2") # Flexible rearrange, reshape and aggregate data.
install.packages("splitstackshape") # Functions to split concatenated data, stack columns, and convert data into different shapes.
install.packages("tidyr") # Easily tidy data with spread and gather functions.
install.packages("stringi") # ICU based string processing package.
install.packages("stringr") # Consistent API for string processing, built on top of stringi.
install.packages("dataCompareR") # Compare two data frames and summarise the difference.
install.packages("broom") # Convert statistical analysis objects into tidy data frames.
install.packages("fuzzyjoin") # Join tables together on inexact matching.

# To visualize data
install.packages("ggplot2") # An implementation of the Grammar of Graphics.
install.packages("ggvis") # Interactive grammar of graphics for R.
install.packages("ggthemes") # Extra themes for ggplot.
install.packages("ggmap") # Plotting maps in R with ggplot.
install.packages("ggfortify") # A unified interface to ggplot popular statistical packages using one line of code.
install.packages("ggrepel") # Repel overlapping text labels away from each other.
install.packages("geofacet") # visualize data for different geographical regions in ggplot.
install.packages("lattice") # A powerful and elegant high-level data visualization system.
install.packages("esquisse") # A Shiny gadget to create ggplot charts interactively with drag-and-drop to map your variables.
install.packages("rgeocodio") # An R interface to forward & reverse geocoding
install.packages("shiny") # Easy interactive web applications with R.
install.packages("manipulate") # Add a set of controls (e.g. slider, picker, checkbox, or button) to plots.
install.packages("corrplot") # Visualizing correlation matrices and confidence intervals.
install.packages("shiny") # Easy interactive web applications with R.
install.packages("shinydashboard") # Shiny Dashboarding framework.
install.packages("esquisse") # A Shiny gadget to create ggplot charts interactively with drag-and-drop to map your variables.
install.packages("shinythemes") # Bootstrap themes for use with Shiny.
install.packages("ggedit") # A Shiny gadget for exploring ggplot objects.

# Color palettes
install.packages("viridis") # Colour maps that are perceptually uniform in both colour and black-and-white.
install.packages("RColorBrewer") # Provides pre-made color palettes.
install.packages("colourpicker") # Provides a colour picker for R that can be used in Shiny.

# Data analysis
install.packages("visdat") # Makes it easy to visualise your whole dataset so that you can visually identify problems.
install.packages("FactoMineR") # Exploratory data analysis (EDA) methods to summarize, visualize and describe datasets.
install.packages("DataExplorer") # Completes the typical basic EDA with just one function: create_report()
install.packages("Hmisc") # Many functions useful for data analysis, high-level graphics, utility operations, etc.
install.packages("sqldf") # Lets you perform SQL queries on your R data frames. 
install.packages("prophet") # Tool for producing high quality forecasts for time series data that has multiple seasonality with linear or non-linear growth.
install.packages("psych") # Uses my favorite function to derive descriptive statistics for a data set: describe()
install.packages("DataExplorer") # Completes the typical basic EDA with just one function: create_report()
install.packages("moments") # Functions to calculate: moments, skewness, kurtosis and related tests.
install.packages("anomalize") # Tidy Anomaly Detection using Twitter's AnomalyDetection method.
install.packages("mvtnorm") # Computes the multivariate normal and t distributions.  
install.packages("pastecs") # Provides a wide range of functions for obtaining summary statistics. 
install.packages("skimr") # A simple to use summary function that can be used with pipes. 
install.packages("summarytools") # Provides tools to neatly and quickly summarize data

# For Time Series and Financial data
install.packages("prophet") # Tool for producing high quality forecasts for time series data that has multiple seasonality with linear or non-linear growth.
install.packages("zoo") # S3 Infrastructure for Regular and Irregular Time Series.
install.packages("xts") # eXtensible Time Series.
install.packages("quantmod") # Quantitative Financial Modelling & Trading Framework for R.
install.packages("tseries") # Time series analysis and computational finance.
install.packages("forecast") # Timeseries forecasting using ARIMA, ETS, STLM, TBATS, and neural network models.
install.packages("PerformanceAnalytics") # Econometric tools for performance and risk analysis.

# Modeling and Machine learning
install.packages("mgcv") # Generalized additive modelling, including generalized additive mixed models.
install.packages("car") # Contains functions that perform convenient hypothesis tests for parameters in multivariate linear models.
install.packages("glmnet") # Extremely efficient procedures for fitting the entire lasso or elastic-net regularization path for linear regression, logistic and multinomial regression models, Poisson regression and the Cox model. 
install.packages("caret") # Contains functions to streamline the model training process for complex regression and classification problems.
install.packages("multcomp") # Allows for multiple comparisons of k groups in general linear models..
install.packages("LogicReg") # Routines for fitting logic regression models.
install.packages("mlr") # Extensible framework for classification, regression, survival analysis and clustering
install.packages("xgboost") # eXtreme Gradient Boosting Tree model, well known for its speed and performance.
install.packages("gbm") # Generalized boosted regression models.
install.packages("prophet") # Tool for producing high quality forecasts for time series data that has multiple seasonality with linear or non-linear growth.
install.packages("randomForest") # randomForest: Breiman and Cutler's random forests for classification and regression.
install.packages("glmnet") # Lasso and elastic-net regularized generalized linear models.
install.packages("rattle") # Graphical user interface for data mining in R.

# To work with the web
install.packages("httr") # User-friendly RCurl wrapper.
install.packages("curl") # A Modern and Flexible Web Client for R.
install.packages("rvest") # Simple web scraping for R, using CSSSelect or XPath syntax.
install.packages("RCurl") # General network (HTTP/FTP/.) client interface for R.
install.packages("XML") # Tools for parsing and generating XML within R.
install.packages("jsonlite") # A robust and quick way to parse JSON files in R.

# To write your own R packages
install.packages("testthat") # An R package to make testing fun.
install.packages("usethis") # A workflow package to automate repetitive tasks that arise during project setup and development.
install.packages("pryr") # Make it easier to understand what's going on in R.
install.packages("roxygen2") # Describe your functions in comments next to their definitions.

# Publishing your code
install.packages("lintr") # Static code analysis for R.
install.packages("reprex") # Render bits of R code for sharing, e.g., on GitHub or StackOverflow.
install.packages("bookdown") # Authoring books with R markdown.