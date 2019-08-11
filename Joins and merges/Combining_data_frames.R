# Excercises in merge and join functions in R. 
# Code developed by Danielle Lynch

library(readr) 
library(dplyr)

superheroes <- "
  name, alignment, gender,         publisher, year
  Magneto,       bad,   male,            Marvel, 1963
  Storm,      good, female,            Marvel, 1975
  Mystique,       bad, female,            Marvel, 1978
  Batman,      good,   male,                DC, 1939
  Joker,       bad,   male,                DC, 1940
  Catwoman,       bad, female,                DC, 1940
  Hellboy,      good,   male, Dark Horse Comics, 1993"

publishers <- "
  publisher, year
  DC,       1934
  Marvel,       1939
  Vertigo,       1993"

superheroes <- read_csv(superheroes, skip = 1)
publishers <- read_csv(publishers, skip = 1)

# Mutating joins add new variables to one data frame from matching elements in another. It first matches observations by their keys, then copies across variables from one table to the other.
# Filtering joins filter elements from one data frame based on whether or not they match an element in another.
# Filtering joins never duplicate rows like mutating joins do.

# Inner join ~~~~~~~~~~~~~~~~~~~~
# Return all rows from x where there are matching values in y, and all columns from x and y. If there are multiple matches between x and y, all combination of the matches are returned. # Keeps all elements in y. This is a mutating join.
# Reversing the order (y, x) makes no difference with inner joins, unlike other types of joins.
# Matches pairs of observations whenever their key variable(s) are equal
# The output of an inner join is a new data frame that contains the key variable(s), the x values, and the y values.
# R automatically joins by all common variable names unless the key variable is defined
inner_join <- inner_join(superheroes, publishers) # Returns no results
# Define a key variable
inner_join <- inner_join(superheroes, publishers, by = "publisher")   
# Merge, in this case, does the same thing only it does not show the key variable(s) in the console
inner_merge <- base::merge(superheroes, publishers) # Returns no results
inner_merge <- merge(superheroes, publishers, by = "publisher") 
# There is also the dplyr way...
inner_join_pipes <- superheroes %>% 
  inner_join(publishers, by = "publisher")
# Reorder columns
inner_join <- inner_join[c("publisher", "name", "alignment", "gender", "year.x", "year.y")]
inner_join_pipes <- inner_join_pipes[c("publisher", "name", "alignment", "gender", "year.x", "year.y")]
# Sort
inner_join <- inner_join[with(inner_join, order(publisher, name, alignment, gender)), ]
inner_merge <- inner_merge[with(inner_merge, order(publisher, name, alignment, gender)), ]
inner_join_pipes <- inner_join_pipes[with(inner_join_pipes, order(publisher, name, alignment, gender)), ]

# Left join ~~~~~~~~~~~~~~~~~~~~
# Return all rows from x, and all columns from x and y. If there are multiple matches between x and y, all combination of the matches are returned. 
# Keeps all elements in x. This is a mutating join.
left_join <- left_join(superheroes, publishers) # What happened to the "year" column?
left_merge <- merge(superheroes, publishers, all.x = TRUE) # What happened to the "year" column?
# Define a key variable
left_join <- left_join(superheroes, publishers, by = "publisher") 
left_merge <- merge(superheroes, publishers, by = "publisher", all.x = TRUE)
# Clean up environment
rm(inner_merge, left_merge, rev_inner_merge, rev_inner_join, inner_join_pipes)

# Reversing the order = the same results as 'right_join'
rev_left_join <- left_join(publishers, superheroes, by = "publisher") 
rev_left_merge <- merge(publishers, superheroes, by = "publisher", all.x = TRUE) 
# Reorder columns
rev_left_join <- rev_left_join[c("publisher", "name", "alignment", "gender", "year.x", "year.y")]
rev_left_merge <- rev_left_merge[c("publisher", "name", "alignment", "gender", "year.x", "year.y")]
# Sort
rev_left_join <- rev_left_join[with(rev_left_join, order(publisher, name, alignment, gender)), ]
rev_left_merge <- rev_left_merge[with(rev_left_merge, order(publisher, name, alignment, gender)), ]

# Right join ~~~~~~~~~~~~~~~~~~~~
# Return all rows from y, and all columns from x and y. If there are multiple matches between x and y, all combination of the matches are returned. 
# Keeps all elements in y. This is a mutating join.
right_join <- right_join(superheroes, publishers, by = "publisher")                
# Reorder columns
right_join <- right_join[c("publisher", "name", "alignment", "gender", "year.x", "year.y")]
# Sort
right_join <- right_join[with(right_join, order(publisher, name, alignment, gender)), ]
# right_merge <- merge(superheroes, publishers, by = "publisher", all.y = TRUE) 
# Clean up environment
rm(rev_left_join, rev_left_merge)

# Full join ~~~~~~~~~~~~~~~~~~~~
# Return all rows and all columns from both x and y. Where there are not matching values, returns NA for the one missing. 
# Similar to a "union" function
# Keeps all elements in x and y. This is a mutating join.
full_join <- full_join(superheroes, publishers, by = "publisher")                 
# full_merge <- merge(superheroes, publishers, by = "publisher", all = TRUE)

# Semi join ~~~~~~~~~~~~~~~~~~~~
# Return all rows from x where there are matching values in y, keeping just columns from x. A semi join differs from an inner join because an inner join will return one row of x for each matching row of y, where a semi join will never duplicate rows of x.
# Keeps all elements in x that have a match in y. This is a filtering join.
semi_join <- semi_join(superheroes, publishers, by = "publisher")   
# There is no equivalent for this command in merge

# Anti join ~~~~~~~~~~~~~~~~~~~~
# Return all rows from x where there are not matching values in y, keeping just columns from x. 
# Drops all elements in x that have a match in y. This is a filtering join.
anti_join <- anti_join(superheroes, publishers, by = "publisher")   
# There is no equivalent for this command in merge

# Cross join ~~~~~~~~~~~~~~~~~~~~
# Every possible iteration, whether matching or not. This is a mutating join. Only use this if you want to cry.
cross_join <- merge(superheroes, publishers, by = NULL) 
# There is no equivalent for this command in join

# Alternatively, there is the plyr package
inner_join <- join(x, y, by = "publisher", type = 'inner')
left_join <- join(x, y, by = "publisher", type = 'left')
right_join <- join(x, y, by = "publisher", type = 'right')
full_join <- join(x, y, by = "publisher", type = 'full')

# Sets of a sort  ~~~~~~~~~~~~~~~~~~~~
# All these operations below work with a complete row, comparing the values of every variable. 
# These expect the x and y inputs to have ALL OF THE SAME VARIABLES, and treat the observations like sets.

# Intersect 
# Return only observations in both x and y (material they have in common)
# Not compatible with dplyr
intersect <- intersect(x, y)                                            

# Union
# Return unique observations in x and y.
# Not compatible with dplyr
union <- union(x, y)
# Another way to accomplish this is through a two step union
# union_step1 <- rbind(x,y)
# union_step2 <- unique(union_step1)

# Setdiff
# Return observations in x, but not in y.
# Not compatible with dplyr
setdiff <- setdiff(x, y)
