setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

install.packages("rjson")
library(rjson)

resultado <- fromJSON(file = "funcionarios.json")

print(resultado)

json_data_frame <- as.data.frame(resultado)

print(json_data_frame)
