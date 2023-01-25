# Setting up working directory
setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\Cap2")
getwd()

# Creating an empty DataFrame
df <- data.frame()
class(df)
df

# Creating empty vectors
names <- character()
ages <- numeric()
itens <- numeric()
codes <- integer()

df <- data.frame(c(names, ages, itens, codes))
df

# Creating vectors
country = c("Portugal", "Inglaterra", "Irlanda", "Egito", "Brasil")
name = c("Bruno", "Tiago", "Amanda", "Bianca", "Marta")
height = c(1.88, 1.76, 1.53, 1.69, 1.68)
code = c(5001, 2183, 4702, 7965, 8890)

# Creating a dataframe from the vectors
search = data.frame(country, name, height, code)
search

# Adding a new vector to an existing dataframe
eyes = c("verde", "azul", "azul", "castanho", "castanho")
sear = cbind(search, eyes)
sear

# Info about the dataframe
str(sear)
dim(sear)
length(sear)

# Getting a vector from the dataframe
sear$country
sear$name

# Extracting a single values
sear[1, 1]
sear[3, 2]

# Number os rows and columns
nrow(sear)
ncol(sear)

# First elements
head(sear)
head(mtcars)

# last elements
tail(sear)
tail(mtcars)

# R built-in dataframes
?mtcars
mtcars
View(mtcars)

# Filter to a subset of the data by a certain criteria
sear[height < 1.60,]
sear[height < 1.60, c('code', 'eyes')]
sear

# named dataframes
names(sear) <- c("Country", "Name", "Height", "Code", "Eyes")
sear

colnames(sear) <- c("Var 1", "Var 2", "Var 3", "Var 4", "Var 5")
rownames(sear) <- c("Obs 1", "Obs 2", "Obs 3", "Obs 4", "Obs 5")
sear

# loading a csv file
?read.csv
pacients <- data.frame(read.csv(file = 'pacientes.csv', header = TRUE, sep = ","))

# Visualizing the dataset
View(pacients)
head(pacients)
summary(pacients)

# Visualizing the variables from the dataset
pacients$Diabete
pacients$Status
pacients$status

# Histogram
hist(pacients$Idade)

# Combining dataframes
final_dataset <- merge(sear, pacients)
final_dataset
?merge
