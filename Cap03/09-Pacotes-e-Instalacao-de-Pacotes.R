setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\Cap03")
getwd()

search()

# Installing and loading packages
install.packages(c('ggvis', 'tm', 'dplyr'))
install.packages('testthat')
library(ggvis)
library(tm)
require(dplyr)

search()
?require
detach(package:dplyr)

#  Listing the package content
?ls
ls(pos = "package:tm")
ls(getNamespace("tm"), all.names = TRUE)

# Listing the functions
lsf.str("package:tm")
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:ggplot2")

# R has a bunch of datasets preinstalled
library(MASS)
data()

?lynx
head(lynx)
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
iris$Sepal.Length
sum(Sepal.Length)

?attach
attach(iris)
sum(Sepal.Length)
