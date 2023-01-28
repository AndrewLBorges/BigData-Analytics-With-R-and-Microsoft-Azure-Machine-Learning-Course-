# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# creating a simple string
text <- "Isso eh uma string!"
text

x = as.character(3.14)
x
class(x)

# Concatenating Strings
name = "Nelson"; surname = "Mandela"
paste(name, surname)
cat(name, surname)

# Formatting output
sprintf("A %s eh nota %d", "Data Science Academy", 10)

# Extracting a substring
text <- "this is a string"
substr(text, start=12, stop=17)
?substr

# Number os chars
nchar(text)

# Capitalizing
tolower("Histogramas e Elementos de Dados")
toupper("Histogramas e Elementos de Dados")

# Using stringr
library(stringr)

# Dividing a string into its characters
?strsplit
strsplit("Histogramas e Elementos de Dados", NULL)

# Dividing a string into its characters after space
strsplit("Histogramas e Elementos de Dados", " ")

# working with strings
string1 <- c("Esta eh a primeira parte da minha string e serah a primera parte do meu vetor",
             "Aqui a minha string continua, mas serah transformada no segundo vetor")
string1

string2 <- c("Precisamos testar outras stirngs - @??!$",
             "Anahlise de Dados em R")
string2

# adding strings
str_c(c(string1, string2), sep = "")

# Counting number of times a character show in a text
str_count(string2, "s")

# Get the location of the fist and the last position in wich a character shows in the string
str_locate_all(string2, "s")

# replacing first occurence of a character
str_replace(string2, "\\s", "")

# replace all occurences
str_replace_all(string2, "\\s", "")

# finding patterns within the string
string1 <- "17 jan 2001"
string2 <- "1 jan 2001"
pattern <- "jan 20"
grepl(pattern = pattern, x = string1)
pattern <- "jan20"
grepl(pattern = pattern, x = string1)
