# clean-code-best-practices
Ten guiding principles for programming in R for beginners.

What is clean code? Clean code is a consistent style of programming that makes your code easier to write, read, and maintain. In other words, it is 1) modular, 2) predictable, 3) testable, and 4) performant. Ask yourself, “Will someone else be able to understand this code six months from now?” Here are some best practices when coding in ```R```. 

1) Describe your code. When you start coding, describe what the ```R``` code does in the very first line. If you are going to publish your code (i.e., Github), show authorship. Use comments to break your code into small modules, each with a single responsibility, so that it’s likely that you’ll never have to touch most modules again. There is time saved in “write it and forget it.”

Example:
```
# This code provides examples for new R developers
# Code developed by Danielle Lynch
```
2) Load Packages. After describing your code in the first line, use the library function to list and load all the relevant ```R``` packages needed to execute your code. Make sure you are using the latest updated packages. You can use ```sessionInfo()``` to check your currently loaded packages and their versions.

Example:
```
library(quantmod)
library(zoo)
library(lubridate)
```
3) Organize all source files in the same directory. Store all the necessary files that will be used/sourced in your code in the same directory. You can use the relative path to access them.

Example:
```
# Reading file using full path
data <- read.csv(file = "C:/Users/Documents/data.csv", header = TRUE)

# Reading file using relative path
data <- read.csv(file = "data.csv", header = TRUE)
```
4) Indent your code. Indentation makes your code easier to read, especially if there are multiple nested statements. When indenting your code, use two spaces. Never use tabs or mix tabs and spaces. However, when an if function definition runs over multiple lines, it is ok to indent the second line to where the definition starts to keep things lined up.

Example:
```
function_name <- function(a = "one long argument", 
                          b = "another argument",
                          c = "another long argument") {
  # As usual code is indented by two spaces.
}}
```
5) Keep names short and meaningful. Most code is self-commenting, if done well. For example, ```precip``` is a more useful object name that tells us something compared to ```x```. Name functions to describe what they do, thus eliminating the need for comments and reducing visual clutter.

6) Clean code is DRY. DRY is an acronym that stands for “Don’t Repeat Yourself.” If you are doing the same thing in multiple places, consolidate the duplicate code.

7) Don’t start names with numbers! Objects that start with a number are NOT VALID in ```R```.

8) Avoid names that are existing functions in ```R```, such as: ```if, else, for, c, T, mean, data, weights.```

9) Avoid using dots in object names.  e.g. ```my.dataset```. Dots have a special meaning in ```R``` (for methods) and other programming languages. Instead use underscores. 

```
my_dataset
```

10) Don’t save your workspace – When you exit ```R```, it is advisable to not save the workspace and start in a clean workspace for your next ```R``` session. Objects from the previous ```R``` sessions can lead to errors which can be hard to debug. Instead, save your .R and .RData files individually and load them when you begin your next ```R``` session.
