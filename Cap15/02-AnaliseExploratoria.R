# Análise Exploratória de Dados

# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio

# Variável que controla a execução do script
Azure <- FALSE

if(Azure){
  source("src/ClassTools.R")
  Credit <- maml.mapInputPort(1)
}

# Plots usando ggplot2
library(ggplot2)
lapply(colNames2, function(x){
  if(is.factor(Credit[, x])){
    ggplot(Credit, aes_string(x)) +
      geom_bar() +
      facet_grid(. ~ CreditStatus) +
      ggtitle(paste("Total de Credito Bom/Ruim por", x))
  }
})

# Plots CreditStatus vs CHeckingAcctStat
lapply(colNames2, function(x){
  if(is.factor(Credit[, x]) & x != "CheckingAcctStat"){
    ggplot(Credit, aes(CheckingAcctStat)) +
      geom_bar() +
      facet_grid(paste(x, " ~ CreditStatus")) +
      ggtitle(paste("Total de Credito Bom/Ruim CheckingAcctStat e", x))
}})