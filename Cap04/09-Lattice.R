setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap04")
getwd()

install.packages('lattice')
library(lattice)

# ScatterPlot with lattice
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

# Barplots with Titanic dataset
?Titanic
View(Titanic)

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4,1),
         auto.key = list(title = "Dados Titanic", columns = 2))

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = "Dados Titanic", columns = 2),
         scales = list(x = "free"))

# element counting
?equal.count
PetalLength <- equal.count(iris$Petal.Length, 4)
PetalLength

# Scatterplots
xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris)

xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris,
       panel = function(...) {
         panel.grid(h = -1, v = -1, col.line = "skyblue")
         panel.xyplot(...)
       })

xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris,
       panel = function(x, y, ...) {
         panel.xyplot(x, y, ...)
         mylm <- lm(y ~ x)
         panel.abline(mylm)
       })

histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout = c(3,1), type = "density",
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")

# Data distribution
qqmath(~ Sepal.Length | Species, data = iris, distribution = qunif)

# Boxplot
bwplot(Species ~ Sepal.Length, data = iris)

# Violinplot
bwplot(Species ~ Sepal.Length, data = iris,
       panel = panel.violin)