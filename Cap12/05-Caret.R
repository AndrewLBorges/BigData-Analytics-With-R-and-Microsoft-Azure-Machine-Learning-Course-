# Instalando os pacotes
install.packages("caret")
install.packages("randomForest")

# Carregando os pacotes
library(caret)
library(randomForest)
library(datasets)

# Usando o dataset mtcars
View(mtcars)

# Funcao do Caret para divisao dos dados
?createDataPartition
split <- createDataPartition(y = mtcars$mpg, p = 0.7, list = FALSE)
split

# Criando dados de treino e teste
dados_treino <- mtcars[split, ]
dados_teste <- mtcars[-split, ]

# Treinando o modelo
?train
names(getModelInfo())

# Mostrando a importancia das variaveis para a criacao do modelo
?varImp

modelo_v1 <- train(mpg ~ ., data = dados_treino, method = "lm")
varImp(modelo_v1)

# Regessao linear
modelo_v1 <- train(mpg ~ wt + hp + qsec + drat, data = dados_treino, method = "lm")

# Random Forest
modelo_v2 <- train(mpg ~ wt + hp + qsec + drat, data = dados_treino, method = "rf")

# Resumo do modelo
summary(modelo_v1)
summary(modelo_v2)

# Ajustando o modelo
?expand.grid
?trainControl

controle1 <- trainControl(method = "cv", number = 10)

modelo_v3 <- train(mpg ~ wt + hp + qsec + drat,
                   data = dados_treino,
                   method = "lm",
                   trControl = controle1,
                   metric = "Rsquared")

# Resumo do modelo
summary(modelo_v3)

# COletando os residuos
residuals <- resid(modelo_v3)
residuals

# Previsoes
?predict
predictedValues <- predict(modelo_v1, dados_teste)
predictedValues
plot(dados_teste$mpg, predictedValues)

# Plot das variáveis mais relevantes no modelo
plot(varImp(modelo_v1))
