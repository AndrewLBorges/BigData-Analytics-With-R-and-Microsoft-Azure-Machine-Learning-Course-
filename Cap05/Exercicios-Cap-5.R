# Solução Lista de Exercícios - Capítulo 5 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
View(mtcars)


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
?col_double
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))
View(df_iris)


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

hist(dataset1, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="height", 
     ylab="nbr of plants", main="distribution of height of 2 durum wheat varieties")
hist(dataset2, breaks=30, xlim=c(0,300), col=rgb(0,0,1,0.5), add=T)
legend("topright", legend = c("Dataset 1", "Dataset 2"), col=c(rgb(1,0,0,0.5),
                                                               rgb(0,0,1,0.5)), pt.cex = 2, pch=15)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)
?plot_ly

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
head(volcano)
View(volcano)

p = plot_ly(z = volcano, type = "surface")
p

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
library(rjson)
??json
result <- fromJSON(file = "input.json")
print(result)
class(result)

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
json_data_frame <- as.data.frame(result)
head(json_data_frame)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
??xml
install.packages("XML")
library(XML)
library(methods)

result <- xmlParse(file = "input.xml")
print(result)
class(result)

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe

xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)
View(xmldataframe)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
file_csv <- read_csv("input.csv")
View(file_csv)
summary(file_csv)
str(file_csv)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
print(is.data.frame(file_csv))
dim(file_csv)
ncol(file_csv)
nrow(file_csv)

# Pergunta 2 - Qual o maior salário?
max_salary <- max(file_csv$salary)
max_salary

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
file_csv[file_csv$salary == max(file_csv$salary), ]
#or
subset(file_csv, salary == max(salary))

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
file_csv[file_csv$dept == "IT", ]$name
#or
subset(file_csv, dept == "IT")

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
file_csv[file_csv$dept == "IT" & file_csv$salary > 600, ]$name
#or
subset(file_csv, dept == "IT" & salary > 600)
