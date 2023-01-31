setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

install.packages("XML")
library(XML)

library("methods")

resultado <- xmlParse(file = "funcionarios.xml")

print(resultado)

rootnode <- xmlRoot(resultado)
print(rootnode[1])

rootsize <- xmlSize(rootnode)

print(rootsize)

print(rootnode[[1]][[1]])
print(rootnode[[1]][[5]])
print(rootnode[[3]][[2]])

xmldataframe <- xmlToDataFrame("funcionarios.xml")
print(xmldataframe)
