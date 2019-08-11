### R to SQL translation cheat sheet
### In large part, using dplyr
### This cheat sheet utilizes SQLite, which doesn't use as many data types as mySQL yet the code is practically the same.
### Most of the code and explanations were derived from https://rpubs.com/hadley/window, 
# https://beanumber.github.io/mysql-r-webinar/dplyr.html , https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html,
# https://www.onthelambda.com/2014/02/10/how-dplyr-replaced-my-most-common-r-idioms/
### Danielle Lynch
### April 24, 2019

library(dbplyr)
library(dplyr)
library(Lahman)
library(nycflights13)
library(RSQLite)
# library(RMySQL)
library(DBI)
library(ggplot2)
library(mosaic)

######################################
### Differences between R and SQL
# The most important difference between ordinary data frames and remote database queries 
# is that your R code is translated into SQL and executed in the database, not in R. 
# When working with databases, dplyr tries to be as lazy as possible:
# It never pulls data into R unless you explicitly ask for it.
# It delays doing any work until the last possible moment: 
# it collects together everything you want to do and then sends it to the database in one step.

# Perfect translation is not possible because databases don't have all the functions that R does. 
# The goal of dplyr is to provide a semantic rather than a literal translation: what you mean rather 
# than what is done. In fact, even for functions that exist both in databases and R, you shouldn't 
# expect results to be identical; database programmers have different priorities than R core programmers.

# Setting up the environment for the examples
if (has_lahman("sqlite")) {
  lahman_p <- lahman_sqlite()
  batting <- lahman_p %>% 
    tbl("Batting")
}
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
flights <- copy_to(con, nycflights13::flights)
teams <- copy_to(con, Lahman::Teams)
airports <- copy_to(con, nycflights13::airports)
copy_to(con, nycflights13::flights, "flights",
        temporary = FALSE, 
        indexes = list(
          c("year", "month", "day"), 
          "carrier", 
          "tailnum",
          "dest"
        )
)
flights_db <- tbl(con, "flights")
dir.create("data", showWarnings = FALSE)
download.file(url = "https://ndownloader.figshare.com/files/2292171",
              destfile = "data/portal_mammals.sqlite", mode = "wb")

# To connect to tables within a database, you can use the tbl() function from dplyr. 
# This takes two arguments: first, the schema you want to access in your database connection, 
# and second, that table you are interested in within that schema.
# This command does not load the data into the R session (as the read_csv() function did). 
# Instead, it merely instructs R to connect to the SQLite database contained in the portal_mammals.sqlite file.
# Using a similar approach, you could connect to many other database management systems that are supported by R
# including MySQL, PostgreSQL, BigQuery, etc.
mammals <- DBI::dbConnect(RSQLite::SQLite(), "data/portal_mammals.sqlite")

# Another example
db <- src_mysql(user = "r-user", password = "mypass", dbname = "lahman")

# Yet another example
con <- DBI::dbConnect(RMariaDB::MariaDB(), 
                      host = "database.rstudio.com",
                      user = "hadley",
                      password = rstudioapi::askForPassword("Database password")
)
# Just like a spreadsheet with multiple worksheets, a SQLite database can contain multiple tables. 
# In this case three of them are listed in the tbls row in the output.
src_dbi(mammals)

# Querying the database with the SQL syntax
tbl(mammals, sql("SELECT year, species_id, plot_id FROM surveys"))
surveys <- tbl(mammals, "surveys")
surveys %>%
  select(year, species_id, plot_id)
head(surveys, n = 10)
 
# This sequence of operations never touches the database. It's not until you ask for the data 
# (e.g., by printing tailnum_delay) that dplyr generates the SQL and requests the results from the database. 
tailnum_delay_db <- flights_db %>% 
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE), # Missing values are always removed in SQL, so use `mean(x, na.rm = TRUE)
    n = n()
  ) %>% 
  arrange(desc(delay)) %>%
  filter(n > 100)

# You can see the SQL it's generating with show_query()
tailnum_delay_db %>% show_query()
show_query(head(surveys, n = 10))

## collect()
# Typically, you'll iterate a few times before you figure out what data you need from 
# the database. Once you've figured it out, use collect() to pull all the data down into a local tibble
tailnum_delay <- tailnum_delay_db %>% collect()

# collect() requires that database does some work, so it may take a long time to complete. Otherwise, dplyr tries to prevent you from accidentally performing expensive query operations:
# Because there's generally no way to determine how many rows a query will return unless you actually run it, nrow() is always NA.
nrow(tailnum_delay_db)

# Because you can't find the last few rows without executing the whole query, you can't use tail().
tail(tailnum_delay_db)

## " and ' mean different things
translate_sql(x) # In SQLite variable names are escaped by double quotes
translate_sql("x") # And strings are escaped by single quotes

# Many functions have slightly different names
translate_sql(x == 1 && (y < 2 || z > 3))
translate_sql(x ^ 2 < 10)
translate_sql(x %% 2 == 10)

## And some functions have different argument orders:
translate_sql(substr(x, 5, 10))
translate_sql(log(x, 10))

## If statements are translated into a case statement:
translate_sql(if (x > 5) "big" else "small")

#######################################
### dplyr conversions

# dplyr knows how to convert the following R functions to SQL:
#   basic math operators: +, -, *, /, %%, ^
#   math functions: abs, acos, acosh, asin, asinh, atan, atan2, atanh, ceiling, cos, cosh, cot, coth, exp, floor, log, log10, round, sign, sin, sinh, sqrt, tan, tanh
# logical comparisons: <, <=, !=, >=, >, ==, %in%
#   boolean operations: &, &&, |, ||, !, xor
# basic aggregations: mean, sum, min, max, sd, var
# string functions: tolower, toupper, trimws, nchar, substr
# coerce types: as.numeric, as.integer, as.character

## Any function that dplyr doesn't know how to convert is left as is.
translate_sql(glob(x, y))

# New columns can be added to the data using mutate()
# fullcatdata <- catregistrationdetails %>%
#   dplyr::mutate(SERIAL_NO = paste0("CAT-", SERIAL_NO)) %>%
#   dplyr::left_join(catdata, by = "SERIAL_NO")

## Means
# In R, to get a higher level of numerical accuracy, mean() loops through the data twice. 
# R's mean() also provides a trim option for computing trimmed means; this is something that databases do not provide. 
translate_sql(mean(x, na.rm = TRUE)) 
#> <SQL> avg("x") OVER ()
translate_sql(mean(x, trim = 0.1)) # Returns an error. R's mean() provides a trim option which is something that databases do not provide. 

## Ordering
# All dplyr verbs generate a SELECT statement.
# select() and mutate() modify the SELECT clause
flights %>%
  select(contains("delay")) %>%
  show_query()

# As you can see here, the generated SQL isn't always as minimal as you might generate by hand.
flights %>%
  select(distance, air_time) %>%  
  mutate(speed = distance / (air_time / 60)) %>%
  show_query()

# filter() generates a WHERE clause
flights %>% 
  filter(month == 1, day == 1) %>%
  show_query()

# arrange() generates an ORDER BY clause
flights %>% 
  arrange(carrier, desc(arr_delay)) %>%
  show_query()

# summarise() and group_by() work together to generate a GROUP BY clause
flights %>%
  group_by(month, day) %>%
  summarise(delay = mean(dep_delay, na.rm = TRUE)) %>% 
  show_query()

#####################################################
## dplyr commands and their SQL counterparts
select()          # SELECT
mutate()          # user-defined columns
summarize()       # aggregated columns
filter()          # WHERE
group_by()        # GROUP BY
filter()          # HAVING
arrange()         # ORDER BY
inner_join()      # SELECT * FROM x JOIN y ON x.a = y.a
left_join()       # SELECT * FROM x LEFT JOIN y ON x.a = y.a
right_join()      # SELECT * FROM x RIGHT JOIN y ON x.a = y.a
full_join()       # SELECT * FROM x FULL JOIN y ON x.a = y.a
semi_join()	      # SELECT * FROM x WHERE EXISTS (SELECT 1 FROM y WHERE x.a = y.a)
anti_join()	      # SELECT * FROM x WHERE NOT EXISTS (SELECT 1 FROM y WHERE x.a = y.a)
intersect(x, y)	  # SELECT * FROM x INTERSECT SELECT * FROM y
union(x, y)	      # SELECT * FROM x UNION SELECT * FROM y
setdiff(x, y)	    # SELECT * FROM x EXCEPT SELECT * FROM y
# x and y don't have to be tables in the same database. If you specify copy = TRUE, 
# dplyr will copy the y table into the same location as the x variable. This is 
# useful if you've downloaded a summarised dataset and determined a subset of interest 
# that you now want the full data for.

############################################
# Visualizations
res <- batting %>%
  group_by(playerID) %>%
  summarize(tH = sum(H)) %>%
  filter(tH >= 3000) %>%
  arrange(desc(tH)) %>%
  show_query()

ggplot(data = collect(res), aes(x = reorder(playerID, tH), y = tH)) + 
  geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

library(plyr)
pythag <- Teams %>%
  filter(yearID >= 1954) %>%
  mutate(wpct = W / (W + L), run_ratio = R / RA) %>%
  select(teamID, yearID, wpct, run_ratio) %>%
  collect() %>%
  show_query()

ggplot(data = pythag, aes(x = run_ratio, y = wpct)) + 
  geom_point(alpha = 0.5)
