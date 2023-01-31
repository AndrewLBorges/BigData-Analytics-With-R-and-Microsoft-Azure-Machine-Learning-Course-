setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

search()


# Using read.table
?read.table

df1 <- read.table("jogadores.txt")
df1
dim(df1)

df1 <- read.table("jogadores.txt", header = T, sep = ',')
df1
dim(df1)

df1 <- read.table("jogadores.txt", header = T, sep = ',', col.names = c("var1", "var2", "var3"))
df1

df1 <- read.table("jogadores.txt", header = T, sep = ',', col.names = c("var1", "var2", "var3"), na.strings = c('Tulio', 'Romario'))
df1

str(df1)

df1 <- read.table("jogadores.txt", header = T,
                  sep = ',',
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = T)
df1
str(df1)

# using read.csv
df2 <- read.csv("jogadores.txt")
df2
dim(df2)

df3 <- read.csv2("jogadores.txt")
df3
dim(df3)

df3 <- read.csv2("jogadores.txt", sep = ',')
df3
dim(df3)

# Using read.delim
df4 <- read.delim("jogadores.txt")
df4
dim(df4)

df4 <- read.delim("jogadores.txt", sep = ',')
df4
dim(df4)

