setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap04")
getwd()

?barplot

# preparing data - number of marriages on a particular church(not real)
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
dados

# Naming rows and columns
colnames(dados) <- c("0", "1-150", "151-300", ">300")
rownames(dados) <- c("Jovem", "Adulto", "Idoso")
dados

# Building the barplot
barplot(dados, beside = T)

# Building the plot - stacked bar plot
# the age brackets are represented in the same column for different amounts
barplot(dados, col = c("steelblue1", "tan3", "seagreen3"))

# Creating a legend 
?legend
legend("topright", pch = 16, legend = c("Jovem", "Adulto", "Idoso"),
       col = c("steelblue1", "tan3", "seagreen3"))

colors()

# now a column for each age bracket but whitin the same amount bracket
barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"))
legend("topright", pch = 16, legend = c("Jovem", "Adulto", "Idoso"),
       col = c("steelblue1", "tan3", "seagreen3"))

# with the transposed matrix we invert the positions among the brackets
barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"))
legend("topright", pch = 16, legend = c("0", "1-150", "151-300", ">300"),
       col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"))