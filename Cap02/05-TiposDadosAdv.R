# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# Vector: 1 dimension and one type of data
vector1 <- c(1:20)
vector1
length(vector1)
mode(vector1)
class(vector1)
typeof(vector1)

# Matrix : 2 dimensions and one type of data
matrix1 <- matrix(1:20, nrow=2)
matrix1
length(matrix1)
mode(matrix1)
class(matrix1)
typeof(matrix1)

# Array : 2 or more dimensions and one type of data
array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
mode(array1)
class(array1)
typeof(array1)

# Data Frames: different dataypes. basically a matrix that supports multiple types
# of objects
View(iris)
length(iris)
mode(iris)
class(iris)
typeof(iris)

# Lists:  different object collection
# Differente dataypes are possible and common
list1 <- list(a = matrix1, b = vector1)
list1
length(list1)
mode(list1)
class(list1)
typeof(list1)

# Functions can be interpret as objects in R
rm(func1)
func1 <- function(x) {
  var1 <- x * x
  return(var1)
}

func1(5)
class(func1)

# Removing objects
objects()
rm(array1, func1)
objects()
