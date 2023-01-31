setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

# Loading packages
library(dplyr)
library(arules)
library(arulesViz)
library(htmlwidgets)
library(writexl)

options(warn = -1)

# loading and exploring the data
dados <- read.csv("dataset_bd3.csv")
dim(dados)
View(dados)
summary(dados)
str(dados)

# a smart way of solving the problem in the dataset
# separate the odd rows from the evens
linhas_pares <- seq(2, nrow(dados), 2)
linhas_impares <- seq(1, nrow(dados), 2)

# We will be using the dataset that has the even rows(valid data)
df1 <- dados[linhas_pares, ]
View(df1)

df2 <- dados[linhas_impares, ]
View(df2)

# checking if we have na on the first item
sum(is.na(df1$Item01))
View(df1)

# checking if we have na on the second item (attention!)
sum(is.na(df1$Item02))
View(df1)

# checking if we have na values represented by spaces
which(nchar(trimws(df1$Item01)) == 0)
which(nchar(trimws(df1$Item02)) == 0)

# same thing using Regex
grepl("^\\s*$", df1$Item02)

# Distinct items
n_distinct(df1)

# working only with the values where item02 is not null
df1_two <- df1[!grepl("^\\s*$", df1$Item02), ]

n_distinct(df1_two)

# preparing the package converting the variables to factor
View(df1_two)
pacote <- df1_two
pacote$Item01 <- as.factor(pacote$Item01)
pacote$Item02 <- as.factor(pacote$Item02)
pacote$Item03 <- as.factor(pacote$Item03)
pacote$Item04 <- as.factor(pacote$Item04)
pacote$Item05 <- as.factor(pacote$Item05)
pacote$Item06 <- as.factor(pacote$Item06)
summary(pacote)
View(pacote)
str(pacote)

?split

pacote_split <- split(pacote$Item01,
                      pacote$Item02,
                      pacote$Item03,
                      pacote$Item04,
                      pacote$Item05,
                      pacote$Item06,
                      drop = FALSE)
View(pacote_split)

# transactions
?as
transacoes <- as(pacote_split, "transactions")
class(transacoes)

# rule inspection
?inspect
inspect(head(transacoes, 5))

# lets check the rules of a product: Dust-Off Compressed Gas 2 pack
?apriori
regras_produto1 <- apriori(transacoes,
                           parameter = list(conf = 0.5, minlen = 3),
                           appearance = list(rhs = "Dust-Off Compressed Gas 2 pack", default = "lhs"))

# rule inspection
inspect(head(sort(regras_produto1, by = "confidence"), 5))

# check the rules of another product: HP 61 ink
regras_produto2 <- apriori(transacoes,
                           parameter = list(minlen = 3, conf = 0.5),
                           appearance = list(rhs = "HP 61 ink", default = "lhs"))

#rule inspection
inspect(head(sort(regras_produto2, by = "confidence"), 5))

# check the rules of another product: VIVO Dual LCD Monitor Desk mount
regras_produto3 <- apriori(transacoes,
                           parameter = list(minlen = 3, conf = 0.5),
                           appearance = list(rhs = "VIVO Dual LCD Monitor Desk mount", default = "lhs"))

# rule inspection
inspect(head(sort(regras_produto3, by = "confidence"), 5))

# checking rules but changing metrics
regras_produto1 <- apriori(transacoes,
                           parameter = list(conf = 0.5, minlen = 3, sup = 0.2, target = "rules"),
                           appearance = list(rhs = "Dust-Off Compressed Gas 2 pack", default = "lhs"))

# Inspecting
inspect(head(sort(regras_produto1, by = "confidence"), 5))

# filtering redundancies
regras_produto1_clean <- regras_produto1[!is.redundant(regras_produto1)]

inspect(head(sort(regras_produto1_clean, by = "confidence"), 5))

summary(regras_produto1_clean)

plot(regras_produto1_clean, measure = "support", shading = "confidence", 
     method = "graph", engine = "html")

# same for the second product
regras_produto2 <- apriori(transacoes,
                           parameter = list(minlen = 3, supp = 0.2, conf = 0.5, target = "rules"),
                           appearance = list(rhs = "HP 61 ink", default = "lhs"))


inspect(head(sort(regras_produto2, by = "confidence"), 5))

regras_produto2_clean <- regras_produto2[!is.redundant(regras_produto2)]

inspect(head(sort(regras_produto2_clean, by = "confidence"), 5))

summary(regras_produto2_clean)

# Plot
plot(regras_produto2_clean, measure = "support", shading = "confidence", 
     method = "graph", engine = "html")

# and for the last product
regras_produto3 <- apriori(transacoes,
                           parameter = list(minlen = 3, supp = 0.2, conf = 0.5, target = "rules"),
                           appearance = list(rhs = "VIVO Dual LCD Monitor Desk mount", default = "lhs"))

inspect(head(sort(regras_produto3, by = "confidence"), 5))

regras_produto3_clean <- regras_produto3[!is.redundant(regras_produto3)]

inspect(head(sort(regras_produto3_clean, by = "confidence"), 5))

summary(regras_produto3_clean)

# Plot
plot(regras_produto3_clean, measure = "support", shading = "confidence", 
     method = "graph", engine = "html")

# Top 3 rules
inspect(head(sort(regras_produto1_clean, by = "support", decreasing = TRUE), 1))
inspect(head(sort(regras_produto2_clean, by = "confidence", decreasing = TRUE), 1))
inspect(head(sort(regras_produto3_clean, by = "confidence", decreasing = TRUE), 1))

# saving the rules as dataframes and storing them on disk
View(regras_produto1_clean)
df_produto1 <- as(regras_produto1_clean, "data.frame")
View(df_produto1)
write_xlsx(df_produto1, "df_produto1.xlsx")

df_produto2 <- as(regras_produto2_clean, "data.frame")
View(df_produto2)
write_xlsx(df_produto2, "df_produto2.xlsx")

df_produto3 <- as(regras_produto3_clean, "data.frame")
View(df_produto3)
write_xlsx(df_produto3, "df_produto3.xlsx")
