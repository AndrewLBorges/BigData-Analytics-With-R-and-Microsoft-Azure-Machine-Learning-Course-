setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap06")
getwd()

# package installs
install.packages("tidyverse")
install.packages("rfm")
install.packages("factoextra")

# Imports
library(tidyverse)
library(dplyr)
library(ggplot2)
library(caret)
library(plotly)
library(readxl)
library(rfm)
library(stats)
library(factoextra)

# function to load data from excel sheets
carrega_dados <- function()
{
  setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-with-R--Intro-to-R-with-mini-Projects\\Cap06")
  sheet1 <- read_excel('online_retail_II.xlsx', sheet = 'Year 2009-2010')
  sheet2 <- read_excel('online_retail_II.xlsx', sheet = 'Year 2010-2011')
  dados_combinados <- rbind(sheet1, sheet2)
  return(dados_combinados)
}

dados <- carrega_dados()
dim(dados)
View(dados)

# checking for na
verifica_missing <- function(x)
{
  return(colSums(is.na(x)))
}

verifica_missing(dados)

# we'll delete na values

?grep
# Function to clean and preprocess data
preprocessa_dados <- function(data1)
{
  data1$TotalPrice <- data1$Quantity * data1$Price
  
  data1 <- na.omit(data1)
  
  data1 <- data1[!grepl("C", data1$Invoice),]
  
  return(data1)
}

dataset <- preprocessa_dados(dados)
View(dataset)
dim(dataset)
max(dataset$TotalPrice)

# checking distribution of Total Price variable
ggplot(dataset,
       aes(x = TotalPrice), max) +
  geom_density(fill = "#69b3a2", color = "#e9ecef", alpha = 3.5) +
  xlim(0, 300) +
  labs(title = 'Distribuição da Variável TotalPrice')

# Num of clients
length(dataset$`Customer ID`)
length(unique(dataset$`Customer ID`))

# total spent by customer
total_gasto <- dataset %>%
  group_by(`Customer ID`) %>%
  summarise(Sum = sum(TotalPrice))

View(total_gasto)

# Creating a customized date to calculate recency
View(dataset)
max(dataset$InvoiceDate)
date1 <- as.Date.character("25/12/2011", "%d/%m/%Y")
date1

# Formatting date
converte_data <- function(x)
{
  options(digits.secs = 3)
  return (as.Date(as.POSIXct(x$InvoiceDate, 'GMT')))
}

dataset$InvoiceDate <- converte_data(dataset)
View(dataset)

# function to calculate Recency, frequency and monetary value
calcula_rfm <- function(x)
{
  z <- x %>% group_by(`Customer ID`) %>%
    summarise(Recency = as.numeric(date1 - max(InvoiceDate)),
              Frequency = n(),
              Monetary = sum(TotalPrice),
              primeira_compra = min(InvoiceDate))
  
  # removing transactions with values above 3th Quantile and below 1st Quantile(outliers)
  Q1 <- quantile(z$Monetary, .25)
  Q3 <- quantile(z$Monetary, .75)
  IQR <- IQR(z$Monetary)
  z <- subset(z, z$Monetary >= (Q1 - 1.5*IQR) & z$Monetary <= (Q3 + 1.5*IQR))
  
  return(z)
}

valores_rfm <- calcula_rfm(dataset)
View(valores_rfm)

# Machine Learning - Kmeans Clustering
set.seed(1029)

# Function for client segmentation based on RFM values
segmenta_cliente <- function(rfm)
{
  resultados <- list()
  
  dados_rfm <- select(rfm, c('Recency', 'Frequency', 'Monetary'))
  
  modelo_kmeans <- kmeans(dados_rfm, center = 5, iter.max = 50)
  
  resultados$plot <- fviz_cluster(modelo_kmeans,
                                  data = dados_rfm,
                                  geom = c('point'),
                                  ellipse.type = 'euclid')
  
  dados_rfm$`Customer ID` <- rfm$`Customer ID`
  dados_rfm$clusters <- modelo_kmeans$cluster
  resultados$data <- dados_rfm
  
  return(resultados)
}

grafico <- segmenta_cliente(valores_rfm)[1]
grafico

tabela_rfm <- segmenta_cliente(valores_rfm)[2]
tabela_rfm
View(as.data.frame(tabela_rfm))
