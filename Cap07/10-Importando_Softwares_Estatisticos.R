# Installing the package
install.packages('haven')
library(haven)

# SAS
vendas <- read_sas("vendas.sas")
?read_sas
class(vendas)
print(vendas)
str(vendas)

# Stata
df_stata <- read_dta("mov.dta")
class(df_stata)
str(df_stata)

# Foreign Package
install.packages('foreign')
library(foreign)

florida <- read.dta("florida.dta")
tail(florida)
class(florida)

# SPSS
# http://cw.routledge.com/textbooks/9780415372985/resources/datasets.asp

dados <- read.spss("international.sav")
class(dados)
head(dados)
df <- data.frame(dados)
df
head(df)

# creating a boxplot
boxplot(df$gdp)

cor(df$gdp, df$f_illit)