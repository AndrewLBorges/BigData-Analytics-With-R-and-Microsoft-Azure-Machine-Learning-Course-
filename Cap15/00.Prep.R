# Script para checar as colunas do Dataset

# Carrega o dataset antes da transformação
df <- read.csv("credito.csv", stringsAsFactors = TRUE) # certificar de colocar o parametro se quiser que os fatores sejam identificados
View(df)
str(df)

# Nome das Variáveis
# CheckingAcctStat, Duration, CreditHistory, Purpose, CreditAmount, SavingsBonds, Employment, InstallmentRatePecnt, SexAndStatus, OtherDetorsGuarantors, PresentResidenceTime, Property, Age, OtherInstallments, Housing, ExistingCreditsAtBank, Job, NumberDependents, Telephone, ForeignWorker, CreditStatus