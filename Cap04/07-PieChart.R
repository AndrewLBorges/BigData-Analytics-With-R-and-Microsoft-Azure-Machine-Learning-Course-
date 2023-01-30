setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap04")
getwd()

?pie

# creating slices
fatias = c(40, 20, 40)

# naming the labels
paises = c("Brasil", "Argentina", "Chile")

# concatenating labels and slices
?paste
paises = paste(paises, fatias)

# Including more details
paises = paste(paises, "%", sep = "")

colors()

# Creating the plot
pie(fatias, labels = paises,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"),
    main = "Distribuição de Vendas")

# Working with dataframes
?iris
attach(iris)
?table
Values = table(Species)
Values
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies")

# 3D
install.packages("plotrix")
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.05,
      col = c("steelblue1", "tomato2", "tan3"),
      main = "Distribuição de Vendas")