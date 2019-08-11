# Stattleship parser
# Code developed by Danielle Lynch
# April 2, 2019

# Step 1
# First, fix the pls2017 saved file, otherwise it won't load with the correct object name
# This code assumes you saved the Stattleship data files in a folder called "Level"
temp.space <- new.env()
bar <- load("~/Level/pls2017.RData", temp.space)
pls2017 <- get(bar, temp.space)
rm(temp.space, bar)
save(list = ls(all.names = TRUE), file = "~/Level/pls2017.RData", envir = .GlobalEnv)
# rm(pls2017) # Uncomment this line if you are proceeding to Step 2. Leave it alone if you are moving directly to Step 3.

# Step 2 (do this step only if you intend to take the "easy mode" for your Xcase)
# create individual dataframes from lists
# run once, save results - 20minutes!
if (T) {
  for (k in (c("pls2017", "gls2017"))){
    eval(parse(text = sprintf("load('~/Level/%s.RData')", k)))
    eval(parse(text = sprintf("w <- %s", k)))
    for (j in names(w[[1]])) {
      print(sprintf("%s - %s (%d|%d)", k, j, length(w[[1]]), length(w)))
      v_name <- sprintf("%s_%s", j, substr(k, 1, 1))
      eval(parse(text = sprintf("%s <- c()", v_name)))
      for (i in 1:length(w)) {
        eval(parse(text  =sprintf("%s <- rbind(%s, w[[%d]]$%s)", v_name, v_name, i, j)))
      }
    }
  }
  s2s <- function(i,j) sprintf("%s_%s",i,substr(j,1,1))
  s2v <- function(i,j) eval(parse(text=s2s(i,j)))
  df_list <- c()
  for (k in (c("pls2017", "gls2017"))){
    eval(parse(text=sprintf("w <- %s", k)))
    tbl <- as.table(sapply(names(w[[1]]), function(x) object.size(s2v(x, k))/1000.0))
    df_list <- c(df_list, sapply(names(w[[1]]), function(x) s2s(x, k)))
    eval(parse(text = sprintf("%s_vars <- tbl", k)))
  }
  # save results
  save(list = as.vector(df_list), file=path.expand("~/Level/dl_ss_data"))
}
                                 
# Step 3                                
# Now everything has been saved into an all-inclusive file. 
# You can clear your workspace, exit RStudio, and come back later.
# Read data files - 3 secs load
load("~/Level/dl_ss_data")
teams_g <- unique(teams_g)
teams_p <- unique(teams_p)

# Step 4
# Create a list of terms; for those new to baseball, this will aid the creation of a data dictionary.
library(tm)
gls2017_names <- sapply(names(rapply(gls2017, enquote, how = "unlist")), eval)
gls2017_names <- data.frame(unique(sub('.*\\.', '', removeNumbers(gls2017_names))))
names(gls2017_names) <- "variable"

pls2017_names <- sapply(names(rapply(pls2017, enquote, how = "unlist")), eval)
pls2017_names <- data.frame(unique(sub('.*\\.', '', removeNumbers(pls2017_names))))
names(pls2017_names) <- "variable"

terms <- unique(rbind(gls2017_names, pls2017_names))

# Step 5 (includes all the rest of the code on this page)
# Create vectors of several key variable calculations by team id
tweight_sum <- sapply(teams_p$id, function(tid)
  sum(na.omit(players_p[players_p$team_id == tid, "weight"])))

tweight_mean <- sapply(teams_p$id, function(tid)
  mean(na.omit(players_p[players_p$team_id == tid, "weight"])))

twins_sum <- sapply(teams_p$id, function(tid)
  length(which(games_g$winning_team_id == tid)))

tsal_sum <- sapply(teams_p$id, function(tid)
  sum(na.omit(players_p[players_p$team_id == tid, "salary"])))

tsal_mean <- sapply(teams_p$id, function(tid)
  mean(na.omit(players_p[players_p$team_id == tid, "salary"])))

# Pull all vectors into a convenient format (matrix)
tmatrix <- cbind(tsal_mean, tsal_sum, tweight_mean, tweight_sum, twins_sum)

# You can convert the matrix to a data frame
mode(tmatrix) = "numeric"
tdf <- data.frame(tmatrix)

# If needed, you can convert rownames to the first column
library(dplyr)
tdf <- add_rownames(tdf, "team_id")
