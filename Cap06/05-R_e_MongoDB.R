setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap06")
getwd()

library(ggplot2)
install.packages("devtools")
library(devtools)
install.packages("mongolite")
library(mongolite)

?mongolite

con <- mongo(collection = "airbnb",
             db = "dsadb",
             url = "mongodb://localhost",
             verbose = FALSE,
             options = ssl_options())

print(con)

dados <- con$find()
View(dados)

# counting number of documents on the db
con$count('{}')

# searching for a sample of data of property_type = House and its cancellation policies
amostra1 <- con$find(
  query = '{"property_type" : "House" }',
  fields = '{"property_type" : true, "cancellation_policy" : true }'
)
View(amostra1)

# Dont want the ID
amostra2 <- con$find(
  query = '{"property_type" : "House" }',
  fields = '{"property_type" : true, "cancellation_policy" : true, "_id" : false}'
)
View(amostra2)

# ordered result
amostra3 <- con$find(
  query = '{"property_type" : "House" }',
  fields = '{"property_type" : true, "cancellation_policy" : true, "_id" : false}',
  sort = '{"cancellation_policy" : -1}'
)
View(amostra3)

# aggregating the data to return de mean of reviews
amostra4 <- con$aggregate(
  '[{"$group" : {"_id" : "$property_type", "count": {"$sum": 1}, "average" : {"$avg" : "$number_of_reviews"}}}]',
  options = '{"allowDiskUse" : true}'
)
names(amostra4) <- c("tipo_propriedade", "contagem", "media_reviews")
View(amostra4)

# plotting the result
ggplot(aes(tipo_propriedade, contagem), data = amostra4) + geom_col()

# MapReduce - Mapping and Reducing

# counting the number of reviews considering all properties(houses)
resultado <- con$mapreduce(
  map = "function(){ emit(Math.floor(this.number_of_reviews), 1) }",
  reduce = "function(id, counts) { return Array.sum(counts) }"
)
names(resultado) <- c("numero_reviews", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

# Number of reviews by range considering all properties
resultado <- con$mapreduce(
  map = "function() { emit(Math.floor(this.number_of_reviews/100)*100, 1) }",
  reduce = "function(id, counts) { return Array.sum(counts) }"
)
names(resultado) <- c("numero_reviews", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_reviews, contagem), data = resultado) + geom_col()

# Counting number of rooms considering all properties
resultado <- con$mapreduce(
  map = "function() { emit(Math.floor(this.bedrooms), 1) }",
  reduce = "function(id, counts) { return Array.sum(counts) }"
)
names(resultado) <- c("numero_quartos", "contagem")
View(resultado)

# Plot
ggplot(aes(numero_quartos, contagem), data = resultado) + geom_col()
