setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

# using readr
install.packages("readr")
library(readr)

# exporting the dataset and generating a file
?write_csv
write_csv(iris, "iris.csv")
dir()

# data types
# col_integer()
# col_double()
# col_logical()
# col_chatacter()
# col_factor()
# col_skip()
# col_date() (alias = "D"), col_datetime() (alias = "T"), col_time() ("t")

# loading the file
?read_csv
df_iris <- read_csv("iris.csv",
                    col_types = list(
                      Sepal.Length = col_double(),
                      Sepal.Width = col_double(),
                      Petal.Length = col_double(),
                      Petal.Width = col_double(),
                      Species = col_factor(c("setosa", "versicolor", "virginica"))
                    ))

View(df_iris)
dim(df_iris)
str(df_iris)


# Using utils
df_iris2 <- read.csv("iris.csv")
View(df_iris2)
dim(df_iris2)
str(df_iris2)

df_iris2 <- read.csv("iris.csv", stringsAsFactors = T)

# Generating one more csv
write_csv(mtcars, 'mtcars.csv')
dir()

# loading and manipulating more than one csv file simultaneously
list.files()
lista_arquivos <- list.files(getwd(), full.names = T, pattern = "*.csv")
lista_arquivos

# loading each file and generating a list
lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
View(lista_arquivos2)
