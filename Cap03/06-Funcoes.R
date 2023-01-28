setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\Cap03")
getwd()

# Help
?sample
args(sample)
args(mean)
args(sd)

# Built-in functions
abs(-43)
sum(c(1:5))
mean(c(1:5))
round(c(1.1:5.8))
rev(c(1:5))
seq(1:5)
sort(rev(c(1:5)))
append(c(1:5), 6)

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2

# Functions as parameters for functions
plot(rnorm(10))
mean(c(abs(vec1), abs(vec2)))

# Creating our own functions
myfunc <- function(x) {x + x}
myfunc(10)
class(myfunc)

myfunc2 <- function(a, b) {
  valor = a ^ b
  print(valor)
}
myfunc2(3, 2)

jogando_dados <- function() {
  num <- sample(1:6, size = 1) #Local
  num
}

jogando_dados()

# Scope
print(num)
num <- c(1:6)
num #Global

# Function without fixed number of arguments
vec1 <- c(10:13)
vec2 <- c("a", "b", "c", "d")
vec3 <- c(6.5, 9.2, 11.9, 5.1)

my_func3 <- function(...) {
  df = data.frame(cbind(...))
  print(df)
}

my_func3(vec1)
my_func3(vec2, vec3)
my_func3(vec1, vec2, vec3)

# Built-in functions - don't try to reinvent the wheel
# Efficiency difference between vectorized function and "R vectorized function"
x <- 1:10000000

# simple square root calculation function
my_sqrt <- function(numbers) {
  resp <- numeric(length(numbers))
  for(i in seq_along(numbers)) {
    resp[i] <- sqrt(numbers[i])
  }
  return (resp)
}

?seq_along

system.time(x2a <- my_sqrt(x))
system.time(x2b <- sqrt(x))

identical(x2a, x2b)
?identical
