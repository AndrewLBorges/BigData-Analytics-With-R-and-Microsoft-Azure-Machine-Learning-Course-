setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap06")
getwd()

install.packages('RMySQL')
install.packages("dbplyr")

library(RMySQL)
library(ggplot2)
library(dbplyr)

# Connecting to the db
?dbConnect
con = dbConnect(MySQL(), user = "root", "1234", dbname = "titanicDB", host = "localhost")

# Querying
qry <- "select pclass, survived, avg(age) as media_idade from titanic where survived = 1 group by pclass, survived;"
dbGetQuery(con, qry)

# Plotting 
dados <- dbGetQuery(con, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = "identity")

# Connecting with dplyr
?tbl()
con2 <- src_mysql(dbname = "titanicdb", user = "root", password = "1234", host = "localhost")

# Collecting and grouping
dados2 <- con2 %>%
    tbl("titanic") %>%
    select(pclass, sex, age, survived, fare) %>%
    filter(survived == 0) %>%
    collect()
head(dados2)

# Manipulating
dados2 <- con2 %>%
  tbl("titanic") %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect()

View(dados2)

# plotting
ggplot(dados2, aes(pclass, survival_ratio, color = sex, group = sex)) +
  geom_point(size = 3) + geom_line()

# Summarising 
dados2 <- con2 %>%
  tbl("titanic") %>%
  filter(fare > 150) %>%
  select(pclass, sex, age, fare) %>%
  group_by(pclass, sex) %>%
  summarise(avg_age = avg(age),
            avg_fare = avg(fare))
head(dados2)

# for other rdbms, use RODBC