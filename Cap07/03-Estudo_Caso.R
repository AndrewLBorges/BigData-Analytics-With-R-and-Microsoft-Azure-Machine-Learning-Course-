setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap07")
getwd()

install.packages("hflights")
library(hflights)
library(dplyr)
?hflights

?tbl_df
flights <- tbl_df(hflights)
flights <- as_tibble(hflights) #tbl_df is deprecated
flights
class(flights)

str(hflights)
glimpse(hflights)

data.frame(head(flights))

# filtering with slices
flights[flights$Month == 1 & flights$DayofMonth == 1, ]

# filtering with filter function
filter(flights, Month == 1, DayofMonth == 1)
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))

# select
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

# Organizing
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

?with
?tapply
head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))
head(aggregate(ArrDelay ~ Dest, flights, mean))

?tally
flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = TRUE)
