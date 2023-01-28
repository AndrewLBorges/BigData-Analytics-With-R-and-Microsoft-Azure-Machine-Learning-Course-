setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\Cap04")
getwd()

# Lists the base R packages
search()

# Demo
demo("graphics")

# Basic plot
x = 5:7
y = 8:10
plot(x, y)
?plot

altura <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)

plot(altura, largura)

# plotting a dataframe
?lynx
plot(lynx)
plot(lynx, ylab = "Plots com Dataframes", xlab =  "")
plot(lynx, ylab = "Plots com Dataframes", xlab = "Observacoes")
plot(lynx, main = "Plots com Dataframes", col = 'red')
plot(lynx, main = "Plots com Dataframes", col = 'red', col.main = 52, cex.main = 1.5)

library(datasets)
hist(warpbreaks$breaks)

airquality
transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")
?formula
class(fo <- y ~ x1 * x2)
fo
typeof(fo)
term(fo)

# Specifying some parameters
# col - plot color
# lty - line type
# lwd - line width
# pch - plot symbol
# xlab - x axis label
# ylab - y axis label
# las - axis labels orientation
# bg - background color
# mfrow - plots per line
# mfcol - plots per column

# Basic plotting functions

# plot() - scatterplots
# lines() - adds lines/rows
# points() - adds points
# text() - adds labels
# title() - adds a title

?par
par()
par('pch')
par('lty')

x = 2:4
plot(x, pch = "c")

par(mfrow = c(2,2), col.axis = "red")
plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")
legend("topright", pch = 1, col = c("blue", "red"), legend = c("Var1", "Var2"))
par(mfrow = c(1,1))

# Available colors
colors()

# Saving graphs

# png
png("Grafico.png", width = 500, height = 500, res = 72)

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gráfico gerado a partir do Iris")
dev.off()

# pdf
pdf("Grafico.pdf")

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gráfico gerado a partir do Iris")
dev.off()

# extending plotting functons
install.packages('plotrix')
library(plotrix)
?plotrix

par(mfrow = c(1,1), col.axis = "red")