# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# R types

# Numeric - All numbers are created as numeric mode
# they are stored as decimal numbers(double)
num1 <- 7
num1
class(num1)
mode(num1)
typeof(num1)

num2 = 16.82
num2
mode(num2)
typeof(num2)

# Integer
# We can convert numeric types to integer
is.integer(num2)
y = as.integer(num2)
class(y)
mode(y)
typeof(y)

as.integer('3.17')
as.integer("Joe")
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)
as.integer('TRUE')

# Character
char1 = 'A'
char1
mode(char1)
typeof(char1)

char2 = "cientista"
char2
mode(char2)
typeof(char2)

char3 = c("Data", "Science", "Academy")
char3
mode(char3)
typeof(char3)

# Complex
compl = 2.5 + 4i
compl
mode(compl)
typeof(compl)

sqrt(-1)
sqrt(-1+0i)
sqrt(as.complex(-1))

# Logical
x = 1; y = 2
z = x > y
z
class(z)

u = TRUE; v = FALSE
class(u)
u & v
u | v
!u

# 0 operations
5/0
0/5

# Error
'Joe'/5
