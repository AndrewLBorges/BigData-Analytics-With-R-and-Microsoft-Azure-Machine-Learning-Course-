setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap04")
getwd()

# Defining data
set.seed(67)
x = rnorm(10, 5, 7)
y = rpois(10, 7)
z = rnorm(10, 6, 7)
t = rpois(10, 9)

# Creating plot
plot(x, y, col = 123, pch = 10, main = "Multi Scatterplot",
     col.main = "red", cex.main = 1.5, xlab = "Variável Independente",
     ylab = "Variável Dependente")

# Adding other data
points(z, t, col = "blue", pch = 4)

# More data
points(y, t, col = 777, pch = 9)

# Creating a subtitle
legend(-6, 5.9, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10,4,9),
       cex = 0.65, bty = "n")