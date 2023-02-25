setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap07")
getwd()

install.packages("tidyr")
library(tidyr)
library(ggplot2)

dados <- data.frame(
  Nome = c("Geografia", "Literatura", "Biologia"),
  Regiao_A = c(97, 80, 84),
  Regiao_B = c(86, 90, 91)
)
dados

dados %>%
  gather(Regiao, NotaFinal, Regiao_A:Regiao_B)

set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

df2

# reshape 1
?gather
df2_organizado1 <- df2 %>%
  gather(key, time, -id, -acao)
df2_organizado1 %>% head(8)

# pivot_longer intead of gather

?pivot_longer
df2_organizado1 <- df2 %>% pivot_longer(c(-id, -acao), names_to = "key", values_to = "time")
df2_organizado1 %>% head(8)

# reshape 2
?separate
df2_organizado2 <- df2_organizado1 %>%
  separate(key, into = c("localidade", "tempo"), sep = "\\.")
df2_organizado2 %>% head(8)

# separate_wider_** instead of separate

?separate_wider_position
df2_organizado2 <- df2_organizado1 %>%
  separate_wider_delim(key, delim = ".", names = c("localidade", "tempo"))
df2_organizado2 %>% head(8)

# another example
set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"),
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15),
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

print(df3)

# reshape
df3 %>%
  gather(day, score, c(day1score, day2score))

?spread
df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  spread(day, score)

# pivot_wider insted of spread
?pivot_wider
df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  pivot_wider(names_from = day, values_from = score)

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2)

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate_wider_position(info, c(group = 2, gender = 1))

?unite
df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  unite(infoAgain, group, gender)

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) +
  geom_point() +
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)
