# Explanations for common commands in R. 
# Code developed by Danielle Lynch

# Basic                         
ls()                                   # Lists memory contents (environment).
rm()                                   # Removes an item from memory (environment).
citation(package)                      # Gives information on how to cite a package.

# Vectors
x[x < 0]                               # All elements less than zero.
x[x == 10]                             # Elements which are equal to 10.
x[4]                                   # The fourth element.
x[-4]                                  # All but the fourth.
x[2:4]                                 # Elements two to four.
x[-(2:4)]                              # All elements except two to four.
x[c(1, 5)]                             # Elements one and five.

# Analyzing data properties
class()                                # Describes the Vector data type.
dim()                                  # Returns the dimensions (rows and columns) of a matrix or data frame.
dimnames()                             # Returns a length 2 list with all the row names and all the column names.
janitor::tabyl()                       # Returns a dataframe with percentages (or valid percentages if NAs are present). Calling 'tabyl' on two columns of a data.frame produces the same result as the common combination of dplyr::count(), followed by tidyr::spread() to wide form.
length()                               # Returns vector length (rows).
length(unique())                       # Returns vector length, excluding duplicates.
levels()                               # Returns the factor levels.
names()                                # Returns the names of variables in a data frame.
nlevels()                              # Counts the number of levels in a vector.
plyr::count()                          # Counts the number of occurences and returns a data frame. Equivalent to as.data.frame(table(x)), but does not include combinations with zero counts.
plyr::nunique()                        # Returns the number of unique values.
summary()                              # If argument is numeric, returns descriptive statistics; if argument is a factor or logical, returns count of each category or logical element; if argument is character, returns length.

# Analyzing data quality
complete.cases(df)                     # Checks each row of df to see if there are any NAs in that row.
is.finite(x)                           # Checks if x is finite (not Inf, -Inf, NA, or NaN).
is.na()                                # TRUE or FALSE depending on whether x is NA.
janitor::get_dupes()                   # Hunts down and examine duplicated records. Returns the duped records and their count.

# Mathematical functions
janitor::adorn_crosstab()
janitor::adorn_totals()                # Adds a totals row and/or column to a data frame.
max()                                  # Returns the maximum value of the elements of a vector.
mean()                                 # Returns arithmetic mean.
median()                               # Returns the middle element of your data, after ordering them from small to large.
min()                                  # Returns the minimum value of the elements of a vector.
prod()                                 # Multiplies all the values in a vector.
quantile()                             # Returns the sample quantiles.
quantile(x, probs)                     # Splits x into even groups defined by probs.  For example, to get quartiles of x, use `quantile(x, seq(0.25, 1, length.out = 4))`.
range(x)                               # Returns the minimum and maximum values of a vector.
sum(x)                                 # Add up all values in a vector.
which.max()                            # Determines the location, i.e., index of the (first) maximum of a numeric (or logical) vector.
which.min()                            # Determines the location, i.e., index of the (first) minimum of a numeric (or logical) vector.

#Logicals
a & b                                  # It combines each element of the first vector with the corresponding element of the second vector and gives a output TRUE if both the elements are TRUE. 
a && b                                 # Evaluates left to right. Takes first element of both the vectors and gives the TRUE only if both are TRUE. Will not evaluate the second operand if the first operand is enough to determine the value of the expression.
a | b                                  # It combines each element of the first vector with the corresponding element of the second vector and gives a output TRUE if both the elements are TRUE. 
a || b                                 # Evaluates left to right. Takes first element of both the vectors and gives the TRUE if one of them is TRUE. Will not evaluate the second operand if the first operand is enough to determine the value of the expression.
all()                                  # TRUE if expr is all TRUE and FALSE otherwise.  all(c(1, 2, 3) >= 1) is TRUE but all(c(1, 2, 3) > 1) is FALSE.
any()                                  # TRUE if any value in expr is TRUE.  
duplicated()                           # For each element in x, returns FALSE if that element is not already in x and TRUE if it is.
identical(x, y)                        # Tests if x is equal to y. Preferable to x == y, because x == y returns a vector of length equal to the length of x and y and errors a lot.
ifelse(test, yes, no)                  # Runs test, executes yes if the test is TRUE and executes no otherwise.
isFALSE()                              # Does not mean the same thing as !isTRUE().
isTRUE()                               # Equivalent to '{is.logical(x) && length(x) == 1 && !is.na(x) && x}'. if(isTRUE(cond)) may be preferable to if(cond) because of NAs.
obj_A %in% obj_B                       # Is obj_A contained within obj_B? TRUE / FALSE for each element in obj_A
which()                                # Returns the indicies where expr is TRUE.  which(c(1, 2, 3) > 1) returns 2, 3 because both position 2 and position 3 are greater than 1.
xor()                                  # Exclusive OR, considers two logical vector arguments element-wise, returns logical vector, returns TRUE if one argument is TRUE and the other argument is FALSE, otherwise returns FALSE.

# Subsetting, filtering, and finding
by()                                   # Apply function to a column split by factors.
cut()                                  # Groups values of a variable into larger bins.
df[x]                                  # Returns the xth element of df (if x is a number) or the element named the value of x if x is a string.
df[[x]]                                # Returns the value of the xth element of the data frame.
df[!duplicated(df),]                   # Removes rows that are duplicated in a data.frame.
dplyr::arrange()                       # Sorts data in ascending order. Feeding two (or more) arguments to arrange will be interpreted as 'sort by first column and then by second column'.
dplyr::arrange(desc())                 # Sorts data in descending order.
dplyr::contains()                      # A helper function for 'select' to assist in globbing column names.
dplyr::endsWith()                      # A helper function for 'select' to assist in globbing column names.
dplyr::filter()                        # allows you to subset rows that meet one or more conditions.
dplyr::group_by()                      # allows you to group your data for grouped downstream operations.
dplyr::mutate()                        # allows you to compute new variables from your data. Unlike 'aggregate', will take in n elements as input and return n elements as output. In the case of mutate, this means performing an operation on every single row of a data frame and returning the resultant values in a new column.
dplyr::select()                        # allows you to subset by column. Allows for easy globbing of multiple columns at once.
dplyr::startsWith()                    # A helper function for 'select' to assist in globbing column names.
dplyr::summarise()                     # Allows you to apply summary functions on your data. Similar to the 'aggregate' functions, outputting a single value for however many values are fed as input.
dplyr::transmute()                     # A version of 'mutate' that only keeps the variables you create.
dplyr::ungroup()                       # Removes grouping information. This is useful when performing one grouped operation and then performing a second in the same dplyr chain but off of a different column grouping.
findInterval(a, b)                     # Given breaks b, find out which interval in b contains x.
grep(needle, haystack)                 # Searches object haystack for object needle and returns the position in haystack that needle is in.
grepl(needle, haystack)                # Similar to `grep`, except it returns TRUE or FALSE instead of the index.
intersect(a, b)                        # The shared values of a and b.  intersect(c(1, 2), c(2, 3)) is 2.
match(x, y)                            # Returns a vector of the same length than x with the elements of x which are in y (NA otherwise).
plyr::match()                          # Extracts matching rows of a data frame.
setdiff(a, b)                          # Returns the elements of a that are not in b. For example, setdiff(c(1, 2), c(2, 3)) is 1.
setequal(a, b)                         # Returns TRUE if all elements of a are in b and all elements of b are in a. For example, setequal(c(1, 2), c(2, 1)) is TRUE.
unique()                               # Removes duplicate entries from a vector.
table()                                # List all values of a variable with their frequencies (count).
which()                                # Returns the indicies where the expression is TRUE. For example, which(c(1, 2, 3) > 1) returns 2, 3 because both position 2 and position 3 are greater than 1.
with()                                 # Evaluates expr with the environment. For example, with(list(y = 2), y + 1) will return 3.

# Merges, joins and unions
interaction(f1, f2)                    # Merges together pairwise combinations of factors f1 and f2.
merge(df1, df2)                        # Combines df1 and df2, lining them up by shared column names.
union(a, b)                            # A joint object that contains all unique elements in both a and b. For example, union(c(1, 2), c(2, 3)) is c(1, 2, 3).

# Data transformation
append()                               # Add elements to a vector. Allows for values to be inserted into a vector after a certain position.
aggregate(x,by,FUN)                    # Splits the data into subsets, computes summary statistics for each, and returns the result as a table.
cbind()                                # Combines vector, matrix or data frame by columns.
cut(x, y)                              # Breaks x into y equal parts.
data.matrix(df)                        # Converts dataframe df to a matrix.
diag(mat)                              # Returns the diagonal of matrix mat.
janitor:: remove_empty_cols()          # When importing from Excel it's not so infrequent to import empty cols. Discard them with this easy command.
janitor:: remove_empty_rows()          # When importing from Excel it's not so infrequent to import empty rows. Discard them with this easy command.
jitter()                               # Add a small amount of noise to a numeric vector.
lapply(obj, fn)                        # pply FUN to each element of the list X.
order()                                # list sorted element numbers of x.
plyr::arrange()                        # Reorders a data frame by its columns. This saves a lot of typing!
plyr::rbind.fill()                     # Combine data.frames by row, filling in missing columns.
plyr::rename()                         # Change the (column) names of a data frame.
plyr::unrowname()                      # Remove row names.
reshape2::cast()                       # Turns a long data frame into a wide one. 
reshape2::melt()                       # Takes a wide data frame and makes it long.
rbind()                                # Combines vector, matrix or data frame by rows.
rev()                                  # sorts the elements in a vector - decreasing order.
sort()                                 # sorts the elements in a vector - increasing order.
split(x, f)                            # Splits x (vector or dataframe) into groups defined by levels(f) where f is a factor.
t(mat)                                 # Returns the transposed matrix of matrix mat.
tapply(obj, fn)                        # Breaks apart obj by factor and then applies function fn to each part.
unlist(l)                              # Converts list l into a vector.
vapply(obj, fn, fv)                    # A faster sapply, because you specify fv, which is an example of the desired output.
varhandle::unfactor()                  # turn it into either numeric or character variables

# Dates
date()                                 # Returns today's date.  Does not accept arguments.
difftime(day1, day2)                   # Tells you the amount of days between day1 and day2. 
ISOdate(year, month, day)              # Makes a date object.  Can also pass hour, minute, and second. You can set the timezone with the tz variable.
ISOdatetime(y, m, d, h, m, s)          # Like ISOdate, but passing in an hour, minute, and second is mandatory.
lubridate::as_datetime(today())        # Converts an object to a date or date-time.
lubridate::as.period()                 # Returns the length of time for an interval.
lubridate::decimal_date()              # Converts an instant to a decimal of its year.
lubridate::dminutes()                  # A duration, measured in minutes, For the exact amount of time that occurs between two instants.
lubridate::new_interval()              # creates an interval that spans from start to end.
lubridate::make_datetime()             # Produces objects of class Date.
lubridate::minute()                    # Get/set minutes component of a date-time.
lubridate::month()                     # Get/set month component of a date-time.
lubridate::quarter()                   # Returns the fiscal quarter and semester of a date-time.
lubridate::today()                     # Returns the current system date.
lubridate::wday()                      # Extracts weekday from date. Takes a character string or numeric value as input and returns an object of class POSIXct.
lubridate::year()                      # Extracts year from date. Takes a character string or numeric value as input and returns an object of class POSIXct.
lubridate::ymd_hm()                    # A function for parsing date-times.
strftime()                             # Converts the time into a string, formatted using http://bit.ly/1BN617P.
strptime()                             # Converts the time into a string, no formatting.
weekdays()                             # Returns the day of the week (e.g., Monday).

# String manipulation
chartr(needle, replacement, haystack)  # `chatr` is a weird function that, letter-by-letter, replaces needle with replacement in haystack.
clean_names()                          # Takes column names with spaces etc. and makes them R-compatible.
gsub(needle, replacement, haystack)    # Searches haystack for all instances of needle and replaces them with replacement.
nchar()                                # If you want to how many letters are in "hello", you might be tempted to use `length("hello")`. That's incorrect, because that's about vector length, which is 1.
noquote()                              # Strips quotes from a string.
options(stringsAsFactors = FALSE)      # Data frames will convert character vectors to factors by default.This annoys nearly everyone.
paste(x, y, sep = ' ')                 # Join multiple vectors together.
paste(x, collapse = ' ')               # Join elements of a vector together.
str_c("x", "y", sep = ", ")            # Combine strings, using 'sep' to control how they are separated.
strsplit(what, where)                  # Splits object what by every instance of where.
substr(x, start, stop)                 # Takes all letters of x from position `start` to position `end`.
tolower()                              # Converts x to entirely lowercase letters.
toupper()                              # Converts x to entirely upercase letters.
trimws()                               # Removes leading and trailing whitespace from strings.

# Statistics
anova()                                # Compute analysis of variance table for fitted model (can use on results of lm()). In practice, you first use lm / aov to fit a model, then use anova to analyse the result.
aov()                                  # Performs 1 way ANOVA. Fit a linear model, similar to lm(), however returns results as an analysis of variance result table, can use as an extension of 2 sample independent or paired t-tests (repeated measures anova) to compare equality of means of samples.
coef()                                 # Extracts the coefficients for the model and tells you their value in the linear relationship (m in "y = mx + b").
confint()                              # Computes confidence intervals for all coefficients in a model.  Defaults to 95% confidence intervals, but you can specify with the level argument.
dbinom()                               # Returns the value of the probability density function for the binomial distribution.
density()                              # Compute kernel density estimates.
deviance()                             # Returns the deviance of the model.  TODO: Revisit, figure out what this is.
dpois()                                # Returns the value of the probability density function for the poisson distribution.
fitted()                               # Extracts the fitted values for a model.  For example, look at `fitted(fitted(lm(Petal.Length ~ Petal.Width, iris)))`.
formula()                              # Extracts the formula from a model.  The formula in lm(Petal.Length ~ Petal.Width, iris) is Petal.Length ~ Petal.Width, iris.
glm(x ~ y, data=df)	     	             # Generalised linear model.
influence.measures()                   # Returns the relative influence of each data point on the model.
lm(x ~ y, data=df)		                 # Linear model.                            
nls()                                  # Estimate parameters of a nonlinear model.
pbinom()                               # Returns the value of the probability distribution function for the binomial distribution.
pchisq()                               # Cumulative distribution function for chi-square distribution, returns lower-tail test p-value when inputs are chi-square test statistic and degrees of freedom. Note: the relevant p-value in chi-square tests is equal to one minus this value. The same outcome could also be achieved by setting the argument: lower.tail = FALSE 
pnorm()                                # Returns the value of the probability density function for the normal distribution, the area under the curve to the left (or right) of specified valueqnorm() # and qqline().                # Tools for checking normality.
ppois()                                # Returns the value of the probability distribution function for the poisson distribution.
predict()                              # Obtain predicted values from linear model.
pf()                                   # Analogous to pnorm() and pt(), for F-distribution, inputs include F-test statistic and two values for degrees of freedom.
prcomp(df)                             # Conducts principle component analysis (dimensionality reduction).
pt()                                   # Cumulative density function for Student's t -distribution, returns area under the curve to the left (or right) of specified value, similar to pnorm(), but for t -distribution.
qbinom()                               # Returns the value of the probability quantile function for the binomial distribution.
qpois()                                # Returns the value of the probability quantile function for the poisson distribution.
qt()                                   # Returns quantiles (inverse cdf) of the t-distribution if you specify the tail area (left, by default) and degrees of freedom.
resid()                                # Extracts the residuals for the fitted values of a model. For example, look at `resid(lm(Petal.Length ~ Petal.Width, iris))`.
residuals()                            # Gives (observed - predicted) for a model fit to data.
rstandard()                            # Regression Deletion Diagnostics?  TODO: Don't know what this means.
sample()                               # Takes a sample from a vector of data.
sd()                                   # Returns sample standard deviation in vector.
var()                                  # Returns variance of values in vector.

# Statistical testing
bartlett.test()                        # Performs Bartlett's test of the null that the variances in each of the groups (samples) are the same.
binom.test()                           # Performs an exact test of a simple null hypothesis about the probability of success in a Bernoulli experiment.
chisq.test()                           # Performs chi-squared contingency table tests and goodness-of-fit tests.
cor.test()                             # Test for association between paired samples,
fisher.test()                          # Fisher test for contingency table.
oneway.test()                          # Tests whether two or more samples from normal distributions have the same means. The variances are not necessarily assumed to be equal.
pairwise.t.test()                      # Calculates pairwise comparisons between factor levels with corrections for testing more than 2 means.
prop.test()                            # Test for difference between proportions. 
t.test()                               # Used to determine whether there is a significant difference between the means of two groups, small sample size.
var.test()                             # Performs an F test to compare the variances of two samples from normal populations.

# Graphs and Plots
ggfortify::autoplot()                  # Invoking autoplot(x) on an object x with class myclass will produce the plot you want! Will draw subplots for certain classes.
barchart()                             # Lattice command for producing bar graphs.
barplot()                              # Produces a bar graph.
boxplot()                              # Produces a boxplot.
bwplot()                               # Lattice command for producing boxplots.
hist()                                 # Produces a histogram.
histogram()                            # Lattice command for producing histograms.
lowess()                               # Scatter plot smoothing.
mosaicplot()                           # Produces a mosaic plot.
par()                                  # Query and edit graphical settings.
plot()                                 # Produces a scatterplot.
plot_prcomp(data, variance_cap = 1)    # Lattice command for 1principal component analysis plots.
qqplot()                               # Produces a quantile-quantile plot.
stem()                                 # Produces a stem plot.
xyplot()                               # Lattice command for producing scatterplots.

# Pipes
# From the magrittr package, some of which are also used in other packages.
df %>% expr                            # Passes an intermediate result onto the next function in a single statement, without needing variables to store the intermediate results. When describing it, you can think of it as a "THEN".
df %$% expr                            # It "explodes" out the variables in a data frame so that you can refer to them explicitly. Used when you pass individual vectors, not a data frame and expressions to be evaluated in the context of that data frame.
df %T>% expr                           # Works like %>% except that it returns the left-hand side instead of the right-hand side. useful when we are saving the final result of said commands back to a data frame, but also have some kind of ancillary function tacked on at the very end (i.e. plot()) that we don't want saved to the object.

# A few favorite examples ~~~~~~~~~~~~~~~~~~~~~~~~

# Creates a new data frame with only those values that are important to you, with new columns for each calculation
baseball %>%
  group_by(year) %>%
  summarise(
    mean = mean(g, na.rm = TRUE), # Suppresses NA warning
    sum = sum(hr, na.rm = TRUE), # Suppresses NA warning
    freq = n() 
  )

# Count of ids for the first 100 rows, weighted by the number of home runs
plyr::count(baseball[1:100,], vars = "id", wt_var = "hr")

# Count of times each player appeared in each of the years they played
plyr::count(baseball, c("id", "year"))

# removes all occurrences of duplicated values in multiple columns
df[!(duplicated(df[c("x","y")]) | duplicated(df[c("x","y")], fromLast = TRUE)), ] 

# Remove all spaces in every column of the data frame
data[] <- lapply(data, gsub, pattern = " ", replacement = "", fixed = TRUE)

# To to remove all spaces from all but the first column in a data frame
data[-1] <- lapply(data[-1], gsub, pattern = " ", replacement = "", fixed = TRUE)

# Convert datetime (factor) to time only
format(as.POSIXct(strptime(as.character(df$c, '%d/%m/%Y %H:%M:%S'),"%d/%m/%Y %H:%M:%S",tz="")) ,format = "%H:%M")
