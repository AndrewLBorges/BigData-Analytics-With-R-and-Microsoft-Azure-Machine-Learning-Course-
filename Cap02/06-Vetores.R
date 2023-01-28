# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# string vector
string_vector = c("Data", "Science", "Academy")
string_vector

# float vector
float_vector = c(1.90, 45.3, 300.5)
float_vector

# complex number vector
complex_vector = c(5.2+3i, 3.8+4i)
complex_vector

# logic values vector
logic_vector = c(TRUE, FALSE, TRUE, FALSE, FALSE)
logic_vector

# integer vector
integer_vector = c(2,4,6)
integer_vector

# using seq
vector1 = seq(1:10)
vector1
is.vector(vector1)

# using rep
vector2 = rep(1:5)
vector2
is.vector(vector2)

# vector indexing
a <- c(1,2,3,4,5)
a
a[1]
a[6]

b <- c("Data", "Science", "Academy")
b
b[1]
b[2]
b[3]
b[4]

# Combining vectors
v1 = c(2,3,5)
v2 = c("aa", "bb", "cc", "dd", "ee")
c(v1,v2)

# vector operations
x = c(1, 3, 5 ,7)
y = c(2, 4, 6, 8)

x * 5
x + y
x - y
x * y
x / y

# Summing up vectors with differente number of elements
alfa = c(10,20,30)
beta = c(1,2,3,4,5,6,7,8,9)
alfa + beta

# named vector
v = c("Nelson", "Mandela")
v
names(v) = c("Nome", "Sobrenome")
v
v["Nome"]
