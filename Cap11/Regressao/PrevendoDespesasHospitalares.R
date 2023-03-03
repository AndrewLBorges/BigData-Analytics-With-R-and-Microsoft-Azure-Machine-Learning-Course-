# Machine Learning - Regressão
# Prevendo Despesas Hospitalares

# Problema de Negócio: Previsão de Despesas Hospitalares

# Para esta análise, vamos usar um conjunto de dados simulando despesas médicas hipotéticas
# para um conjunto de pacientes espalhados por 4 regióes do Brasil.
# Esse dataset possui 1.338 observações e 7 variáveis.

# Etapa 1 - COletando os dados
despesas <- read.csv("despesas.csv")
View(despesas)

# Etapa 2 - Explorando e Preparando os Dados
# Visualizando as variáveis
str(despesas)

# Medidas de tendência central da variável gastos
summary(despesas$gastos)

# COnstruindo um histograma
hist(despesas$gastos, main = "Histograma", xlab = "Gastos")

# Tabela de contingência das regiões
table(despesas$regiao)

# Explorando relacionamento entre as variáveis: Matriz de Correlação
cor(despesas[c("idade", "bmi", "filhos", "gastos")])

# Nenhuma das correlações na matriz são consideradas fortes, mas existem algumas associações interessantes.
# Por exemplo, a idade e o bmi(IMC) parecem ter uma correlação positiva fraca, o que siginifica que
# com o aumento da idade, a massa corporal tende a aumentar. Há também uma correlação positiva
# moderada entre a idade e os gastos, além do número de filhos e os gastos. Estas associações implicam
# que, à medida que idade, massa corporal e número de filhos aumenta, o custo esperado do seguro saúde sobe.

# Visualizando relacionamento entre as variáveis: Scatterplot
# Perceba que não existe um claro relacionamento entre as variáveis
pairs(despesas[c("idade", "bmi", "filhos", "gastos")])

# Scatterplot Matrix
install.packages("psych")
library(psych)

# Este gráfico fornece mais informações sobre o relacionamento entre as variáveis
pairs.panels(despesas[c("idade", "bmi", "filhos", "gastos")])

# Etapa 3: Treinando o Modelo
modelo <- lm(gastos ~ idade + filhos + bmi + sexo + fumante + regiao, data = despesas)

# Similar ao item anterior
modelo <- lm(gastos ~ ., data = despesas)

# Visualizando os coeficientes
modelo

# Prevendo despesas médicas
?predict

# Aqui verificamos os gastos previstos pelo modelo que devem ser iguais aos dados de treino
previsao <- predict(modelo)
class(previsao)
View(previsao)

# Prevendo os gastos com Dados de teste
despesasTeste <- read.csv("despesas-teste.csv")
View(despesasTeste)
previsao2 <- predict(modelo, despesasTeste)
View(previsao2)

# Etapa 4: Avaliando a Performance do Modelo
# Mais detalhes sobre o modelo
summary(modelo)


# Equação de Regressão
# y = a + bx (simples)
# y = a + b0x0 + b1x1...(múltipla)

# Resíduos
# Diferença entre os valores observados de uma variável e seus valores previstos
# Seus resíduos devem se parecer com uma distribuição normal, o que indica
# que a média entre os valores previstos e os valores observados é próxima de 0 (o que é bom)

# Coeficiente - Intercept - a (alfa)
# Valor de a na equação de regressão

# Coeficientes - Nomes das variáveis - b (beta)
# Valor de b na equação de regressão

# Obs: A questão é que lm() ou summary() têm diferentes convenções de
# rotulagem para cada variável explicativa.
# Em vez de escrever slope_1, slope_2, ...
# Eles simplesmente usam o nome da variável em qualquer saída para
# indicar quais coeficientes pertencem a qual variável

# Erro Padrão 
# Medida de variabilidade na estimativa do coeficiente a (alfa), O ideal é que este valor
# seja menor que o valor do coeficiente, mas nem sempre isso irá ocorrer.

# Asteriscos
# OS asteriscors representam os níveis de significância de acordo com o p-value
# QUanto mais estrelas, maior a significância.
# atenção --> Muitos asteriscos indicam que é improvável que não exista
# relacionamento entre as variáveis.

# Valor t
# Define se coeficiente da variável é significativo ou não para o modelo.
# Ele é usado apra calcular o p-value e os níveis de significãncia.

# p-value
# O p-value representa a probabilidade que a variável não seja relevante.
# Deve ser o menor valor possível.
# Se este valor for realmente pequeno, o R irá mostrar o valor
# como notação científica.

# Significância
# São aquelas legendas próximas as suas variáveis.
# Espaço em branco - ruim
# Pontos - razoável
# Asteriscos - bom
# Muitos asteriscos - muito bom

# Residual Standard Error
# Este valor representa o desvio padrão dos resíduos

# Degrees of Freedom
# É a diferença entre o número de observações na amostra de treinamento 
# e o número de variáveis no seu modelo

# R-squared (coeficiente de determinação - R²)
# Ajuda a avaliar o nível de precisão do nosso modelo. Quant maior, melhor,
# sendo 1 o valor ideal.

# F-statistics
# É o teste F do modelo. Esse teste obtém os parâmetros do nosso modelo 
# e compara com um modelo que tenha menos parâmetros.
# Em teoria, um modelo com mais parãmetros tem um desempenho melhor. 

# Se o seu com mais parâmetros NÃO tiver performance
# melhor que um modelo com menos parâmetros, o valor do p-value será bem alto.

# Se o modelo com mais parâmetros tiver performance
# melhor que um modelo com menos parâmetros, o valor do p-value será mais baixo.

# Lembre que correlação não implica causalidade


# Etapa 5 - Otimizando a Performance do Modelo

# Adicionando uma variável com o dobro do valor das idades
despesas$idade2 <- despesas$idade ^ 2

# Adicionando um indicador para BMI >=30
despesas$bmi30 <- ifelse(despesas$bmi >= 30, 1, 0)

# Criando o modelo final
modelo_v2 <- lm(gastos ~ idade + idade2 + filhos + bmi + sexo +
                  bmi30 * fumante + regiao, data = despesas)

summary(modelo_v2)

# Dados de teste
despesasteste <- read.csv("despesas-teste.csv")
View(despesasteste)

despesasteste$idade2 <- despesasteste$idade ^ 2
despesasteste$bmi30 <- ifelse(despesasteste$bmi >= 30, 1, 0)
View(despesasteste)

previsao <- predict(modelo_v2, despesasteste)
class(previsao)
View(previsao)
