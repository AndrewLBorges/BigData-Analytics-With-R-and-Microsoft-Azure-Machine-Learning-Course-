setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\BigData-Analytics-With-R-and-Microsoft-Azure-Machine-Learning-Course-\\Cap04")
getwd()

# Installing and loading the package
install.packages("ggplot2")
library(ggplot2)

# Plotting a basic graph with qplot()
data(tips, package = 'reshape2')
qplot(total_bill, tip, data = tips, geom = "point")

# layer 1
camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = sex),
  data = tips,
  size = 3
)
ggplot() + camada1
?aes
??aes

# Building a regression model
modelo_base <- lm(tip ~ total_bill, data = tips)
modelo_fit <- data.frame(
  total_bill = tips$total_bill,
  predict(modelo_base, interval = "confidence")
)

head(modelo_fit)

# layer 2
camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit),
  data = modelo_fit,
  color = "darkred"
)
ggplot() + camada1 + camada2

# layer 3
camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.3
)
ggplot() + camada1 + camada2 + camada3

# final optimized version
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

# storing the graph in an object
myplot <- ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

class(myplot)
print(myplot)

# Scatterplot with regression line

# Data
data =  data.frame(cond = rep(c("Obs 1", "Obs 2"),
                              each = 10), var1 = 1:100 +
                              rnorm(100, sd = 9), var2 = 1:100 +
                              rnorm(100, sd = 16))

# Plot
ggplot(data, aes(x = var1, y = var2)) +
  geom_point(shape = 1) +
  geom_smooth(method = lm, color = "red", se = FALSE)

?lm

# Bar Plot

# Data
data = data.frame(grupo = c("A", "B", "C", "D"), 
                  valor = c(33,62,56,67), 
                  num_obs = c(100,500,459,351))

# generating more data
?cumsum
data$num_obs
cumsum(data$num_obs)

data$right = cumsum(data$num_obs) + 30 * c(0:(nrow(data) -1))
data$left = data$right - data$num_obs

# Plot
ggplot(data, aes(ymin = 0)) +
  geom_rect(aes(xmin = left, xmax = right,
                ymax = valor, colour = grupo, fill = grupo)) +
                xlab("Número de Observações") + ylab("Valor")

# using mtcars
head(mtcars)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point()

# We can map out the color of the points
ggplot(data = mtcars,
       aes(x = disp, y = mpg,
           colour = as.factor(am))) + geom_point()

# we can also map a continuous variable do the colors
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl)) + geom_point()

# mapping the size of the points to a interest variable
ggplot(mtcars, aes(x = disp, y = mpg, colour = cyl, size = wt)) + geom_point()

# the geoms define wich geometry will be used to the data visualization
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) + geom_boxplot()

# Histograms
ggplot(mtcars, aes(x = mpg), binwidth = 30) + geom_histogram()

# Bar Plot
ggplot(mtcars, aes(x = as.factor(cyl))) + geom_bar()

# personalizing graphs
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg,
                   colour = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg,
                   fill = as.factor(cyl))) + geom_boxplot()

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg)) +
  geom_boxplot(color = "blue", fill = "seagreen4")

# Alternating axis
ggplot(mtcars,
       aes(x = mpg)) +
  geom_histogram() +
  xlab("Milhas por Galão") + ylab("Frequência")

# Legends
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) +
  geom_bar() +
  labs(fill = "cyl")

# changing legend position
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl") +
  theme(legend.position = "top")

# No legend
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  guides(fill = FALSE)

# Facets
ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() + 
  facet_grid(am~.)

ggplot(mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
  geom_point() + 
  facet_grid(.~am)

# Different plots together(not the same as facets)
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)

# Diamonds dataset
?data
data(diamonds)

# Histogram as plot1
plot1 <- qplot(price, data = diamonds, binwidth = 1000)

# Scatterplot as plot2
plot2 <- qplot(carat, price, data = diamonds, colour = cut)

# Combines the two plots in the same area
grid.arrange(plot1, plot2, ncol = 1)

# Density graphs
ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5)

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5, alpha = 0.2)

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5, position = "fill")

# facets with reshape
install.packages("reshape2")
install.packages("plotly")
library(reshape2)
library(plotly)

sp <- ggplot(tips, aes(x = total_bill, y = tip/total_bill)) + geom_point(shape = 1)
sp + facet_grid(sex ~ .)
ggplotly()
sp + facet_grid(. ~ sex)
ggplotly()
sp + facet_wrap( ~ day, ncol = 2)
ggplotly()

ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~manufacturer)
ggplotly()
