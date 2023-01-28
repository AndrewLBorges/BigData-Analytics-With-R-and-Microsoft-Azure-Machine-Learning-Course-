# First steps with R Language

# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# Get contributors names
contributors()

# License
licence()

# Infor about the session
sessionInfo()

# Printing
print("Hello Data Science world")

# Creating basic graph
plot(1:25)

# Installing packages
install.packages('randomForest')
install.packages('ggplot2')
install.packages("dplyr")
install.packages("devtools")

# Loading/Importing Packages
library(ggplot2)

# Unload Package
detach(package:ggplot2)

# If you have a function name, there is the help function to give some docs
help(mean)
?mean

# To get more details about a function, we can use sos library
install.packages("sos")
library(sos)
findFn("fread")

# If we dont have the function name
help.search('randomForest')
help.search('matplot')
??matplot
RSiteSearch('matplot')

# Quit Session
q()