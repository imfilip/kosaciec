if(!require(data.table)) install.packages('data.table'); library(data.table)
if(!require(tidyverse)) install.packages('tidyverse'); library(tidyverse)
#rm(list = ls())


head(iris)
#Sepal.Length | Sepal.Width | Petal.Length | Petal.Width | Species

#data.frame
str(iris)

ggplot(data = iris, mapping = aes(x = Sepal.Length)) +
  geom_histogram(mapping = aes(y = ..density..),
                 stat = 'bin',
                 bins = 10,
                 fill = 'black',
                 alpha = 0.7,
                 col = 'white') +
  labs(title = "Histogram", x = 'length', y = 'density')


ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Sepal.Width, col = Species, shape = Species)) +
  geom_point() +
  facet_wrap(facets = ~ Species, nrow = 2)


ggplot(data = iris, mapping = aes(x = Kielich.length, y = Kielich.width, col = Gatunek, shape = Gatunek)) +
  geom_smooth(mapping = aes(linetype = Gatunek), formula = y ~ x) +
  facet_wrap(facets = ~ Gatunek, nrow = 2)