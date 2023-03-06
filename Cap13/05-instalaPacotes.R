# Este código contém comandos para instalar pacotes no Azure ML
# Este código foi criado para executar tanto no Azure quanto no RStudio.
# Para executar no Azure, altere o valor da vriavel Azure para TRUE. Se o valor for FALSE, o codigo funcionara no RStudio

# Variavel que controla a execução do script
Azure <- TRUE

if(Azure){
  # Instala o pacote tidyr e as dependências tibble e rlang a partir do arquivo zip
  install.packages("src/rlang_1.0.6.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/tibble_3.1.8.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/tidyr_1.3.0.zip", lib = ".", repos = NULL, verbose = TRUE)
  
  require(tibble, lib.loc = ".")
  require(rlang, lib.loc = ".")
  require(tidyr, lib.loc = ".")
}else{
  install.packages("tidyr")
  require(tidyr)
}

if(Azure) maml.mapOutputPort("dataset")