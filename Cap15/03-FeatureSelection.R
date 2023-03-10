# Feature Selection (Seleção de Variáveis)

# Este código foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. 
# Se o valor for FALSE, o código sera executado no RStudio

# Variavel que controla a execucao do script
Azure <- FALSE

if(Azure){
  source("src/ClassTools.R")
  Credit <- maml.mapInputPort(1)
}

# Modelo randomForest para criar um plot de importãncia das variáveis
library(randomForest)
modelo <- randomForest(CreditStatus ~ .
                       - Duration
                       - Age
                       - CreditAmount
                       - ForeignWorker
                       - NumberDependents
                       - Telephone
                       - ExistingCreditsAtBank
                       - PresentResidenceTime
                       - Job
                       - Housing
                       - SexAndStatus
                       - InstallmentRatePecnt
                       - OtherDetorsGuarantors
                       - Age_f
                       - OtherInstalments,
                       data = Credit,
                       ntree = 100, nodesize = 10, importante = T)

varImpPlot(modelo)

outFrame <- serList(list(credit.model = modelo))

# Output
if(Azure) maml.mapOutputPort("outFrame")