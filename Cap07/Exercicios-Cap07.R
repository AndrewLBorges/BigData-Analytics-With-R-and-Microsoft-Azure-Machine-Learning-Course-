# Solução Lista de Exercícios - Capítulo 7 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Formatando os dados de uma página web
library(rvest)
library(stringr)
library(tidyr)

# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I
pagina <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")
pagina

# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"
previsao <- html_elements(pagina, "#detailed-forecast-body b , .forecast-text")
previsao

# Exercício 3 - Transforme o item anterior em texto
texto <- html_text(previsao)
paste(texto, collapse = " ")

# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
pagina <- read_html(url)
tabela <- html_elements(pagina, 'table')
class(tabela)

# Exercício 5 - Converta o item anterior em um dataframe
html_table(tabela)
tab <- html_table(tabela)[[1]]
class(tab)
head(tab)

# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
tab <- tab[-(1:2), ]
head(tab)
names(tab) <- c("number", "date", "site", "result")
head(tab)

# Exercício 7 - Converta de algarismos romanos para números inteiros
tab$number <- 1:57
tab$date <- as.Date(tab$date, "%B. %d, %Y")
head(tab)
tail(tab)

# Exercício 8 - Divida as colunas em 4 colunas
tab <- separate(tab, result, c('winner', 'loser'), sep = ', ', remove = TRUE)
head(tab)

# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas
pattern <- " \\d+$"
tab$winnerPoints <- as.numeric(str_extract(tab$winner, pattern))
tab$loserPoints <- as.numeric((str_extract(tab$loser, pattern)))
tab$winner <- gsub(pattern, "", tab$winner)
tab$loser <- gsub(pattern, "", tab$loser)
head(tab)
View(tab)

# Exercício 10 - Grave o resultado em um arquivo csv
write.csv(tab, 'superbowl.csv', row.names = F)

