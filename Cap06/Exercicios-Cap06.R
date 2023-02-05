# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap06")
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages("RSQLite")
library(RSQLite)
library(dbplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "mamiferos.sqlite")

# or 
mamiferos <- dbConnect(SQLite(), "mamiferos.sqlite")

dbListTables(con)

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
?src_dbi
src_dbi(con)

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
query = "SELECT year, species_id, plot_id FROM surveys"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)

# or
dados <- tbl(con, sql("SELECT year, species_id, plot_id FROM surveys"))

View(dados)
class(dados)

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(dados)
str(dados)
typeof(dados)

# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
?tbl
pesquisas <- tbl(con, "surveys")
class(pesquisas)
pesquisas %>% 
  select(species_id, sex, weight) %>%
  filter(weight < 5)
  

# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
dados2 <- pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

dados3 <- as.data.frame(dados2)
View(dados3)
# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(con)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(con, "dados3", dados3)
dbRemoveTable(con, "dados3")
dbListTables(con)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior

tbl(con, "dados3")
dbReadTable(con, "dados3")
