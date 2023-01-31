setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

# Installing the package
install.packages("readxl")

library(readxl)

# Listing worksheet
excel_sheets("PopUrbana.xlsx")

# Reading a sheet
read_excel("PopUrbana.xlsx")
View(read_excel("PopUrbana.xlsx"))
read_excel("PopUrbana.xlsx", sheet = "Period2")
read_excel("PopUrbana.xlsx", sheet = 3)
read_excel("PopUrbana.xlsx", sheet = 4)

# Importing a worksheet to a dataframe
df <- read_excel("PopUrbana.xlsx", sheet = 3)
View(df)

# Importing all worksheets
df_todas <- lapply(excel_sheets("PopUrbana.xlsx"), read_excel, path = 'PopUrbana.xlsx')
class(df_todas)
View(df_todas)
