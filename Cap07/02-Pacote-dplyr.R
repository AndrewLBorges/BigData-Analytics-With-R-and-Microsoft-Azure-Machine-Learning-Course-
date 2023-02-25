setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap07")
getwd()

install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)

sono_df <- read_csv("sono.csv")
View(sono_df)
head(sono_df)
class(sono_df)
str(sono_df)

glimpse(sono_df)

# Mutanting
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))

# Counting and histogram
count(sono_df, cidade)
hist(sono_df$sono_total)

# Sampling
sample_n(sono_df, size = 10)

# selecting
sleepData <- select(sono_df, nome, sono_total)
head(sleepData)
class(sleepData)
select(sono_df, nome)
select(sono_df, nome:cidade)
select(sono_df, nome:pais)

# filtering
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >= 80)
filter(sono_df, cidade %in% c("Recife", "Curitiba"))

# Arange
sono_df %>% arrange(cidade) %>% head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  head

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >= 16)

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >= 16)

# Mutate
head(sono_df)
sono_df %>%
  mutate(novo_indice = sono_total / peso) %>%
  head
head(sono_df)

# summarize
sono_df %>%
  summarise(media_sono = mean(sono_total))

sono_df %>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# group_by
sono_df %>%
  group_by(cidade) %>%
  summarise(avg_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# %>% operator
head(select(sono_df, nome, sono_total))

sono_df %>%
  select(nome, sono_total) %>%
  head

sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

sono_df
