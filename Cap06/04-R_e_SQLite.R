setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap06")
getwd()

install.packages("RSQLite")
library(RSQLite)

system("del exemplo.db")

drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")
dbListTables(con)

dbWriteTable(con, "mtcars", mtcars, row.names = TRUE)

dbListTables(con)
dbExistsTable(con, "mtcars")
dbExistsTable(con, "mtcars2")
dbListFields(con, "mtcars")

dbReadTable(con, "mtcars")

dbWriteTable(con, "mtcars2", mtcars[0, ], row.names = TRUE)
dbListTables(con)
dbReadTable(con, "mtcars2")

query = "select row_names from mtcars"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados
class(dados)

query = "select row_names from mtcars"
rs = dbSendQuery(con, query)
while (!dbHasCompleted(rs))
{
  dados = fetch(rs, n = 1)
  print(dados$row_names)
}

query = "select disp, hp from mtcars where disp > 160"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

query = "select row_names, avg(hp) from mtcars group by row_names"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

# Creating table from a file
dbWriteTable(con, "iris", "iris.csv", sep = ",", header = T)
dbListTables(con)
dbReadTable(con, "iris")

# Disconnect
dbDisconnect(con)

# Loading data
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")

dbWriteTable(con, "indices", "indice.csv",
             sep = "|", header = T)
dbRemoveTable(con, "indices")
dbWriteTable(con, "indices", "indice.csv",
             sep ="|", header = T)
dbListTables(con)
dbReadTable(con, "indices")

df <- dbReadTable(con, "indices")
df
str(df)
sapply(df, class)

hist(df$setembro)
df_mean <- unlist(lapply(df[, c(4, 5, 6, 7, 8)], mean))
df_mean
class(df_mean)

dbDisconnect(con)
