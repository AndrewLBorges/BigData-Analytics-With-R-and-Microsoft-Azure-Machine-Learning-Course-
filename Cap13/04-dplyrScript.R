# Este código contém comandos para filtrar e plotar os dados de aluguel de bikes.
# dados que estão em nosso dataset.
# Este código foi criado para executar tanto no Azure quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE.
# Se o valor for FALSE, o codigo sera executado no RStudio.

# Variável que controla a execução do script
Azure = FALSE

if(Azure){
  restaurantes <- maml.mapInputPort(1)
  ratings <- maml.mapInputPort(2)
}else{
  restaurantes <- read.csv("datasets/Restaurant-features.csv", sep = ",", header = T, stringsAsFactors = F)
  ratings <- read.csv("datasets/Restaurant-ratings.csv", sep = ",", header = T, stringsAsFactors = F)
}

restaurantes <- restaurantes[restaurantes$franchise == 'f' & restaurantes$alcohol != 'No_Alcohol_Served', ]

require(dplyr)
df <- as.data.frame(restaurantes %>%
                      inner_join(ratings, by = 'placeID') %>%
                      select(name, rating) %>%
                      group_by(name) %>%
                      summarize(ave_Rating = mean(rating)) %>%
                      arrange(desc(ave_Rating)))
df

if(Azure) maml.mapOutputPort("df")