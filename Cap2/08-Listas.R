# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# Using list() to create lists
list_character1 = list('A', 'B', 'C')
list_character1
list_character2 = list(c("A", "A"), 'B', 'C')
list_character2
list_character3 = list(matrix(c("A", "A", "A", "A"), nr = 2), 'B', 'C')
list_character3

# List of whole numbers
integer_list = list(2, 3, 4)
integer_list

# List of floats
numeric_list = list(1.90, 45.3, 300.5)
numeric_list

# List of complex numbers
complex_list = list(5.2+3i, 2.4+8i)
complex_list

# List of logic values
logic_list = list(TRUE, FALSE, FALSE)
logic_list

# composite list
composite_list = list("A", 3, TRUE)
composite_list

list1 <- list(1:10, c("Zico", "Ronaldo", "Garrincha"), rnorm(10))
list1

?rnorm

# Slicing the list
list1[1]
list1[c(1,2)]
list1[2]
list1[[2]][1]
list1[[2]][1] = "Monica"
list1

# Naming lists
names(list1) <- c("Inteiros", "Caracteres", "numericos")
list1

vec_num <- 1:4
vec_char <- c("A", "B", "C", "D")

lista2 <- list(Numeros = vec_num, Letras = vec_char)
lista2

# Naming elements directly
list2 <- list(element1 = 3:5, element2 = c(7.2, 3.5))
list2

# Working with specific elements within the list
names(list1) <- c("inteiros", "caracteres", "numericos")
list1

list1$caracteres
length(list1$inteiros)
list1$inteiros

length(list1)

# Getting specific element from within a list element(if present)
list1$caracteres[2]

mode(list1$numericos)
mode(list1$caracteres)

# Combining lists
list3 = c(list1, list2)
list3

# Transforming vector to list
v = c(1:3)
v
l = as.list(v)
l

# combining two elements to a list
mat = matrix(1:4, nrow = 2)
mat
vec = c(1:9)
vec
lst = list(mat, vec)
lst
