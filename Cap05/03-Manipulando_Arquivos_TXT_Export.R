setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap05")
getwd()

?read.table
?write.table

write.table(mtcars, file = "mtcars.txt")
dir()

df_matcars <- read.table("mtcars.txt")
View(df_matcars)
dim(df_matcars)

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()

df_mtcars2 <- read.table("mtcars2.txt")
View(df_mtcars2)

df_mtcars2 <- read.table("mtcars2.txt", sep = '|')
View(df_mtcars2)

df_mtcars2 <- read.table("mtcars2.txt", sep = '|', header = TRUE, encoding = 'UTF-8')
View(df_mtcars2)
View(mtcars)
