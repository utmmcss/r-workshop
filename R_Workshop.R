#### R Help: help() and ? ####
?topic or help(topic), where “topic” is the name of the topic for which you need 
help.

Example 
?seq
help(plot)

#### Basic Syntax #### 

this is a comment operator #
  # this is a comment

this is an assignment operator = OR <- 
  a = 10
  A <- 100
  
concatenation operator c
  c(3, 2, 4, 5, 6)
  
multiplcation *
  
addition +

subtraction - 

division /
  
exponentiation ^

x mod y 
  x %% y

integer division %%
  
sequence from a to b by h seq(a, b, h)

mean mean()

median median()

variance var()

standard deviation sd()

summation sum()

minimum min()

maximum max()

#### Graphs in R ####

x = c("Yes", "No", "No", "Yes", "Yes") 

table(x)

par(mfrow = c(2,2))  

barplot(table(x)) # bar chart with frequency 

barplot(table(x), col=c("red","blue")) # you can make the categories colored 

barplot(table(x)/length(x))

barplot(table(x)/length(x), col=c("red","blue")) # divide by n for proportion 

par(mfrow = c(1,2)) 

pie(table(x))  

pie(table(x), col = c("purple","green2")) 

x = c(13, 15, 22, 24, 28, 29, 31, 32, 36, 36, 37, 38, 39, 39, 43, 47, 48, 52, 54, 65) 

par(mfrow = c(2,2)) # multiple plots 

hist(x) # frequencies 

hist(x, main="Histogram for Marks", xlab="Marks", col="green") # add some details 

hist(x,probability=TRUE) # proportions (relative frequency) 

hist(x,probability=TRUE) # proportions (relative frequency) 
lines(density(x)) #Get a density curve to go along with histogram 

boxplot(x, main="Boxplot for the marks") 

#### packages in R ####

#### packages in R: ggplot2 ####

# The easiest way to get ggplot2 is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just ggplot2:
install.packages("ggplot2")

library(ggplot2)

data()
?BOD
BOD

?ggplot
ggplot(data = BOD, 
       mapping = aes(x = Time, 
                     y = demand)) 
# this creates a blank canvas with our plots

ggplot(data = BOD, 
       mapping = aes(x = Time, 
                     y = demand)) + 
  geom_point()
# geom_point() allows the graph to populate with data points

ggplot(data = BOD, 
       mapping = aes(x = Time, 
                     y = demand)) + 
  geom_point(size = 3) +
  geom_line(colour = "purple")

ggplot(BOD, 
       mapping = aes(x = Time, 
                     y = demand)) + 
  geom_point(size = 3) +
  geom_line(colour = "purple")

?CO2
View(CO2)

ggplot(CO2, aes(x = conc, 
             y = uptake, 
             colour = Treatment)) +
  geom_point()

# applies the type of treatment with the x and y variables
# to differentiate the treatment

ggplot(CO2, aes(x = conc, 
                y = uptake, 
                colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5)

ggplot(CO2, aes(x = conc, 
                y = uptake, 
                colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth()

ggplot(CO2, aes(x = conc, 
                y = uptake, 
                colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method = lm, se = F)

ggplot(CO2, aes(x = conc, 
                y = uptake, 
                colour = Treatment)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method = lm, se = F) + 
  facet_wrap(~Type) + 
  labs(title = "Concentration of CO2")


# ^ from https://ggplot2.tidyverse.org/

#### packages in R: dplyr ####

# The easiest way to get dplyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just dplyr:
install.packages("dplyr")

# ^ from https://dplyr.tidyverse.org/

library(dplyr)

# https://www.kaggle.com/dhruvildave/billboard-the-hot-100-songs/version/11

attach(charts)

head(charts, 10)

charts %>% head(10)

# ^ %>% allows us to pipe in R

# select
charts %>% 
  select(date, rank, song, artist, weeks.on.board)

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board)

# mutate
charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  mutate(is_collab = grepl("Featuring", artist))

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  mutate(is_collab = grepl("Featuring", artist)) %>%
  select(artist, is_collab, everything())

# filter

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20)

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake")

# and = ,

# or = |

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake" | artist == "Taylor Swift")

# distinct

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake") %>%
  distinct(song)

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake") %>%
  distinct(song) %>%
  .$song

# ^ . uses piping to create a vector

# group by

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake") %>%
  group_by(song)

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake") %>%
  group_by(song) %>% 
  summarise(total_weeks_popular = max(weeks_popular))

# arrange

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake") %>%
  group_by(song) %>% 
  summarise(total_weeks_popular = max(weeks_popular)) %>%
  arrange(total_weeks_popular)

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  filter(weeks_popular >= 20, artist == "Drake") %>%
  group_by(song) %>% 
  summarise(total_weeks_popular = max(weeks_popular)) %>%
  arrange(desc(total_weeks_popular), song)

# count
 
charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  count(artist)

charts %>% 
  select(date:artist, weeks_popular = weeks.on.board) %>%
  count(artist) %>%
  arrange(desc(n))

#### packages in R: tidyr ####

# The easiest way to get tidyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just tidyr:
install.packages("tidyr")

# ^ https://tidyr.tidyverse.org/
