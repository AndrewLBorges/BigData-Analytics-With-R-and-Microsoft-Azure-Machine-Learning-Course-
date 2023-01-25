# Setting up working directory
setwd("C:\Users\Andrew\OneDrive\Documentos\Pessoal\Cursos\DSA\BigDataRAzure\Cap2")
getwd()

# Creating Matrices

# Number o rows
matrix (c(1, 2, 3, 4, 5, 6), nr = 2)
matrix (c(1, 2, 3, 4, 5, 6), nr = 3)
matrix (c(1, 2, 3, 4, 5, 6), nr = 4)

# Number of columns
matrix (c(1, 2, 3, 4, 5 ,6), nc = 2)

# Help
?matrix

# matrices need a number of elements that is a multiple of the number of rows
matrix (c(1, 2, 3, 4 ,5), nc = 2)

# Creating matrices from vectors and filling through the rows
my_data = c(1:10)
matrix(data = my_data, nrow = 5, ncol = 2, byrow = T)
matrix(data = my_data, nrow = 5, ncol = 2)

# Slicing 
mat <- matrix(c(2, 3, 4 ,5), nr = 2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]

# Creating a diagonal matrix
matrix = 1:3
diag(matrix)

# Extracting vector from a diagonal matrix
vector = diag(matrix)
vector
diag(vector)

# Transposes the matrix
W <- matrix (c(2, 4, 8, 12), nr = 2, ncol = 2)
W
t(W)
U <- t(W)
U

# Getting the inverse matrix
solve(W)

# Matrix operations
mat1 <- matrix(c(2, 3, 4, 5), nr = 2)
mat1
mat2 <- matrix(c(6, 7, 8, 9), nr = 2)
mat2
mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2

# Multiplying matrices with vector
x = c(1:4)
x
y <- matrix(c(2, 3, 4, 5), nr = 2)
x * y

# Naming matrix
mat3 <- matrix(c('Terra', 'Marte', 'Saturno', 'Netuno'), nr = 2)
mat3
dimnames(mat3) = (list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))
mat3

# Identifyng rows and columns while creating the matrix
matrix (c(1, 2, 3, 4), nr = 2, nc = 2, dimnames = list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))

# Combining matrices
mat4 <- matrix(c(2, 3, 4, 5), nr = 2)
mat4
mat5 <- matrix(c(6, 7, 8, 9), nr = 2)
mat5
cbind(mat4, mat5)
rbind(mat4, mat5)

# Deconstructing the matrix
c(mat4)
