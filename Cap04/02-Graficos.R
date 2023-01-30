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
plot(1:6, las = 3, xlab = "lty 1:6", ylab = "", main = "Mais opções ao plot")
ablineclip(v=1, lty=1, col="sienna2", lwd=2)
ablineclip(v=2, lty=1, col="sienna2", lwd=2)
ablineclip(v=3, lty=1, col="sienna2", lwd=2)
ablineclip(v=4, lty=1, col="sienna2", lwd=2)
ablineclip(v=5, lty=1, col="sienna2", lwd=2)
ablineclip(v=6, lty=1, col="sienna2", lwd=2)
ablineclip(v=7, lty=1, col="sienna2", lwd=2)

plot(lynx)
plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n")

# Two plots at once
par(mar = c(4,3,3,3), col.axis="black")

plot(cars$speed, type="s", col="red", bty="n", xlab="Cars ID", ylab="")
text(8, 14, "Velocidade", cex=0.85, col="red")
par(new=T)

plot(cars$dist, type="s", bty="n", ann=F, axes=F, col="darkblue")
axis(side=4)
text(37, 18, "Distância", cex=0.85, col="darkblue")

title(main="Velocidade x Distância")

# Plotting from datasets
df <- read.csv('pibpercap.csv', stringsAsFactors = F)
df_1982 <- subset(df, ano == 1982)
plot(expectativa ~ pibpercap, data = df_1982, log = "x")
View(df)

# Naming columns
mycol <- c(Asia = "tomato", Europe = "chocolate4", Africa = "dodgerblue2",
           Americas = "darkgoldenrod1", Oceania = "green4")

# Plot
plot(expectativa ~ pibpercap, data = df_1982, log = "x", col = mycol[continente])

# Function to scale
mycex <- function(var, r, f = sqrt){
  x = f(var)
  x_scaled = (x - min(x))/(max(x) - min(x))
  r[1] + x_scaled * (r[2] - r[1])
}

# Plot
plot(expectativa ~ pibpercap, data = df_1982, lox = "x",
     col = mycol[continente],
     cex = mycex(pop, r = c(0.2, 10)))