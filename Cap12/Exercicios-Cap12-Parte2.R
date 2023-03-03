# Solução Lista de Exercícios - Capítulo 12

# Usaremos o dataset iris neste exemplo
# O dataset iris possui observações de 3 especies de flores (Iris setosa, Iris virginica e Iris versicolor)
# Para cada flor, 4 medidas sao usadas: 
# comprimento (length) e largura (width) do caule (sepal) e comprimento e largura da petala (petal)
library(datasets)
head(iris)

# Análise exploratoria de dados com ggplot2
library(ggplot2)

# Veja que os dados claramente possui grupos com caracteristcas similares
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point(size = 3)

# Agora usarmeos o K-Means para tentar agrupar os dados em clusters
set.seed(101)
help(kmeans)

# Exercício 1 - Usando a função kmeans(), crie um modelo de clustering (aprendizagem não supervisionada). Use a documentação, para fazer sua pesquisa.
# Neste caso, ja sabemos quantos grupos (clusters) existem em nossos dados (3)
# Perceba que o dataset iris possui 5 colunas, mas estamos usando as 4 primeiras
modelo_kmeans = kmeans(iris[, 1:4], centers = 3, nstart = 20)
summary(modelo_kmeans)
modelo_kmeans

# Obtendo informação sobre os clusters
# Foram criados 3 clusters: cluster 1, 2 e 3
# Perceba que apesar o algoritmo ter feito a divisão dos dados em clusters, houve problema em dividir alguns dos dados, 
# que apesar de terem caracteristicas diferentes, ficaram no mesmo cluster
table(modelo_kmeans$cluster, iris$Species)


# Visualizando os clusters
install.packages("cluster")
library(cluster)
help(clusplot)

# Plot
clusplot(iris, modelo_kmeans$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0, )




