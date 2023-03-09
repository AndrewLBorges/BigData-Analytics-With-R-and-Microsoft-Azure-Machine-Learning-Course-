# Feature Selection

# Este código contém comandos para feature selection

# Este código foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. 
# Se o valor for FALSE, o codigo será executado no RStudio

# Variável que controla a execução do script
Azure <- FALSE

if(Azure){
  source("src/Tools.R")
  bikes <- maml.mapInputPort(1)
  bikes$dteday <- set.asPOSIXct(bikes)
}else{
  bikes <- bikes
}

dim(bikes)
any(is.na(bikes))

# Criando um modelo para identificar os atributos com maior importância para o modelo preditivo
require(randomForest)

# Avaliando a importância de todas as variaveis
modelo <- randomForest(cnt ~ .,
                       data = bikes,
                       ntree = 100,
                       nodesize = 10,
                       importance = TRUE)

# Removendo variáveis colineares
modelo <- randomForest(cnt ~ . - mnth
                       - hr
                       - workingday
                       - isWorking
                       - dayWeek
                       - xformHr
                       - workTime
                       - holiday
                       - windspeed
                       - monthCount
                       - weathersit,
                       data = bikes,
                       ntree = 100,
                       nodesize = 10,
                       importance = TRUE)

# Plotando as variáveis por grau de importância
varImpPlot(modelo);


# Gravando o resultado
df_saida <- bikes[, c("cnt", rownames(modelo$importance))]

if(Azure) maml.mapOutputPort("df_saida")