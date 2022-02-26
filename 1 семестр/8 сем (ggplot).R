getwd()
require(readr)

# install.packages('tidyverse')
require(tidyverse)
library(tidyverse)

Sys.setenv(LANG = 'en')
heroes = read_csv('data.csv')

plot(heroes$Height, heroes$Weight)

hist(heroes$Weight)

boxplot(Weight ~ Gender, heroes)

cars = mtcars %>% as_tibble()
cars = as_tibble(mtcars)
plot(cars$cyl, cars$mpg)
hist(cars$mpg)
boxplot(mpg ~ cyl ,cars)


require(ggplot2)
ggplot(data = cars %>%
         mutate(cyl = as.character(cyl)), mapping = aes(x = cyl, y = mpg)) +
  geom_boxplot()

ggplot(data = cars, aes(y=mpg, x = hp)) +
  geom_point()

ggplot(data = cars, aes(x = mpg)) +
  geom_histogram()

library(faraway)
data(worldcup)

# разница между этим
ggplot(worldcup, aes(x = Time, y = Passes,
                      size = Shots, color = Position)) +
  geom_point()
# и этим
ggplot(worldcup, aes(x = Time, y = Passes, size = Shots)) +
  geom_point(color = "blue")

# для рандомного df
ggplot(df, aes(x = Year, group = 1)) +
  geom_line(aes(y = equities, group = 1, colour = 'equities'), size = 1.5) +
  geom_line(aes(y = corp_bonds, group = 1, colour = 'corp_bonds'), na.rm = T, size = 1.5) +
  geom_line(aes(y = gov_bonds, group = 1, colour = 'gov_bonds'), na.rm = T, size = 1.5) +
  geom_line(aes(y = inflation, colour = 'inflation'), size = 1.5) +
  scale_y_continuous(trans = 'log10') +
  ylab('') + ggtitle('Cumulative index value', 'start = 2002; log scale') +
  scale_colour_manual("", 
                      breaks = c("equities", "corp_bonds", "gov_bonds", 'inflation'),
                      values = c("darkred", "darkgreen", "blue", 'black')) +
  theme(legend.position = c(0.1, 0.8),
        axis.text=element_text(size = 12, face = 'bold'), 
        legend.text = element_text(size = 12, face = 'bold.italic'))     