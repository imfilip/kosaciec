if(!require(data.table)) install.packages('data.table'); library(data.table)
if(!require(tidyverse)) install.packages('tidyverse'); library(tidyverse)
#rm(list = ls())
#writeLines(text = capture.output(sessionInfo()), "sessionInfo.txt")


head(iris)
#Sepal.Length | Sepal.Width | Petal.Length | Petal.Width | Species

#data.frame
str(iris)

iris.sepal_length <- data.frame(Value = iris$Sepal.Length, Type = 'sepal', Dimension = 'length', Species = iris$Species)
iris.sepal_width  <- data.frame(Value = iris$Sepal.Width, Type = 'sepal', Dimension = 'width', Species = iris$Species)
iris.petal_length <- data.frame(Value = iris$Petal.Length, Type = 'petal', Dimension = 'length', Species = iris$Species)
iris.petal_width  <- data.frame(Value = iris$Petal.Width, Type = 'petal', Dimension = 'width', Species = iris$Species)

iris.all <- rbind(iris.petal_width, iris.petal_length, iris.sepal_width, iris.sepal_length)

head(iris.all)
#Value | Type | Dimensioon | Species
###HISTOGRAMS
#histogram on the basis of iris
ggplot(data = iris.all, mapping = aes(x = Value, fill = Species)) +
  geom_histogram(mapping = aes(y = ..density..),
                 bins = 40) +
  facet_wrap(facets = ~ Species, nrow = 3)

ggplot(data = iris, mapping = aes(x = Sepal.Length, col = Species, fill = Species)) +
  geom_histogram(mapping = aes(),#aes(y = ..density..),
                 stat = 'bin',
                 bins = 15,
                 #fill = 'black',
                 #col = 'white',
                 alpha = 0.7) +
  labs(title = "Histogram", x = 'length', y = 'density') +
  facet_wrap(facets = ~ Species, nrow = 3)

#histogram on the basis of iris.all
ggplot(data = iris.all, mapping = aes(x = Value, col = Species, fill = Species)) +
  geom_histogram(mapping = aes(),#aes(y = ..density..),
                 stat = 'bin',
                 bins = 50,
                 #fill = 'black',
                 #col = 'white',
                 alpha = 0.7) +
  labs(title = "Histogram", x = 'value', y = 'density') +
  facet_wrap(facets = ~ Type + Species + Dimension, nrow = 4)

###SCATTERPLOTS
#scatterplot
ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point() +
  facet_wrap(facets = ~ Species, nrow = 3)
