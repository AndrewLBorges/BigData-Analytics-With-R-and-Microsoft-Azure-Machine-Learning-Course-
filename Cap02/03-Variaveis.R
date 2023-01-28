# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# Creating Variables
var1 = 100
var1
mode(var1)
help("mode")
sqrt(var1)

# assigning the value of a variable to another one
var2 = var1
mode(var2)
typeof(var2)
help("typeof")

# A variable can be assigned a list of elements
var3 = c("first", "second", "third")
var3
mode(var3)

# A variable can be assigned a function
var4 = function(x) {x+3}
var4
mode(var4)

# changing the mode of the data
var5 = as.character(var1)
var5
mode(var5)

# Assigning values to objects
x <- c(1,2,3)
x
c(1,2,3) -> y
y
assign("x", c(6,3,4,-2))
x
help("assign")


# Getting and value from a list using index
x[1]

# Veryfing objects
ls()
objects()

# Removing objects
rm(x)
x
